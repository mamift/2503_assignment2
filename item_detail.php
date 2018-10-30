<?php

require "includes/default.php";
require "includes/auth.php";

require "smarty3/Smarty.class.php";

$smarty = new Smarty;
include("includes/session.php");

$table = 	$_GET['table']; 		#This determines which form to show.
$id = 		$_GET['id'];

//echo $table . " " . $id;

$record = get_record($table, $id);

//echo var_dump($record); exit;
$categories = get_records(CATEGORY_TABLE);

$smarty->assign("master_table_list", $master_table_list);

$smarty->assign("id", $id);
$smarty->assign("categories", $categories);
$smarty->assign("table", $table);

switch($table) {
	case ITEM_TABLE:
		#Convert date time values to php format	
		//$temp_time = $record['expiration_date'];
		//$record['expiration_date'] = mysql_to_php_dt($temp_time);
		
		$smarty->assign("item", $record);		
		$smarty->display("item_detail.tpl");
	break;
	
	case CATEGORY_TABLE:
		$smarty->assign("category", $record);
		$smarty->display("category_detail.tpl");
	break;
	
	case USER_TABLE:
		#Grab all the items listed by the user
		$user_items = get_items_by_user($record['username']);
		
		$smarty->assign("user_items_count", count($user_items));
		$smarty->assign("user_items", $user_items);
		$smarty->assign("user", $record);
		$newuser = $_GET['newuser'];
		
		if (isset($newuser)) $smarty->assign("newuser", $newuser);	#if this is from a new user registration page, show a welcome message!
		//echo var_dump($record); exit;
		$smarty->display("user_detail.tpl");
	break;
	
	case BID_TABLE:		
		$smarty->assign("bid", $record);
		
		$user_record = get_record(USER_TABLE, $record['username_id']);
		$item_record = get_record(ITEM_TABLE, $record['item_id']);
		
		$related_bid_records = get_bids_for_item($record['item_id']);
		
		$smarty->assign("related_bids", $related_bid_records);
		$smarty->assign("user", $user_record);
		$smarty->assign("item", $item_record);
		$smarty->display("bid_detail.tpl");		
	break;
	
	default:
		#This switch-selection block should never default
		//echo 'Defaulted! Like Bernie-Mac or the Lehman-Brothers! Noooo! Oh wait, they didn't default, they just went bankrupt...\n' .
		//" \"Whaaa?\" said Muhammad.";
	break;
}

?>