<?php

require "includes/default.php";
require "includes/auth.php";

$connection = open_mysql_db();

$table = 							$_GET['table'];

if ($table == ITEM_TABLE || $table == CATEGORY_TABLE) {
	$name = 						$_POST['name'];
	$description = 					$_POST['description'];
}

$error = false;
$record= array();

switch($table) {
	case CATEGORY_TABLE:
		if ( empty($name) || empty($description) ) {
			$error = true;
			header("Location: item_add.php?table=table&error=$error");
			exit;
		}
		
		$record = array(
			"name" => 				mysql_real_escape_string($name),
			"description" => 		mysql_real_escape_string($description),
		);
		
		$new_record_id = add_category($record);
		
	break;
	
	case ITEM_TABLE:
		$item_category =	 		$_POST['item_category'];
		$manufacturer = 			$_POST['manufacturer'];
		$starting_price = 			$_POST['starting_price'];
		$expiration_date =			$_POST['expiration_date'];
		
		if ( empty($item_category) || empty($manufacturer) || empty($starting_price) || 
		$starting_price == 0 || !is_numeric($starting_price) ) {
			$error = true;
			header("Location: item_add.php?table=$table&error=$error");
			exit;
		}
		
		$record = array(
			"name" => 				mysql_real_escape_string($name),
			"description" => 		mysql_real_escape_string($description),
			"item_category" =>		(int) $item_category,
			"manufacturer" => 		mysql_real_escape_string($manufacturer),
			"starting_price" =>		(float) $starting_price,
			"expiration_date" =>	php_to_mysql_dt( strtotime($expiration_date) ),
			"seller_username_id" =>	$_SESSION['user_id']
		);
		
		$new_record_id = add_item($record);
	break;
	
	case BID_TABLE:
		$item_id = 					$_POST['item_id'];
		$amount =					$_POST['amount'];
		$username_id =				$_SESSION['user_id'];
		$bid_date =					php_to_mysql_dt(time());
		
		if ( empty($amount) || $amount == 0 || !is_numeric($amount) ) {
			$error = true;
			header("Location: item_add.php?table=$table&error=$error");
			exit;
		}
		
		$record = array(
			"item_id" => 			(int) $item_id,
			"amount" =>				(float) $amount,
			"username_id" =>		(int) $username_id,
			"bid_date" =>			$bid_date
		);
		
		$new_record_id = bid($record);
	break;
}

mysql_close($connection);

header("Location: item_detail.php?table=$table&id=$new_record_id");
exit;
?>