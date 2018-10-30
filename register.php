<?php

require("includes/default.php");
require("includes/auth.php");

require "smarty3/Smarty.class.php";

$error = @ $_GET['error'];

$smarty = new Smarty;

$smarty->assign("master_table_list", $master_table_list);

if ( isset($error) ) {	# If username is set, then assume login_action.php authorise() failed!
	$smarty->assign("error", $error);
}

$smarty->display("register.tpl");

?>