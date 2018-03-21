<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Signin Template for Bootstrap</title>

    <!-- Bootstrap Core CSS -->
    <!-- Bootstrap Core CSS -->
    <link href="${request.contextPath}/Application/css/bootstrap.min.css"
          rel="stylesheet">

    <!-- Theme CSS -->
    <link href="${request.contextPath}/Application/css/signin.css"
          rel="stylesheet">

    <!-- JqueryUI CSS -->
    <link href="${request.contextPath}/Application/css/jquery-ui.min.css"
          rel="stylesheet">



    <!-- Custom Fonts -->
    <link
            href="${request.contextPath}/Application/font-awesome/css/font-awesome.min.css"
            rel="stylesheet" type="text/css">
    <!-- Custom CSS -->
    <link href="${request.contextPath}/Application/css/calendar.css"
          rel="stylesheet">
    <!-- Custom CSS -->
    <link href="${request.contextPath}/Application/css/custom.css"
          rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<script>
    // This is called with the results from from FB.getLoginStatus().
    function statusChangeCallback(response) {
        console.log('statusChangeCallback');
        console.log(response);
        // The response object is returned with a status field that lets the
        // app know the current login status of the person.
        // Full docs on the response object can be found in the documentation
        // for FB.getLoginStatus().
        if (response.status === 'connected') {
            // Logged into your app and Facebook.
            testAPI();
        } else if (response.status === 'not_authorized') {
            // The person is logged into Facebook, but not your app.
            document.getElementById('status').innerHTML = 'Please log ' +
                    'into this app.';
        } else {
            // The person is not logged into Facebook, so we're not sure if
            // they are logged into this app or not.
            document.getElementById('status').innerHTML = 'Please log ' +
                    'into Facebook.';
        }
    }

    // This function is called when someone finishes with the Login
    // Button.  See the onlogin handler attached to it in the sample
    // code below.
    function checkLoginState() {
        FB.getLoginStatus(function(response) {
            statusChangeCallback(response);
        });
    }

    window.fbAsyncInit = function() {

        FB.init({
            appId      : '518000101712140',
            cookie     : true,  // enable cookies to allow the server to access
                                // the session
            //channelUrl : '//http://104.131.41.129:8080/channel.html',
            xfbml      : true,  // parse social plugins on this page
            version    : 'v2.5' // use version 2.2
        });

        // Now that we've initialized the JavaScript SDK, we call
        // FB.getLoginStatus().  This function gets the state of the
        // person visiting this page and can return one of three states to
        // the callback you provide.  They can be:
        //
        // 1. Logged into your app ('connected')
        // 2. Logged into Facebook, but not your app ('not_authorized')
        // 3. Not logged into Facebook and can't tell if they are logged into
        //    your app or not.
        //
        // These three cases are handled in the callback function.

        FB.getLoginStatus(function(response) {
            statusChangeCallback(response);
        });

    };

    // Load the SDK asynchronously

    (function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/en_US/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

    // Here we run a very simple test of the Graph API after login is
    // successful.  See statusChangeCallback() for when this call is made.
    function testAPI() {
        console.log('Welcome!  Fetching your information.... ');
        FB.api('/me?fields=name,email', function(response) {
            console.log('Successful login for: ' + response.name);
            console.log(response);
            document.getElementById('status').innerHTML =
                    'Thanks for logging in, ' + response.name + '!';
        });
    }



</script>

<div class="container" id="wrapper">
    <div></div>

    <form class="form-signin">
        <h2 class="form-signin-heading">Please sign in</h2>
        <label for="inputEmail" class="sr-only">Email address</label>
        <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="inputPassword" class="form-control" placeholder="Password" required>
        <div class="checkbox">
            <label>
                <input type="checkbox" value="remember-me"> Remember me
            </label>
        </div>
        %{--<fb:login-button size="large" scope="public_profile,email" onlogin="fb_login();">Continue With Facebook--}%
        %{--</fb:login-button>--}%
        <input name="loginFacebook" value="Continue With Facebook" onclick="" class="btn btn-lg btn-primary btn-block" id="loginFacebook">
        <g:submitButton name="login" value="Login" action="check" class="btn btn-lg btn-primary btn-block" />
        <g:actionSubmit value="Register" action="register" controller="application" class="btn btn-lg btn-primary btn-block"  />
    </form>


</div> <!-- /container -->
<!-- jQuery -->
<script src="${request.contextPath}/Application/js/jquery.js"></script>
<script src="${request.contextPath}/Application/js/login.js"></script>
<script src="${request.contextPath}/Application/js/jqueryUI.js"></script>
<script src="${request.contextPath}/Application/js/jquery-ui.min.js"></script>
<script src="${request.contextPath}/Application/js/jquery-ui.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="${request.contextPath}/Application/js/bootstrap.min.js"></script>
</body>
</html>
