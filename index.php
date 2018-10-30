<?php 

require "includes/default.php";
require "includes/auth.php";

require "smarty3/Smarty.class.php";

$smarty = new Smarty;
include("includes/session.php");

$categories = get_records(CATEGORY_TABLE);

$smarty->assign("master_table_list", $master_table_list);
$smarty->assign("categories", $categories);

$smarty->display("index.tpl");
?>