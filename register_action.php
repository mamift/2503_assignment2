<?php

require("includes/default.php");
require("includes/auth.php");

$username = 		mysql_real_escape_string (		$_POST['username']);
$password = 				crypt_password	 (		$_POST['password']);

if (empty($username) || empty($password)) { # Go no further! $username and $password are essential
	header("Location: register.php?error=emptiness");
	exit;
}

$first_name =		mysql_real_escape_string (	@	$_POST['first_name']);
$last_name =		mysql_real_escape_string (	@ 	$_POST['last_name']);
$email =			mysql_real_escape_string (	@ 	$_POST['email']);
$description =		mysql_real_escape_string (	@ 	$_POST['description']);
	
$site_rules_i_agree = 							@	$_POST['sites_rules_i_agree'];

$record = array(
	"username" 		=> $username,
	"password" 		=> $password,
	"first_name" 	=> $first_name,
	"last_name" 	=> $last_name,
	"email" 		=> $email,
	"description" 	=> $description
);

$new_user_id = add_user($record);

begin_session($username);

header("Location: item_detail.php?table=$user_tbl&id=$new_user_id&newuser=1");

?>