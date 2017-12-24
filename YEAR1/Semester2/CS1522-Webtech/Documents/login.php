

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
  <title>Social Media</title>

  <!-- Bootstrap -->
  <link href="css/bootstrap.min.css" rel="stylesheet">

  <link href="css/home.css" rel="stylesheet">

  <?php
    include('head.php');
   ?>

   <script>

   function validate() {
       var username = document.forms["myForm"]["username"].value;
       var password = document.forms["myForm"]["password"].value;

       if (username != "admin" || password != "admin") {
         alert('Invalid username or password')
         return false;
       }

     }

   </script>

  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <style>

    html,body{
      margin:0;
      padding:0;
      height:100%;
      width:100%;
    }

    html {
      background: url(./images/wallpaper.jpg) no-repeat center center fixed;
      -webkit-background-size: cover;
      -moz-background-size: cover;
      -o-background-size: cover;
      background-size: cover;
    }


    .footer{
      position: absolute;
      width: 100%;
      background-color: #1b1b1b;
      height: 60px;
      text-align: right;
      bottom: 0px;
      padding-top: 20px;
      padding-right:30px;
    }
    .jumbotron{
        background-color:#2E2D88;
        color:white;
        margin-top: 60px;
        padding-left: 15px;
    }

  </style>
</head>

<body>
<!-- navBar-->
<?php
  include('header.php');
 ?>




<div class="container">
  <div class="login">
    <form class="form-signin" name="myForm" method="post" action="admin.php" onsubmit="return validate()">

      <h2 class="form-signin-heading">Please sign in</h2>

      <label for="username" class="sr-only">Username</label>

      <input type="text" class="form-control" placeholder="Username" name="username" required autofocus>

      <label for="inputPassword" class="sr-only">Password</label>

      <input type="password" class="form-control" placeholder="Password" name="password" required>

      <div class="checkbox">
        <label><input type="checkbox" name="remember" value="remember-me">Remember me</label>
      </div>

      <button class="btn btn-lg btn-primary btn-block" type="submit" value="Log in">Log in</button>
    </form>
  </div>
</div>

<?php
  include('footer.php');
 ?>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>
</body>
</html>
