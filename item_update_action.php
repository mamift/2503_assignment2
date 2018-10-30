<?php
require "includes/default.php";
require "includes/auth.php";

$connection = open_mysql_db();

$table = $_GET['table'];

$record = array("id" => 				(int) 						$_POST['id']);

switch ($table) {
	case ITEM_TABLE:
		$record['name'] = 				mysql_real_escape_string(	$_POST['name']);
		$record['description'] = 		mysql_real_escape_string(	$_POST['description']);
		$record['item_category'] = 		(int) 						$_POST['item_category'];
		$record['manufacturer'] = 		mysql_real_escape_string(	$_POST['manufacturer']);
		$record['starting_price'] = 	(float) 					$_POST['starting_price'];
		$record['expiration_date'] = 	php_to_mysql_dt(			$_POST['expiration_date']);

		update_item($record);
	break;
	
	case CATEGORY_TABLE:
		$record['name'] = 				mysql_real_escape_string(	$_POST['name']);
		$record['description'] = 		mysql_real_escape_string(	$_POST['description']);		
		
		update_category($record);
		//echo var_dump($record) . "<br />" . $_POST['id']; exit;
	break;
	
	case USER_TABLE:
		$record['username'] =			mysql_real_escape_string(	$_POST['username']);
		$record['first_name'] =			mysql_real_escape_string(	$_POST['first_name']);
		$record['last_name'] =			mysql_real_escape_string(	$_POST['last_name']);
		$record['description'] =		mysql_real_escape_string(	$_POST['description']);
		$record['e_mail'] =				mysql_real_escape_string(	$_POST['e_mail']);
		$record['type'] =				mysql_real_escape_string(	$_POST['type']);
		
		if (strlen($_POST['password']) > 0 && strlen($_POST['password']) < 6) {
			header("Location: item_update.php?error=password&table=$user_tbl&id=".$_POST['id']);
			exit;
		} else {
			#crypt_password will automatically terminate if ['password'] is empty. 
			#This allows the user to update info without changing the password
			$record['password'] =			crypt_password(trim(  @	$_POST['password']));
		}
		$record['salt'] =										  @	$_POST['salt'];
	
		update_user($record);
	break;
	
	default:
		#This switch-selection block should never default
		//echo 'Defaulted! Like Bernie-Mac or the Lehman-Brothers! Noooo! Oh wait, they didn't default, they just went bankrupt...\n' .
		//" \"Whaaa?\" said Muhammad.";
	break;
}

mysql_close($connection);

//echo var_dump($record); exit;
header("Location: item_detail.php?table=".$table."&id=".		$_POST['id']);
exit;
?>