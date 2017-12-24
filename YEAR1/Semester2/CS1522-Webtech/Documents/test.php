<?php

//Start session
session_start();

// -------------- COOKIES ----------------

// Only the name parameter is required
//setcookie(name, value, expire, path, domain, secure, httponly);

$cookie_name = "user";
$cookie_value = "Alex";
setcookie($cookie_name, $cookie_value, time() + (86400 * 30), "/"); // 86400 = 1 day


?>

<!DOCTYPE html>
<html>
<head>
<script>
function validateForm() {
    var x = document.forms["myForm"]["fname"].value;
    if (x == null || x == "") {
        alert("Name must be filled out");
        return false;
    }
}
</script>
</head>
<body>

<form name="myForm" action="demo_form.asp"
onsubmit="return validateForm()" method="post">
Name: <input type="text" name="fname">
<input type="submit" value="Submit">
</form>

<div id="container">
<p> MySQL code: </p>
<?php

  // Object-oriented MySQLi method

  DEFINE('DB_USERNAME', 'root');
  DEFINE('DB_PASSWORD', 'abdn2016');
  DEFINE('DB_HOST', 'localhost');
  DEFINE('DB_DATABASE', 'jee');

  //Create new connection
  $mysqli = new mysqli(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_DATABASE);

  //Check connection
  if (mysqli_connect_error()) {
  die('Connect Error ('.mysqli_connect_errno().') '.mysqli_connect_error());
  }

  echo 'Connected successfully.<br>';

  //Reset auto increment
  //$sql = "ALTER TABLE tbl AUTO_INCREMENT=4";

  // Create database if it doesn't exist

/*

  $sql = "CREATE DATABASE myGuests";
  if ($mysqli->query($sql) === TRUE) {
      echo "<br>Database created successfully";
  } else {
      echo "<br>Error creating database: " . $mysqli->error;
  }


  /*
  // Create MyGuests table
  $sql = "CREATE TABLE MyGuests (
  id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  firstname VARCHAR(30) NOT NULL,
  lastname VARCHAR(30) NOT NULL,
  email VARCHAR(50),
  reg_date TIMESTAMP
  )";

  if ($mysqli->query($sql) === TRUE) {
      echo "<br>Table MyGuests created successfully";
  } else {
      echo "<br>Error creating table: " . $mysqli->error;
  }
  */
  /*

  // Insert shit into a table WITH get ID of last inserted record

  $sql = "INSERT INTO MyGuests (firstname, lastname, email)
  VALUES ('John', 'Doe', 'john@example.com');";
  $sql .= "INSERT INTO MyGuests (firstname, lastname, email)
  VALUES ('Mary', 'Moe', 'mary@example.com');";
  $sql .= "INSERT INTO MyGuests (firstname, lastname, email)
  VALUES ('Julie', 'Dooley', 'julie@example.com')";

  if ($mysqli->multi_query($sql) === TRUE) {
      $last_id = $mysqli->insert_id;
      echo "<br>New record created successfully. Last inserted ID is: " . $last_id;
  } else {
      echo "<br>Error: " . $sql . "<br>" . $mysqli->error;
  }
  */

  /*

  // INSERT MULTIPLE VALUES INTO TABLE EASILY
  // Preparing is done so that it's like function that is run once to input stuff in. This reduces parsing time.
  // prepare and bind

  $stmt = $mysqli->prepare("INSERT INTO MyGuests (firstname, lastname, email) VALUES (?, ?, ?)");
  // ^Question marks for substitution
  $stmt->bind_param("sss", $firstname, $lastname, $email);
  // Binds the parameters to the SQL query and tells it what the parameters are.
  // sss = datatype string for each parameter

  // set parameters and execute
  $firstname = "John";
  $lastname = "Doe";
  $email = "john@example.com";
  $stmt->execute();

  $firstname = "Mary";
  $lastname = "Moe";
  $email = "mary@example.com";
  $stmt->execute();

  $firstname = "Julie";
  $lastname = "Dooley";
  $email = "julie@example.com";
  $stmt->execute();

  echo "New records created successfully";

  $stmt->close();
  */

  // SELECT DATA FROM MySQL DATABASE
  // Limit selection to 30 first records:
  // $sql = "SELECT * FROM MyGuests LIMIT 30";

  // Return 10 records starting from record 15
  // $sql = "SELECT * FROM MyGuests LIMIT 10 OFFSET 15";

  // or
  // $sql = "SELECT * FROM Orders LIMIT 15, 10";
  /*
  $sql = "SELECT id, firstname, lastname FROM MyGuests";
  $result = $mysqli->query($sql);

  if ($result->num_rows > 0) {
      // output data of each row
      while($row = $result->fetch_assoc()) {
          echo "id: " . $row["id"]. " - Name: " . $row["firstname"]. " " . $row["lastname"]. "<br>";
      }
  } else {
      echo "0 results";
  }
  */
  /*
  // DELETE ENTRIES FROM TABLE
  $sql = "DELETE FROM MyGuests WHERE id BETWEEN 3 AND 250";

  if ($mysqli->query($sql) === TRUE) {
      echo "Record deleted successfully";
  } else {
      echo "Error deleting record: " . $mysqli->error;
  }
  */
  /*

  $sql = "UPDATE MyGuests SET lastname='Doe' WHERE id=2";

  if ($mysqli->query($sql) === TRUE) {
      echo "Record updated successfully";
  } else {
      echo "Error updating record: " . $mysqli->error;
  }
  */
  $mysqli->close();
 ?>
 </div>

