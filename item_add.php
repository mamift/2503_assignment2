<?php

require "includes/default.php";
require "includes/auth.php";

require "smarty3/Smarty.class.php";

$smarty = new Smarty;
include("includes/session.php");

$table = $_GET['table']; #This variable determines which form to show. Either one for 'item' or 'category'
$error = $_GET['error']; #Either true or false;

if ($error) {
	$smarty->assign("error", $error);
}
	
$categories = get_records(CATEGORY_TABLE);

$smarty->assign("master_table_list", $master_table_list);
$smarty->assign("table", $table);
$smarty->assign("categories", $categories);

switch($table) {
	case ITEM_TABLE:
		$smarty->display("item_add.tpl");
	break;
	
	case CATEGORY_TABLE:
		$smarty->display("category_add.tpl");
	break;
	
	case USER_TABLE:
		header("Location: register.php");
	break;
	
	case BID_TABLE:
		$item_id = $_GET['id'];
		$item = get_record(ITEM_TABLE, $item_id);
		//$item['starting_price'] = (float) $item['starting_price'];
		
		$smarty->assign("item", $item);
		$smarty->assign("item_id", $item_id);
		$smarty->display("bid_add.tpl");
	break;
	
	default:
		#This switch-selection block should never default
		//echo 'Defaulted! Like Bernie-Mac or the Lehman-Brothers! Noooo! Oh wait, they didn't default, they just went bankrupt...\n' .
		//" \"Whaaa?\" said Muhammad.";
	break;
}
?>