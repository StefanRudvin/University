<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
  <title>Contact me</title>

  <!-- Bootstrap -->
  <link href="css/bootstrap.min.css" rel="stylesheet">

  <link href="css/home.css" rel="stylesheet">

  <script>

  function goBack() {
    window.history.back();
  }


  </script>
  <?php
    include('head.php');
   ?>

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
    }
    body {
      padding-top: 40px;
      padding-bottom: 40px;
      background-color: #eee;
    }
  </style>
</head>

<body>

  <?php
    include('header.php');
   ?>

<div class="container">
  <div class="jumbotron">
    <h1>Thanks!</h1>
    <p>Social Media</p>
  </div> <!-- jumbotron -->
</div>


<div class="container">
  <?php
    // First make sure post information is secure
    $name = $email = $comment = "";

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
      $name = test_input($_POST["fname"]);
      $email = test_input($_POST["email"]);
      $comment = test_input($_POST["comment"]);
    }

    function test_input($data) {
      $data = trim($data);
      $data = stripslashes($data);
      $data = htmlspecialchars($data);
      return $data;
    }

    // Script to make sure variables are set:

    $name = $_POST['fname'];
    $email = $_POST['email'];
    $comment = $_POST['comment'];

    if(!isset($name) || trim($name) == '')
    {
       echo '<h3>You did not fill out the name field.</h3>';
    }
    elseif (!preg_match("/^[a-zA-Z ]*$/",$name))
    {
      echo '<h3>Invalid name.</h3>';
    }
    elseif(!isset($email) || trim($email) == '')
    {
       echo '<h3>You did not fill out the email field.</h3>';
    }
    elseif (!filter_var($email, FILTER_VALIDATE_EMAIL))
    {
      echo '<h3>Invalid email.</h3>';
    }
    elseif(!isset($comment) || trim($comment) == '')
    {
       echo '<h3>You did not fill out the comment field.</h3>';
    }
    else
    {
      echo '<h3>Thanks for your contact request, '. $name . '.<br>
      We will get back to you to: '. $email .'</h3>';
    }

    ?>
  <p>
    <a href="home.php"><button type="button" class="btn btn-primary">Return Home</button></a>
    <button type="button" onclick="goBack()" class="btn btn-primary">Back</button>
  </p>
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