<div id="container">
  <p> Other PHP code: </p>
<?php
  /*
  // Two dimensional Array is an array of arrays. Each line below is anew array. $cars contains four arrays
  $cars = array
    (
      array("Volvo",22,18),
      array("BMW",15,13),
      array("Saab",5,2),
      array("Land Rover",17,15)
    );
    // Show values from cars array
    /*
    echo $cars[0][0].": In stock: ".$cars[0][1].", sold: ".$cars[0][2].".<br>";
    echo $cars[1][0].": In stock: ".$cars[1][1].", sold: ".$cars[1][2].".<br>";
    echo $cars[2][0].": In stock: ".$cars[2][1].", sold: ".$cars[2][2].".<br>";
    echo $cars[3][0].": In stock: ".$cars[3][1].", sold: ".$cars[3][2].".<br>";
    */
    /*
    // or with a function
      for ($row = 0; $row < 4; $row++) {
        echo "<p><b>Row number $row</b></p>";
        echo "<ul>";
        for ($col = 0; $col < 3; $col++) {
          echo "<li>".$cars[$row][$col]."</li>";
        }
        echo "</ul>";
      }
    */
    /*

    // ----------- DATE AND TIME ---------------

    // date(format, timestamp)
    // Format specifies format of timestamp
    // Timestamp(OPTIONAL) specifies timestamp. Default is current day and year.
    // d = day of the month, m = month, y = year, l = day of the week
    // Characters like /,.- can be added to show date differently

    echo "Today is " . date("Y/m/d") . "<br>";
    echo "Today is " . date("Y.m.d") . "<br>";
    echo "Today is " . date("Y-m-d") . "<br>";
    echo "Today is " . date("l");
    echo "<br><br>";

    // h = hour, i = minutes, s = seconds, a = AM/PM
    echo "The time is " . date("h:i:sa");

    echo "<br><br>";

    // set timezone
    $timezone = "America/New_York";
    echo "Change time zone <br>";
    date_default_timezone_set($timezone);
    echo "The time is " . date("h:i:sa");

    echo "<br><br>";

    // Create a date with mktime()
    $d=mktime(11, 14, 54, 8, 12, 2014);
    echo "Created date is " . date("Y-m-d h:i:sa", $d);

    echo "<br><br>";

    // Convert human readable string into Unix time
    // strtotime(time,now)
    $d=strtotime("10:30pm April 15 2014");
    echo "Created date is " . date("Y-m-d h:i:sa", $d);

    $d=strtotime("tomorrow");
    echo date("Y-m-d h:i:sa", $d) . "<br>";

    $d=strtotime("next Saturday");
    echo date("Y-m-d h:i:sa", $d) . "<br>";

    $d=strtotime("+3 Months");
    echo date("Y-m-d h:i:sa", $d) . "<br>";

    echo "<br><br>";

    // Output stuff for a certain timezone
    // Output dates for the next six saturdays
    $startdate = strtotime("Saturday");
    $enddate = strtotime("+6 weeks",$startdate);

    while ($startdate < $enddate) {
      echo date("M d", $startdate),"<br>";
      $startdate = strtotime("+1 week", $startdate);
    }

    echo "<br><br>";

    // Output the number of days until the 4th of July

    $d1=strtotime("July 04");
    $d2=ceil(($d1-time())/60/60/24);
    echo "There are " . $d2 ." days until 4th of July.";

    */
 ?>

 <?php

 //------------------ READING, WRITING ----------------------

 //Include vs require: Same thing, but if file is not found require will stop the script. Include will continue to execute.
