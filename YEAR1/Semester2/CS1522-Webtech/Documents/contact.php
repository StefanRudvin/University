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

  <script>

    function validateForm() {

        var name = document.forms["myForm"]["fname"].value;

        if (name == null || name == "") {
            $(document).ready(function(){
            $("#name").css("background-color","rgba(88,88,88,0.5)");
            $("#namealert").html("<p>Name must be provided</p>")
          });
            return false;
          }

        var email = document.forms["myForm"]["email"].value;

        if (email == null || email == "") {
          $(document).ready(function(){
          $("#email").css("background-color","rgba(88,88,88,0.5");
          $("#emailalert").html("<p>Email must be provided</p>")
        });
            return false;
        }

        var x = document.forms["myForm"]["email"].value;
        var atpos = x.indexOf("@");
        var dotpos = x.lastIndexOf(".");
        if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length) {
          $(document).ready(function(){
          $("#email").css("background-color","rgba(88,88,88,0.5");
          $("#emailalert").html("<p>Email must be valid</p>")
        });
        return false;
        }

        var comment = document.forms["myForm"]["comment"].value;

        if (comment == null || comment == "") {
          $(document).ready(function(){
          $("#comment").css("background-color","rgba(88,88,88,0.5");
          $("#commentalert").html("<p>Please Enter a comment</p>")
        });
            return false;
        }


        /*
        var checkedAtLeastOne = false;
        $('input[type="checkbox"]').each(function(){
        if ($(this).is(":checked")) {
            checkedAtLeastOne = true;
        });
        }

        if (checkedAtLeastOne == false) {
          $(document).ready(function(){
          $("#buttonalert").html("<p>Please select atleast one box</p>")
      });
        return false;
      }
      */
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
      padding-top: 20px;
      padding-bottom: 40px;
      background-color: #eee;
    }
    .input-group span{
      width: 120px;
      text-align: left;
    }
    .input-group{
      width: 100%;
    }
    .footer {
      margin-top: 20px;
      width: 100%;
      /* Set the fixed height of the footer here */
      height: 60px;
      text-align: right;
      padding-top: 20px;
      padding-right: 60px;
      background-color: #1b1b1b;
      background-image: -moz-linear-gradient(top, #222222, #111111);
      background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#222222), to(#111111));
      background-image: -webkit-linear-gradient(top, #222222, #111111);
      background-image: -o-linear-gradient(top, #222222, #111111);
      background-image: linear-gradient(to bottom, #222222, #111111);
      background-repeat: repeat-x;
      border-color: #252525;
      filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff222222', endColorstr='#ff111111', GradientType=0);
    }

    .jumbotron{
        background-color:#2E2D88;
        color:white;
        margin-top: 40px;
        padding-left: 15px;
    }
    .tab-content {
        border-left: 1px solid #ddd;
        border-right: 1px solid #ddd;
        border-bottom: 1px solid #ddd;
        padding: 10px;
    }
    .nav-tabs {
        margin-bottom: 0;
    }
    img {
        height: 300px;
        width: 300px;
    }


    .form-signin {
      max-width: 330px;
      padding: 15px;
      margin: 0 auto;
    }
    .form-signin .form-signin-heading,
    .form-signin .checkbox {
      margin-bottom: 10px;
    }
    .form-signin .checkbox {
      font-weight: normal;
    }
    .form-signin .form-control {
      position: relative;
      height: auto;
      -webkit-box-sizing: border-box;
         -moz-box-sizing: border-box;
              box-sizing: border-box;
      padding: 10px;
      font-size: 16px;
    }
    .form-signin .form-control:focus {
      z-index: 2;
    }
    .form-signin input[type="email"] {
      margin-bottom: -1px;
      border-bottom-right-radius: 0;
      border-bottom-left-radius: 0;
    }
    .form-signin input[type="password"] {
      margin-bottom: 10px;
      border-top-left-radius: 0;
      border-top-right-radius: 0;
    }
    .checkbox-inline {
      font-size:120%;
    }
  </style>
</head>

<body>

  <?php
    include('header.php');
   ?>

   <?php
     // MAIN PHP
     // First make sure post information is secure
     //Should be done with filter validate for proper security
     $fname = $email = $comment = "";
     $nameErr = $emailErr = $commentErr = "";

     // Script to make sure variables are set:

     if ($_SERVER["REQUEST_METHOD"] == "POST") {

      if (empty($_POST["fname"])) {
        $nameErr = "Name is required";
      } else {
        $name = test_input($_POST["fname"]);
        // Check for wrong characters
        if (!preg_match("/^[a-zA-Z ]*$/",$fname)) {
          $nameErr = "Only letters and white space allowed";
        }
      }

      if (empty($_POST["email"])) {
        $emailErr = "Email is required";
      } else {
        $email = test_input($_POST["email"]);
        // check if e-mail address is well-formed
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
          $emailErr = "Invalid email format";
        }
      }

      if (empty($_POST["comment"])) {
        $comment = "";
      } else {
        $comment = test_input($_POST["comment"]);
      }

    }

    ?>


<div class="container">
  <div class="jumbotron">
    <h1>Contact Us</h1>
    <p>Social Media</p>
  </div> <!-- jumbotron -->
</div>

<div class="container">
  <?php if (count($_POST)>0) echo '<h3>Thanks for your contact request, '. $name . '.<br>
  We will get back to you to: '. $email .'</h3><br>'; ?>

  <form name="myForm" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" method="post" onsubmit="return validateForm()" role="form">
    <fieldset class="fsStyle">
      <div class="input-group input-group-lg">
        <span class="input-group-addon">Your name</span>
        <input type="text" name="fname" id="name" class="form-control" maxlength="30" placeholder="Full Name" value="<?php echo $fname;?>" autofocus>
        <span class="error">* <?php echo $nameErr;?></span>
        <div id="namealert">
        </div>
      </div>

      <div class="input-group input-group-lg">
        <span class="input-group-addon">Email</span>
        <input type="text" name="email" id="email" class="form-control" maxlength="30" placeholder="@ Email Address" value="<?php echo $email;?>">
        <span class="error">* <?php echo $emailErr;?></span>
        <div id="emailalert">
      </div>
    </fieldset>

    <fieldset class="fsStyle">
      <div class="page-content">
        <h1>Type of Inquiry</h1>
      </div>
      <div class="col-lg-2 col-md-3 col-sm-3 col-xs-6">
      <label class="checkbox-inline"><input type="checkbox" name="genre[]" value="question" onclick="validate()" id="remember" >Question</label>
      </div>
      <div class="col-lg-2 col-md-3 col-sm-3 col-xs-6">
      <label class="checkbox-inline"><input type="checkbox" name="genre[]" value="Criticism">Criticism</label>
      </div>
      <div class="col-lg-2 col-md-3 col-sm-3 col-xs-6">
      <label class="checkbox-inline"><input type="checkbox" name="genre[]" value="Contact a worker">Contact a worker</label>
      </div>
      <div class="col-lg-2 col-md-3 col-sm-3 col-xs-6">
      <label class="checkbox-inline"><input type="checkbox" name="genre[]" value="Business">Business</label>
      </div>
      <div class="col-lg-2 col-md-3 col-sm-3 col-xs-6">
      <label class="checkbox-inline"><input type="checkbox" name="genre[]" value="Other">Other</label>
      </div>
    </fieldset>
    <div id="buttonalert"></div>

    <fieldset class="fsStyle">
      <div class="form-group">
        <label for="comment">Message:</label>
        <textarea placeholder="Type here" id="comment" class="form-control" rows="5" name="comment"><?php echo $comment;?></textarea>
        <div id="commentalert"></div>
      </div>
    </fieldset>
    <fieldset class="fsStyle">
      <input type="reset" name="clear"onclick="return confirm('Do you really want to clear the form?')" onclick="clear()" class="btn btn-primary btn-block" value="Clear">
      <input type="submit" class="btn btn-lg btn-primary btn-block" name="submit" value="Submit">

      <input type="hidden" name="username" class="form-control" value="u01osr15">
      <input type="hidden" name="webmasteremail" class="form-control" value="o.rudvin.15@aberdeen.ac.uk" required>
      <input type="hidden" class="form-control" placeholder="The URL for your homepage" value="https://homepages.abdn.ac.uk/o.rudvin.15/home.html" required>
    </fieldset>
  </form>
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
