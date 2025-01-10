<!doctype html>
<!--[if IE 6 ]><html lang="en-us" class="ie6"> <![endif]-->
<!--[if IE 7 ]><html lang="en-us" class="ie7"> <![endif]-->
<!--[if IE 8 ]><html lang="en-us" class="ie8"> <![endif]-->
<!--[if (gt IE 7)|!(IE)]><!-->
<html lang="en-us">
<!--<![endif]-->

<head>
    <meta charset="utf-8">
    <title>{{$general_setting->site_title}}</title>
    <meta name="description" content="">
    <meta name="author" content="{{$general_setting->developed_by}}">
    <meta name="copyright" content="{{$general_setting->developed_by}}">
    <meta name="generator" content="Documenter v2.0 http://rxa.li/documenter">
    <meta name="date" content="2017-04-26T00:00:00+02:00">
    <link rel="icon" type="image/png" href="{{url('logo', $general_setting->site_logo)}}" />
    <!-- Google fonts - Roboto -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:400,700">
    <link rel="stylesheet" href="read_me/assets/css/documenter_style.css" media="all">
    <link rel="stylesheet" href="read_me/assets/css/jquery.mCustomScrollbar.css" media="all">

    <script src="read_me/assets/js/jquery.js"></script>
    <script src="read_me/assets/js/jquery.scrollTo.js"></script>
    <script src="read_me/assets/js/jquery.easing.js"></script>
    <script src="read_me/assets/js/jquery.mCustomScrollbar.js"></script>
    <script>
    document.createElement('section');
    var duration = '500',
        easing = 'swing';
    </script>
    <script src="read_me/assets/js/script.js"></script>
</head>

