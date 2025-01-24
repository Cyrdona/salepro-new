<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>{{$general_setting->site_title}}</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <link rel="manifest" href="{{url('manifest.json')}}">
    @if(!config('database.connections.saleprosaas_landlord'))
    <link rel="icon" type="image/png" href="{{url('logo', $general_setting->site_logo)}}" />
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="<?php echo asset('vendor/bootstrap/css/bootstrap.min.css') ?>" type="text/css">
    <!-- login stylesheet-->
    <link rel="stylesheet" href="<?php echo asset('css/auth.css') ?>" id="theme-stylesheet" type="text/css">
    <!-- Google fonts - Roboto -->
    <link rel="preload" href="https://fonts.googleapis.com/css?family=Nunito:400,500,700" as="style" onload="this.onload=null;this.rel='stylesheet'">
    <noscript><link href="https://fonts.googleapis.com/css?family=Nunito:400,500,700" rel="stylesheet"></noscript>
    @else
    <link rel="icon" type="image/png" href="{{url('../../logo', $general_setting->site_logo)}}" />
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="<?php echo asset('../../vendor/bootstrap/css/bootstrap.min.css') ?>" type="text/css">
    <!-- login stylesheet-->
    <link rel="stylesheet" href="<?php echo asset('../../css/auth.css') ?>" id="theme-stylesheet" type="text/css">
    <!-- Google fonts - Roboto -->
    <link rel="preload" href="https://fonts.googleapis.com/css?family=Nunito:400,500,700" as="style" onload="this.onload=null;this.rel='stylesheet'">
    <noscript><link href="https://fonts.googleapis.com/css?family=Nunito:400,500,700" rel="stylesheet"></noscript>
    @endif
  </head>
  <body>
    <div class="page login-page">
      <div class="container">
        <div class="form-outer text-center d-flex align-items-center">
          <div class="form-inner">
            <div class="logo">
                @if($general_setting->site_logo)
                <img src="{{url('logo', $general_setting->site_logo)}}" width="110">
                @else
                <span>{{$general_setting->site_title}}</span>
                @endif
            </div>
            @if(session()->has('delete_message'))
            <div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ session()->get('delete_message') }}</div>
            @endif
            @if(session()->has('message'))
              <div class="alert alert-success alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{!! session()->get('message') !!}</div>
            @endif
            @if(session()->has('not_permitted'))
              <div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ session()->get('not_permitted') }}</div>
            @endif
            <form method="POST" action="{{ route('login') }}" id="login-form">
              @csrf
              <div class="form-group-material">
                <input id="login-username" type="text" name="name" required class="input-material" value="">
                <label for="login-username" class="label-material">{{trans('file.UserName')}}</label>
                @if(session()->has('error'))
                    <p>
                        <strong>{{ session()->get('error') }}</strong>
                    </p>
                @endif
              </div>

              <div class="form-group-material">
                <input id="login-password" type="password" name="password" required class="input-material" value="">
                <label for="login-password" class="label-material">{{trans('file.Password')}}</label>
                @if(session()->has('error'))
                    <p>
                        <strong>{{ session()->get('error') }}</strong>
                    </p>
                @endif
              </div>
              <button type="submit" class="btn btn-primary btn-block">{{trans('file.LogIn')}}</button>
            </form>
            <a href="{{ route('password.request') }}" class="forgot-pass">{{trans('file.Forgot Password?')}}</a>
            <p class="register-section">
              {{trans('file.Do not have an account?')}} 
              <a href="{{url('register')}}" class="signup register-section">{{trans('file.Register')}}</a>
            </p>
          </div>
          <div class="copyrights text-center">
            <p>{{trans('file.Developed By')}} <span class="external">{{$general_setting->developed_by}}</span></p>
          </div>
        </div>
      </div>

      @if(!env('USER_VERIFIED'))
      <div class="switch-theme" id="switch-theme" style="background-color:rgba(255,255,255,0.9);border:1px solid #999;padding:15px;position:fixed;bottom:0px;left:0px;right:0px;z-index:99">
        <div class="row">
          <div class="col-md-4 text-center">
            <!-- This three button for demo only-->
            <div class="" style="font-size:11px;color:#666;margin-bottom:15px">Login as</div>
            <button type="submit" class="btn btn-sm btn-success admin-btn">Admin</button>
            <button type="submit" class="btn btn-sm btn-info staff-btn">Staff</button>
            <button type="submit" class="btn btn-sm btn-dark customer-btn">Customer</button>
          </div>
          <div class="col-md-8 text-center">
            <hr class="d-lg-none d-md-none d-sm-block">
            <div class="text-center" style="font-size:11px;color:#666;margin-bottom:15px">Premium Add-ons</div>
            <a href="?demo_type=saleprop_salepro" class="btn btn-primary btn-sm demo-btn">Default</a>
            <a href="?demo_type=saleprop_ecom" class="btn btn-primary btn-sm demo-btn">eCommerce</a>
            <!-- <a href="?demo_type=saleprop_woo" class="btn btn-primary btn-sm demo-btn">WooCommerce</a>
            <a href="?demo_type=salepro_restaurant" class="btn btn-primary btn-sm demo-btn">Restaurant</a> -->
            <a href="https://lion-coders.com/software/salepro-saas-pos-inventory-saas-php-script"  target="_blank" class="btn btn-primary btn-sm">SAAS</a>
                        <br><br>
          </div>
        </div>
      </div>
      @endif
    </div>
  </body>
