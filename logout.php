<?php

$referrer = @ $_GET['referrer']; #For quickly getting back to referrer page

session_start();

unset($_SESSION['user']);

session_destroy();

if (isset($referrer)) header("Location: login.php?referrer=$referrer");
else header("Location: login.php");

?>