<?php

require "includes/default.php";
require "includes/auth.php";

require "smarty3/Smarty.class.php";

$smarty = new Smarty;
include("includes/session.php");

$table = 	$_GET['table']; 	#This variable determines which form to show. 
$id = 		$_GET['id'];		#ID of the record to retrieve
$error =	$_GET['error'];		#Update erorr; should contain the field name

if (isset($error)) {
	$smarty->assign("error", $error);
}

$record = 		get_record($table, $id);
$categories = 	get_records(CATEGORY_TABLE);

$smarty->assign("master_table_list", $master_table_list);
$smarty->assign("id", $id);
$smarty->assign("categories", $categories);
$smarty->assign("table", $table);

switch($table) {
	case ITEM_TABLE:
		$smarty->assign("item", $record);
		$smarty->display("item_update.tpl");
	break;
	
	case CATEGORY_TABLE:
		$smarty->assign("category", $record);
		$smarty->display("category_update.tpl");
	break;
	
	case USER_TABLE:
		$smarty->assign("user", $record);
		$smarty->display("user_update.tpl");
	break;
	
	case BID_TABLE:
	
	break;
	
	default:
		#This switch-selection block should never default
		//echo 'Defaulted! Like Bernie-Mac or the Lehman-Brothers! Noooo! Oh wait, they didn't default, they just went bankrupt...\n' .
		//" \"Whaaa?\" said Muhammad.";
	break;
}
?>