// read form file
//echo readfile("test.txt");
echo "<br><br>";
//fopen() is a better function than readfile, as it has more functions and shit
/*
$myfile = fopen("test.txt", "r") or die("Unable to open file!");
echo fread($myfile,filesize("test.txt"));
fclose($myfile);

*/

// functions:
// r = read only, w = write only(erases), a = write to append. Creates new file if not exists, x = create new file for write only, r+ = open read and write pointer in beginning, w+ = erases conents read/write, a+ open file read and write, x+ = create new file for read and write returns false if file already exists

// fread() reads from an open file, second parameter specifies maximum number of bytes to read

//fgets = read a single line
/*
$myfile = fopen("test.txt", "r") or die("Unable to open file!");
echo fgets($myfile);
fclose($myfile);
*/

// feof() checks if the end-of-file has been reached. It can loop through data of unkown length.

echo "<br><br>";
// fgetc() can read a single character from a file
/*
$myfile = fopen("test.txt", "r") or die("Unable to open file!");
// Output one character until end-of-file
while(!feof($myfile)) {
  echo fgetc($myfile);
}
fclose($myfile);
*/

// fopen(filename, function) can be used to create a file

// Write to file= fwrite()

// ---------------- UPLOADING ------------------

// to enable file upload, turn file_uploads = on in the php.ini file.

// create a http form to upload
// REMEMBER enctype = "multipart/form-data" specifies content type

// Usually action goes to another .php script

?>

<form action="upload.php" method="post" enctype="multipart/form-data">
    Select image to upload:
    <input type="file" name="fileToUpload" id="fileToUpload">
    <input type="submit" value="Upload Image" name="submit">
</form>

<br><br>

<?php
// --------------- COOKIES --------------
// Cookies thing before <html> tag
if(!isset($_COOKIE[$cookie_name])) {
    echo "Cookie named '" . $cookie_name . "' is not set!";
} else {
    echo "Cookie '" . $cookie_name . "' is set!<br>";
    echo "Value is: " . $_COOKIE[$cookie_name];
}
// To delete a cookie, use the setcookie() function with an expiration date in the past.

//Check if cookies are enabled
if(count($_COOKIE) > 0) {
    echo "<br>Cookies are enabled.<br><br>";
} else {
    echo "Cookies are disabled.<br><br>";
}

// -------- SESSION -----------------
// set session variables
$_SESSION["favcolor"] = "green";
$_SESSION["favanimal"] = "cat";
echo "Session variables are set.";
echo "<br><br>";

// Change a session variable
$_SESSION["favcolor"] = "yellow";
print_r($_SESSION);

echo "<br><br>";
/*
// remove all session variables
session_unset();

// destroy the session
session_destroy();
*/

// ----------------- PHP FILTERS ------------
// All external data must be validated for security purposes

// Sanitize a string
$str = "<h1>Hello World!</h1>";
$newstr = filter_var($str, FILTER_SANITIZE_STRING);
echo $newstr;

echo "<br><br>";

// Theres filters for strings, integers, ip addresses, email addresses and URLs

// Filters advanced

// Check if input is variable is type INT between 1 and 200

