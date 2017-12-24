<?php
session_start();
?>
<!DOCTYPE html>
<html>
<body>

<?php
// Echo session variables that were set on previous page
echo "Favorite color is " . $_SESSION["favcolor"] . ".<br>";
echo "Favorite animal is " . $_SESSION["favanimal"] . ".";
?>
<br>
<?php
print_r($_SESSION);
?>


<p>
  <a href="test.php"><button type="button" class="btn btn-primary">Return</button></a>
</p>

<b

</body>
</html>
