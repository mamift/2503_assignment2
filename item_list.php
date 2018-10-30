<?php

require "includes/default.php";
require "includes/auth.php";

require "smarty3/Smarty.class.php";

$smarty = new Smarty;
include("includes/session.php");

$table = 		$_GET['table'];			#Determines which table to grab data from
$deleted = @ 	$_GET['deleted'];
$query = @		$_GET['query'];			#For searching
$browse = @		$_GET['browse'];

//echo "<p style='color: white;'> " . var_dump($records) . "</p>";
//echo "<p style='color: white;'> " . $table . "</p>"; 

if (empty($query)) $records = get_records($table);

$smarty->assign("master_table_list", $master_table_list);
$smarty->assign("table", $table);

switch($table) {
	case ITEM_TABLE:
		if (isset($query) && empty($browse)) {			#For displaying search results
			$search_items = get_records($table, $query);
						
			$smarty->assign("query", $query);

			$search_items_count = count($search_items);
			$smarty->assign("search_items", $search_items);
			$smarty->assign("search_items_count", $search_items_count);
			
			$smarty->display("search.tpl");
			
		} else if (isset($browse) && empty($query)) {	#For displaying browse results
			$browse_items = get_items_by_category($browse);
			$categories = get_records($category_tbl);
			
			$smarty->assign("categories", $categories);
			$smarty->assign("browse", $browse);
			
			$browse_items_count = count($browse_items);
			$smarty->assign("browse_items", $browse_items);
			$smarty->assign("browse_items_count", $browse_items_count);
			
			$smarty->display("browse.tpl");
		} else {
			$records = get_records($table);
			
			$smarty->assign("all_items", $records);
			$smarty->display("item_list.tpl");		
		}
	break;
	
	case CATEGORY_TABLE:
		$smarty->assign("all_categories", $records);
		$smarty->display("category_list.tpl");
	break;
	
	case USER_TABLE:
		///echo var_dump($records);
		$smarty->assign("all_users", $records);
		$smarty->display("user_list.tpl");
	break;
	
	case BID_TABLE:
		$smarty->display("bid_list.tpl");
	break;
	
	default:
		$smarty->display("item_list.tpl");
	break;
}



?>