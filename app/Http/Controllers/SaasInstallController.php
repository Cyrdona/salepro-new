<?php

namespace App\Http\Controllers;
use App\Http\Requests\SaasInstallationRequest;
use App\Traits\ENVFilePutContent;
use Exception;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use ZipArchive;

use Illuminate\Http\Request;

class SaasInstallController extends Controller
{
    use ENVFilePutContent;

    public function saasInstallStep1()
    {
        return view('backend.saas.step_1');
    }

    public function saasInstallStep2()
    {
        return view('backend.saas.step_2');
    }
    public function saasInstallStep3()
    {
        return view('backend.saas.step_3');
    }

    public function saasInstallProcess(SaasInstallationRequest $request)
    {

        $dataServer = self::purchaseVerify($request->purchasecode);


        if (!$dataServer->url) {
            return redirect()->back()->withErrors(['errors' => ['Wrong Purchase Code !']]);
        }

        $envPath = base_path('.env');
        if (!file_exists($envPath))
            return redirect()->back()->withErrors(['errors' => ['.env file does not exist.']]);
        elseif (!is_readable($envPath))
            return redirect()->back()->withErrors(['errors' => ['.env file is not readable.']]);
        elseif (!is_writable($envPath))
            return redirect()->back()->withErrors(['errors' => ['.env file is not writable.']]);
        else {
            try {
                $data = self::fileReceivedFromAuthorServer($dataServer->url);
                if(!$data['isReceived']) {
                    throw new Exception("The file transfer has failed. Please try again later.", 1);
                }

                self::fileUnzipAndDeleteManage($data);
                $this->envSetDatabaseCredentials($request);
                self::switchToNewDatabaseConnection($request);
                self::migrateCentralDatabase();
                self::seedCentralDatabase();
                session(['centralDomain' => $request->central_domain]);
                self::optimizeClear();

                return redirect($request->central_domain.'/saas/install/step-4');

            } catch (Exception $e) {

                return redirect()->back()->withErrors(['errors' => [$e->getMessage()]]);
            }
        }
    }


    protected static function purchaseVerify(string $purchaseCode) : object
    {

        $post_string = urlencode($purchaseCode);
        $url = 'https://lion-coders.com/api/sale-pro-saas-purchase/verify/'.$post_string;
        $ch = curl_init();
        curl_setopt($ch,CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        $result = curl_exec($ch);
        $response = json_decode($result, false);

        return $response;

    }

    protected static function fileReceivedFromAuthorServer(string $authorServerURL): array
    {
        $remoteFileName = pathinfo($authorServerURL)['basename'];
        $localFile = base_path('/'.$remoteFileName);
        $isCopied = copy($authorServerURL, $localFile);

        if ($isCopied) {
            self::removeFileFromServer($authorServerURL);
        }

        return  [
            'isReceived' => $isCopied,
            'remoteFileName' => $remoteFileName,
        ];

    }

    protected static function removeFileFromServer(string $authorServerURL) : void
    {
        $data = [
            'path' => $authorServerURL,
        ];

        $url = 'https://lion-coders.com/api/software-db/';

        $ch = curl_init(); // Initialize cURL

        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        curl_setopt($ch, CURLOPT_POSTREDIR, 3);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 3);

        $res = curl_exec($ch);

        curl_close($ch);
    }

    protected static function fileUnzipAndDeleteManage(array $data)
    {
        if ($data['isReceived']) {
            $zip = new ZipArchive;
            self::unzipAndDeleteProcessing($zip, $data['remoteFileName']);
            self::unzipAndDeleteProcessing($zip, 'saasrest.zip');
        }
    }


    protected static function unzipAndDeleteProcessing($zip, string $fileName): void
    {
        $file = base_path($fileName);
        $res = $zip->open($file);
        if ($res === TRUE) {
           $zip->extractTo(base_path());
           $zip->close();

           // ****** Delete Zip File ******
           File::delete($file);
        }
    }

    protected function envSetDatabaseCredentials($request): void
    {
        $centralDomain = self::filterURL($request->central_domain);

        $this->dataWriteInENVFile('SERVER_TYPE', $request->server_type);

        if ($request->server_type==='cpanel') {
            $this->dataWriteInENVFile('CPANEL_USER_NAME', $request->cpanel_username);
            $this->dataWriteInENVFile('CPANEL_API_KEY', $request->cpanel_api_key);
        }else{
            $this->dataWriteInENVFile('PLESK_HOST', $request->plesk_host);
            $this->dataWriteInENVFile('PLESK_USER_NAME', $request->plesk_username);
            $this->dataWriteInENVFile('PLESK_PASSWORD', $request->plesk_password);
        }

        $this->dataWriteInENVFile('CENTRAL_DOMAIN', $centralDomain);
        $this->dataWriteInENVFile('DB_PREFIX', $request->db_prefix);
        $this->dataWriteInENVFile('DB_CONNECTION', 'saleprosaas_landlord');
        $this->dataWriteInENVFile('DB_HOST', $request->db_host);
        $this->dataWriteInENVFile('DB_PORT', $request->db_port);
        $this->dataWriteInENVFile('DB_DATABASE', null);
        $this->dataWriteInENVFile('LANDLORD_DB', $request->db_name);
        $this->dataWriteInENVFile('DB_USERNAME', $request->db_username);
        $this->dataWriteInENVFile('DB_PASSWORD', $request->db_password);
    }

    protected static function filterURL(string $centralDomain): string
    {
        if (strpos($centralDomain, 'http://') === 0) {
            $url = substr($centralDomain, 7);
        }
        elseif (strpos($centralDomain, 'https://') === 0) {
            $url = substr($centralDomain, 8);
        }

        return $url = rtrim($url, '/');
    }

    public function switchToNewDatabaseConnection($request): void
    {
        DB::purge('saleprosaas_landlord');
        Config::set('database.connections.saleprosaas_landlord.host', $request->db_host);
        Config::set('database.connections.saleprosaas_landlord.database', $request->db_name);
        Config::set('database.connections.saleprosaas_landlord.username', $request->db_username);
        Config::set('database.connections.saleprosaas_landlord.password', $request->db_password);
    }

    protected static function migrateCentralDatabase(): void
    {
        Artisan::call('migrate --path=database/migrations/landlord');
    }

    protected static function seedCentralDatabase(): void
    {
        Artisan::call('db:seed');
    }

    protected static function optimizeClear(): void
    {
        Artisan::call('optimize:clear');
    }

    public function saasInstallStep4()
    {
        return view('backend.saas.step_4');
    }
}