/*
$int = 122;
$min = 1;
$max = 200;

if (filter_var($int, FILTER_VALIDATE_INT, array("options" => array("min_range"=>$min, "max_range"=>$max))) === false) {
    echo("Variable value is not within the legal range");
} else {
    echo("Variable value is within the legal range");
}
// Check if ip is a valid ipv6 address

$ip = "2001:0db8:85a3:08d3:1319:8a2e:0370:7334";

if (!filter_var($ip, FILTER_VALIDATE_IP, FILTER_FLAG_IPV6) === false) {
    echo("$ip is a valid IPv6 address");
} else {
    echo("$ip is not a valid IPv6 address");
}


// Validate a url with a query string

$url = "http://www.w3schools.com";

if (!filter_var($url, FILTER_VALIDATE_URL, FILTER_FLAG_QUERY_REQUIRED) === false) {
    echo("$url is a valid URL");
} else {
    echo("$url is not a valid URL");
}

// Remove characters with ASCII Value > 127

$str = "<h1>Hello WorldÆØÅ!</h1>";

$newstr = filter_var($str, FILTER_SANITIZE_STRING, FILTER_FLAG_STRIP_HIGH);
echo $newstr;

*/

// ----------------- ERROR HANDLING -----------------

// Error handling methods: die(), custom errors, error triggers and error reporting.

//E.g. Opening a file
if(!file_exists("test.txt")) {
  die("File not found");
} else {
  $file=fopen("test.txt","r");
  echo "File found";
}

echo "<br><br>";

// Die() Stops the script


//Create a custom function
// error_function(error_level,error_message, error_file,error_line,error_context)  q

// Only error level and error message are required
// Theres different kinds of error typed

// Error handling function (creates a simpler error)
function customError($errno, $errstr) {
  echo "<b>Error:</b> [$errno] $errstr<br>";
  echo "Ending Script";
  die();
}

set_error_handler("customError");

//echo($test);

// Trigger an error if an illegal input oci_new_cursor
/*
$test=2;
if ($test>1) {
  trigger_error("Value must be 1 or below");
}

// Send error Message by Email
//error handler function
function customError($errno, $errstr) {
  echo "<b>Error:</b> [$errno] $errstr<br>";
  echo "Webmaster has been notified";
  error_log("Error: [$errno] $errstr",1,
  "someone@example.com","From: webmaster@example.com");
}

//set error handler
set_error_handler("customError",E_USER_WARNING);

//trigger error
$test=2;
if ($test>1) {
  trigger_error("Value must be 1 or below",E_USER_WARNING);
}

*/


// -------------- PHP Exceptions ----------------
/*
// Exception handling changes the normal flow of the code execution if a specified error condition occurs.

// When an exception is thrown the following code is not executed, and PHP tries to find a "catch" block

//create function with an exception
function checkNum($number) {
  if($number>1) {
    throw new Exception("Value must be 1 or below");
  }
  return true;
}

//trigger exception in a "try" block
try {
  checkNum(2);
  //If the exception is thrown, this text will not be shown
  echo 'If you see this, the number is 1 or below';
}

//catch exception
catch(Exception $e) {
  echo 'Message: ' .$e->getMessage();
}
*/

echo "<br><br>";

// To create a custom exception handler, you must create a special class with functions that can be called when an exception occurs.
// The custom class inherits the properties from PHP's exception class and you can add custom functions to it.

class customException extends Exception {
  public function errorMessage() {
    //error message
    $errorMsg = 'Error on line '.$this->getLine().' in '.$this->getFile()
    .': <b>'.$this->getMessage().'</b> is not a valid E-Mail address';
    return $errorMsg;
  }
}

$email = "someone@example...com";

try {
  //check if
  if(filter_var($email, FILTER_VALIDATE_EMAIL) === FALSE) {
    //throw exception if email is not valid
    throw new customException($email);
  }
}

catch (customException $e) {
  //display custom message
  echo $e->errorMessage();
}



echo "<br><br>";
echo "<br><br>";
?>
<!--
<table>
  <tr>
    <td>Filter Name</td>
    <td>Filter ID</td>
  </tr>
  <?php
  foreach (filter_list() as $id =>$filter) {
      echo '<tr><td>' . $filter . '</td><td>' . filter_id($filter) . '</td></tr>';
  }

  ?>

</table>
-->
<p>
  <a href="demosession.php"><button type="button" class="btn btn-primary">test session</button></a>
</p>

</div>

<br>
<br>
<br>

Automatically Changing footer date <br>
&copy; 2010-<?php echo date("Y");?>

</body>
</html>
