<?php
require("includes/default.php");
require("includes/auth.php");

require "smarty3/Smarty.class.php";

$error = @ $_GET['error'];

# For quickly getting back to a referring page
$referrer = @ $_GET['referrer'];
$item_id = @ $_GET['item_id'];

$smarty = new Smarty;

$smarty->assign("master_table_list", $master_table_list);

if ( isset($error) ) {	# If $error is set, then assume login_action.php authorise() failed!
	$smarty->assign("error", $error);
}

if ( isset($referrer) ) {
	$smarty->assign("action", $referrer);
	
	if ( isset($item_id)) $smarty->assign("item_id", $item_id);
}

$smarty->display("login.tpl");

?>