</html>
@if(!config('database.connections.saleprosaas_landlord'))
<script type="text/javascript" src="<?php echo asset('vendor/jquery/jquery.min.js') ?>"></script>
@else
<script type="text/javascript" src="<?php echo asset('../../vendor/jquery/jquery.min.js') ?>"></script>
@endif
<script>
    @if(config('database.connections.saleprosaas_landlord'))
        if(localStorage.getItem("message")) {
            alert(localStorage.getItem("message"));
            localStorage.removeItem("message");
        }
        numberOfUserAccount = <?php echo json_encode($numberOfUserAccount)?>;
        $.ajax({
            type: 'GET',
            async: false,
            url: '{{route("package.fetchData", $general_setting->package_id)}}',
            success: function(data) {
                if(data['number_of_user_account'] > 0 && data['number_of_user_account'] <= numberOfUserAccount) {
                    $(".register-section").addClass('d-none');
                }
            }
        });
    @endif
    
    $("div.alert").delay(4000).slideUp(800);

    //switch theme code
    var theme = <?php echo json_encode($theme); ?>;
    if(theme == 'dark') {
        $('body').addClass('dark-mode');
        $('#switch-theme i').addClass('dripicons-brightness-low');
    }
    else {
        $('body').removeClass('dark-mode');
        $('#switch-theme i').addClass('dripicons-brightness-max');
    }

    $('.demo-btn').on('click', function(e) {
        e.preventDefault();
        $("input[name='name']").focus().val('admin');
        $("input[name='password']").focus().val('admin');
        let form = $('#login-form');
        form.attr('action', $(this).attr('href'));
        form.submit();
    });

    
    if ('serviceWorker' in navigator ) {
        window.addEventListener('load', function() {
            navigator.serviceWorker.register('/salepro/service-worker.js').then(function(registration) {
                // Registration was successful
                console.log('ServiceWorker registration successful with scope: ', registration.scope);
            }, function(err) {
                // registration failed :(
                console.log('ServiceWorker registration failed: ', err);
            });
        });
    }

    $('.admin-btn').on('click', function(){
        $("input[name='name']").focus().val('admin');
        $("input[name='password']").focus().val('admin');
        $('#login-form').submit();
    });

    $('.staff-btn').on('click', function(){
        $("input[name='name']").focus().val('staff');
        $("input[name='password']").focus().val('staff');
        $('#login-form').submit();
    });

    $('.customer-btn').on('click', function(){
        $("input[name='name']").focus().val('james');
        $("input[name='password']").focus().val('james');
        $('#login-form').submit();
    });
  // ------------------------------------------------------- //
    // Material Inputs
    // ------------------------------------------------------ //

    var materialInputs = $('input.input-material');

    // activate labels for prefilled values
    materialInputs.filter(function() { return $(this).val() !== ""; }).siblings('.label-material').addClass('active');

    // move label on focus
    materialInputs.on('focus', function () {
        $(this).siblings('.label-material').addClass('active');
    });

    // remove/keep label on blur
    materialInputs.on('blur', function () {
        $(this).siblings('.label-material').removeClass('active');

        if ($(this).val() !== '') {
            $(this).siblings('.label-material').addClass('active');
        } else {
            $(this).siblings('.label-material').removeClass('active');
        }
    });
</script>
