<?php
require_once("globals.php");
require_once("database.php");

session_start();

if (!isset($_SESSION['id'])) session_regenerate_id();

/** Begins a new sessions: sets the 'user' element in the $_SESSION array **/
function begin_session($user) {
	$_SESSION['user'] = $user;
	$_SESSION['user_type'] = get_user_type($user);
	$_SESSION['user_id'] = get_user_id($user);

	//$session_id = session_id();
	
	# Session starts when the user logs in
	$session_start = time();
	
	$_SESSION['start'] = $session_start;
}

/** Retrieves the value of the [ID] column in the USER_TABLE for $username **/
function get_user_id($username) {
	global $user_tbl;
	
	$connection = open_mysql_db();
	
	$query = "SELECT id FROM $user_tbl WHERE username = '" . $username . "' ";
	$result = mysql_query($query, $connection);

    if (mysql_num_rows($result) != 1) {
        echo "Invalid query or result: $query <br/>";
        echo var_dump($result);
        die();
    }

	$user_record = mysql_fetch_array($result, MYSQL_ASSOC);
	mysql_close($connection);
	
	return $user_record['id'];
}

/** Retrieves the value of the [type] column in the USER_TABLE for $username **/
function get_user_type($user) {
	global $user_tbl;
	
	$connection = open_mysql_db();
	
	$query = "SELECT id, username, type FROM $user_tbl WHERE username = '" . $user . "' ";
	$result = mysql_query($query, $connection);

    if (mysql_num_rows($result) != 1) {
        echo "Invalid query or result: $query <br/>";
        echo var_dump($result);
        die();
    }

	$user_record = mysql_fetch_array($result);
	mysql_close($connection);
	
	return $user_record['type'];
}

/** Checks a password against the hash stored in the USER_TABLE. $password must be in plain text (unencrypted) form **/
function authorise($username, $password) {
	global $user_tbl;
	
	$connection = open_mysql_db();
	
	$query = "SELECT id, username, password FROM $user_tbl WHERE username = '" . $username . "' ";
	$result = mysql_query($query, $connection);

    if (mysql_num_rows($result) != 1) {
        //echo "Invalid query or result: $query <br/>";
        //echo var_dump($result);
        //die();
        return false;
    }

	$user_record = mysql_fetch_array($result);
	mysql_close($connection);
	
	return (crypt_password($password, $user_record['password']) );
}

/** 
*** Adapted from code: http://www.php.net/manual/en/function.crypt.php
*** This function will accept $info as input and hash it, and output the hash result of the string and salt 
*** together, plus the salt added on the end. If $encdata is true, then it will compare the store password against
*** $info (which should be an unencrypted form of  the password, like when a user will log in).
**/
function crypt_password($info, $encdata = false)	{ 
	if (!info) return false;
	$strength = "08";
	# If encrypted data is passed, check it against input ($info) 
	if ($encdata) { 
		return ( substr($encdata, 0, 60) == crypt($info, "$2a$" . $strength . "$" . substr($encdata, 60)) );
		
	} else { 
		# Make a salt and hash it with input, and add salt to end 
		$salt = ""; 
		for ($i = 0; $i < 22; $i++) { 
			$salt .= substr("./ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789", mt_rand(0, 63), 1);
		} 
		# Return 82 char string (60 char hash + 22 char salt) 
		return crypt($info, "$2a$".$strength."$".$salt).$salt; 
	} 
} 

/** 
*** This performs a simple update operation on the password field in the database with a new $password. 
*** No encryption of the password is undertaken! Use encrypt_ functions for that. 
*** So $password can be encrypted or not.
**/
function update_password_in_db($password, $user) {
	$connection = mysql_open();
	
	if (is_numeric($user)) {	# Go by ID 
		$query = "UPDATE $user_tbl SET" . "SET password = '" . $password . "' " . "WHERE id = '" . $user . "' ";
	} else {					# Go by Username
		$query = "UPDATE $user_tbl SET" . "SET password = '" . $password . "' " . "WHERE username = '" . $user . "' ";
	}	
	$results = mysql_query($query, $connection) or show_mysql_errors();
	
	mysql_close($connection);
	
	$verified = function($connection2) {
		$test_case_query = "SELECT password FROM $user_tbl WHERE id = '" . $user . "'";
		$result = mysql_query($test_case_query, $connection);
		$test_case_record = mysql_fetch_array($result);
		
		mysql_close($connection2);
		
		return ($password === $test_case_record['password']);
	};
	
	return $verified(mysql_open);
}

/** 
*** Verifies a plain text $input_password against the encrypted one stored in the database.
*** $input_password must not be encrypted.
**/
function verify_password($input_password, $user)	{
	$connection = mysql_open();
	
	if (is_numeric($user)) {	# Go by ID 
		$query = "SELECT password, salt FROM $user_tbl WHERE id = '" . $user . "'";
	} else {					# Go by Username
		$query = "SELECT password, salt FROM $user_tbl WHERE username = '" . $user . "'";
	}
	$result = mysql_query($test_case_query, $connection);
	$record = mysql_fetch_array($result);
	
	$stored_password = $record['password'];
	$stored_salt = $record['salt'];
	
	mysql_close($connection);
		
	if ($input_password)	{
		#Compare the crypt of input+stored_salt to the stored crypt password
		return (crypt($input_password . $stored_salt, $stored_password) == $stored_password);
	} else {
		return false;
	}
}

/** Test the crypt_password function **/
//echo crypt_password("gizmoe") . "\n <br />";
//echo crypt_password ("gizmoe", crypt_password("gizmoe") ) ? "true" : "false" . "\n <br />"; 
//echo authorise("mamift1", "gizmoe") ? "true" : "false" . "\n <br />";

//echo $_SESSION['user_id'];

?>