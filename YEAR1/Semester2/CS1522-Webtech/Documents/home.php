<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags


START SERVER::

php -S localhost:8080


-->
  <title>Social Media</title>

  <!-- Bootstrap -->
  <link href="css/bootstrap.min.css" rel="stylesheet">

  <link href="css/home.css" rel="stylesheet">

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

  </style>
</head>
<body>
<!-- navBar-->
<?php
  include('header.php');
 ?>

<!-- Header v1-->
<div class="container">
  <div class="jumbotron">
    <h1>Social Media</h1>
    <p> Developing Understanding, Infrastructure &amp; Engagement</p>

  </div> <!-- jumbotron -->
</div>

<?php
  include('./content/homecontent.php');
 ?>

<?php
  include('footer.php');
 ?>


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>
</body>
</html>