<body>
    <div id="documenter_sidebar">
    	<a href="{{ URL::previous() }}"><img src="{{url('logo', $general_setting->site_logo)}}" style="border: none;margin: 20px 20px 0;width: 180px"></a>
        <ul id="documenter_nav">
            <li><a href="#install">Install</a></li>
            <li><a href="#update">Software Update</a></li>
            <li><a href="#product">Product</a></li>
            <li><a href="#category">Category</a></li>
            <li><a href="#brand">Brand</a></li>
            <li><a href="#slider">Slider</a></li>
            <li><a href="#menu">Menu</a></li>
            <li><a href="#collection">Collection</a></li>
            <li><a href="#pages">Pages</a></li>
            <li><a href="#widget">Widgets</a></li>
            <li><a href="#faq">FAQs</a></li>
            <li><a href="#social">Social Links</a></li>
            <li><a href="#payment">Payment Gateways</a></li>
            <li><a href="#setting">Setting</a></li>
            <li><a href="#video_tutorial">Video Tutorial</a></li>
            <li><a href="#support">Support</a></li>
        </ul>
    </div>
    <div id="documenter_content">
        <section id="install">
            <div class="page-header">
                <h3>Install SalePro eCommerce Add-on</h3>
                <hr class="notop">
            </div>
            <p>It is presumed that you already have SalePro installed on your server. If you login to SalePro, you should see 'Addon List' menu item on your admin panel/dashboard sidebar. Click 'Addon List' and on the following page you should see 'SalePro eCommerce' listed along with other Add-ons. Unless already installed, it should show 'Buy Now' and 'Install' button. When installed, it will show 'Update' button.</p>
            <p>To purchase this addon click the 'Buy Now' button. If you have already purchased, click the 'Install' button</p>
            <p>
                <img alt="" src="read_me/assets/images/ecommerce-installation1.png">
            </p>
            <p>Type your purchase key which you will get from the envato during the purchase. Then click on the submit button. If your purchase key is correct then the addon will be installed automatically and you will see a new option on the left side bar named eCommerce.</p>
            <p>
                <img alt="" src="read_me/assets/images/ecommerce-installation2.png">
            </p>
            <p>If you go to the eCommerce menu on dashboard sidebar, you'll see all necessary options to manage an eCommerce store - both backend and CMS/frontend.</p>
        </section>
        <section id="update">
            <div class="page-header">
                <h3>SOFTWARE UPDATE</h3>
                <hr class="notop">
            </div>
            <p>When we release an update you can update it automatically from the addon list page. You'll have to insert your purchase code for updating the system (just like installation) and updates will be automatically imported to your server and installed</p>
            <p>
                <img alt="" src="read_me/assets/images/ecommerce-update.png">
            </p>
        </section>
        <section id="product">
            <div class="page-header">
                <h3>PRODUCT</h3>
                <hr class="notop">
            </div>

            <p>Adding product for eCommerce is just like adding product for POS/inventory in SalePro.In addition to existing input fileds on <a href="{{url('/products/create')}}">'Add Product'</a> page, few eCommerce specific input fields are added. These input options are listed right at the bottom of the 'Add Product' page.</p>
            <p>
                <img alt="" src="read_me/assets/images/ecommerce-product.png">
            </p>
            <h4>Sell product online</h4>
            <p>By default 'Sell Online' option is checked. If you don't want to list some of your products on your eCommerce website, uncheck the checkbox while adding/editing those products.</p>
            <p><strong>Note: </strong>If you have been using SalePro before purchasing the eCommerce add-on, you'll have to edit the products you want to list on your eCommerce website and check this option for those products.</p>
            <h4>In Stock</h4>
            <p>Products listed on your eCommerce website will show 'Add to cart' button if the 'In Stock' option is checked. Otherwise, it will show 'out of stock'</p>

            <h4>Product Tags</h4>
            <p>While adding/editing a product, please insert relevant tags, keywords as these will assist product search option</p>

            <h4>Product Meta Title and Meta Description</h4>
            <p>While adding/editing a product, please insert unique meta title and meta description for that specific product. These information will help serch engines to index/list the pages on their search results, thereby improve your sales potential.</p>
        </section>
        <section id="category">
            <div class="page-header">
                <h3>CATEGORY</h3>
                <hr class="notop">
            </div>
            <p>Category add/edit options are just like SalePro. Few eCommerce specific input fields are added. These input options are listed right at the bottom of the 'Add Category' modal on <a href="{{url('/category')}}">'Category'</a> page in your admin panel. While adding/editing a category, please insert unique meta title and meta description for that specific category. These information will help serch engines to index/list the pages on their search results, thereby improve your sales potential.</p>
            <p>
                <img alt="" src="read_me/assets/images/ecommerce-category1.png">
            </p>
            <p>Upload an image under 'Icon' label and check 'List on catgeory dropdown' checkbox, if you want to show the categroy on the website's header dropdown (see below image)</p>
            <p>
                <img alt="" src="read_me/assets/images/ecommerce-category2.png">
            </p>
        </section>
        <section id="brand">
            <div class="page-header">
                <h3>BRAND</h3>
                <hr class="notop">
            </div>
            <p>Brand add/edit options are just like SalePro. Few eCommerce specific input fields are added. These input options are listed right at the bottom of the 'Add Brand' modal on <a href="{{url('/brand')}}">'Brand'</a> page in your admin panel. While adding/editing a brand, please insert unique meta title and meta description for that specific brand. These information will help serch engines to index/list the pages on their search results, thereby improve your sales potential.</p>
            <p>If you want to show/list brands on your website, upload brand logos on brand add/edit page.</p>

            <p>
                <img alt="" src="read_me/assets/images/ecommerce-brand.png">
            </p>
        </section>
        <section id="slider">
            <div class="page-header">
                <h3>SLIDER</h3>
                <hr class="notop">
            </div>
            <p>Go to the <a href="{{url('/sliders')}}">'Sliders'</a> page from eCommerce dropdown in your admin panel. Click add slider, insert the relevant info and upload images.</p>
            <p>You can choose to upload one image for all device size/responsive view points or you can upload three different images trageting specific device sizes, like - large devices (laptops & desktops), tabs & mobiles.</p>
            <ul>
                <li>Large devices - 1090 X 460 </li>
                <li>Medium devices - 1090 X 460 </li>
                <li>Small devices - 650 X 460 </li>
            </ul>

            <p>
                <img alt="" src="read_me/assets/images/ecommerce-slider.png">
            </p>
        </section>
        <section id="menu">
            <div class="page-header">
                <h3>MENU</h3>
                <hr class="notop">
            </div>
            <p>First create Menu on <a href="{{url('/menu')}}">'Menu'</a> page listed in eCommerce dropdown in your admin panel sidebar. If you want to create a menu for the header section/main navigation of your website, choose 'Main navigation' as location from location dropdown. You can create menus for footer widgets here and later choose these menus for footer widget on <a href="{{url('/widget')}}">'Widgets'</a> page.</p>
            <p>
                <img alt="" src="read_me/assets/images/ecommerce-menu1.png">
            </p>
            <p>After you create menu, you need to insert menu items. You'll see an 'eye icon' on green button on each row on 'Menu' table (see above image). On clicking it, it will take you to menu items/details page. 'Categories','Collections','Brands', 'Pages', 'Custom Links' on the left pane and a right pane for menu structure/menu tree. Check your desired menu items on each section on the left pane and click 'Add to menu' button at the bottom of assciated section to add the items to the right pane. When the items are already on the right pane, you can drag nad drop them to change their order or create nested menus</p>
            <p>
                <img alt="" src="read_me/assets/images/ecommerce-menu2.png">
            </p>
        </section>
        <section id="faq">
            <div class="page-header">
                <h3>FAQ</h3>
                <hr class="notop">
            </div>
            <p>First create categories for FAQs on <a href="{{url('/faq/categories')}}">'FAQ Categories'</a> page listed in eCommerce dropdown in your admin panel sidebar. Categories you create will then be available on <a href="{{url('/ecom-faq/')}}">FAQ page</a>. You can add Frequently asked questions on FAQ page and organise them under different categories.</p>
            <p>
                <img alt="" src="read_me/assets/images/ecommerce-faq.png">
            </p>

        </section>
        <section id="social">
            <div class="page-header">
                <h3>Social Links</h3>
                <hr class="notop">
            </div>
            <p>You can create links to your social profiles on <a href="{{url('/social')}}">'social Links'</a> page listed in eCommerce dropdown in your admin panel sidebar.</p>
            <p>
                <img alt="" src="read_me/assets/images/ecommerce-social.png">
            </p>
        </section>
        <section id="payment">
            <div class="page-header">
                <h3>Payment Gateways</h3>
                <hr class="notop">
            </div>
            <p>You'll see available payment gateways on <a href="{{url('/payment-gateways')}}">'Payment Gateways'</a> page listed in eCommerce dropdown in your admin panel sidebar.</p>
            <p>You can activate/deactivate gateways by clicking 'Activate' switch on the right side of each gateway title/name. Please replace the dummy infomation for each active gateways with actual details</p>

            <p>
                <img alt="" src="read_me/assets/images/ecommerce-payment.png">
            </p>
        </section>
        <section id="setting">
            <div class="page-header">
                <h3>SETTINGS</h3>
                <hr class="notop">
            </div>
            <h2><strong>Add Role</strong></h2>
            <p>You can create, edit and delete user roles. You can controll user access by changing the role permission. So, under a certain role users have specific access over this software</p>
            <p>
                <img alt="" src="read_me/assets/images/role1.png">
            </p>
            <h2><strong>Add Warehouse</strong></h2>
            <p>You can create, edit and delete warehouse. You can also import warehouse with CSV file. <strong>You must follow the instruction to import data from CSV.</strong></p>
            <p>
                <img alt="" src="read_me/assets/images/warehouse1.png">
            </p>
            <h2><strong>Add Customer Group</strong></h2>
            <p>
                You can create, edit and delete customer group. Different customer group has different price over the product. You can modify this by changing price percentage in Customer Group module.
            </p>
            <p>
                You can also import customer group with CSV file. <strong>You must follow the instruction to import data from CSV.</strong>
            </p>
            <p>
                <img alt="" src="read_me/assets/images/customer_group1.png">
            </p>
            <h2><strong>Add Brand</strong></h2>
            <p>You can create, edit and delete product brand. You can also import brand with CSV file. <strong>You must follow the instruction to import data from CSV.</strong></p>
            <p>
                <img alt="" src="read_me/assets/images/brand1.png">
            </p>
            <h2><strong>Add Unit</strong></h2>
            <p>You can create, edit and delete product unit. You can also import brand with CSV file. <strong>You must follow the instruction to import data from CSV.</strong></p>
            <p>
                <img alt="" src="read_me/assets/images/unit1.png">
            </p>
            <h2><strong>Add Tax</strong></h2>
            <p>You can create, edit and delete different product tax. You can also import tax with CSV file. <strong>You must follow the instruction to import data from CSV.</strong></p>
            <p>
                <img alt="" src="read_me/assets/images/tax1.png">
            </p>
            <p>And you can search, export and print data from table that we discussed in <a href="#product">Product</a> section.</p>
            <h2><strong>General Settings</strong></h2>
            <p>You can change Site Title, Site Logo, Currency, Time Zone, Staff Access, Date Format and Theme Color from general settings</p>
            <h2><strong>User Profile</strong></h2>
            <p>You can update user profile info from this module</p>
            <h2><strong>POS Settings</strong></h2>
            <p>You can set your own POS settings from this module. You can set default customer, biller, warehouse and how many Featured products will be displayed in the POS module. You have to set your <strong>Stripe</strong> public and private key for Credit Card Payment. To implement payment with <strong>Paypal</strong> you have to buy live api from Paypal. You will also need to fillup the following information.
            </p>
            <p>
                <img alt="" src="read_me/assets/images/pos1.png">
            </p>
            <h2><strong>HRM Setting</strong></h2>
            <p>You can set default CheckIn and CheckOut time in HRM Setting.</p>
            <h2><strong>SMS Setting</strong></h2>
            <p>You can use Bulk SMS service via <strong>Twilio</strong> and <strong>Clickatell</strong>. You just have to fill the information correctly to activate this service. <strong>Please provide country code to send sms.</strong></p>
        </section>
        <section id="video_tutorial">
            <div class="page-header">
                <h3>VIDEO TUTORIAL</h3>
                <hr class="notop">
            </div>
            <p>
                <iframe width="560" height="315" src="https://www.youtube.com/embed/videoseries?list=PLsh7QWvPhxo4_hu-i3B-0VEgy7oGM0ReH" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
        </section>
        <section id="support">
            <div class="page-header">
                <h3>SUPPORT</h3>
                <hr class="notop">
            </div>
            <p>We are happy to provide support for any issues within our software. We also provide customization service for as little as $15/hour. So if you have any features in mind or suugestions, please feel free to contact us at <a href="https://lion-coders.com/support"><strong>Support</strong></a>. Please note that we don't provide support though any other means (example- whatsapp, comments etc.). So, please refrain from commenting your queries on codecanyon or kocking us elsewhere.</p>
            <p>Also, in case of any errors/bugs/issues on your installation, please contact us with your hosting details (url, username, password), software admin access (url, username, password) and purchase code. If your support period has expired, please renew support on codecanyon before contacting us for support.</p>
            <p>Thank you and  best wishes from {{$general_setting->developed_by}}</p>
        </section>
    </div>
    <script type="text/javascript">
    	$("#documenter_sidebar").mCustomScrollbar({
            theme: "light",
            scrollInertia: 200
        });
    </script>
</body>

</html>
