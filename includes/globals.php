<?php

define("ITEM_TABLE", "a2_Item");
define("CATEGORY_TABLE", "a2_Category");
define("USER_TABLE", "a2_User");
define("BID_TABLE", "a2_Bid");

/** These are for use inline in un-escaped strings i.e. "$item_tbl" **/
global $item_tbl, $category_tbl, $user_tbl, $bid_tbl;

$item_tbl = ITEM_TABLE;
$category_tbl = CATEGORY_TABLE;
$user_tbl = USER_TABLE;
$bid_tbl = BID_TABLE;

/** This array is for use in Smarty .tpl templates **/
global $master_table_list;
$master_table_list = array(
	"ITEM_TABLE" => ITEM_TABLE,
	"CATEGORY_TABLE" => CATEGORY_TABLE,
	"USER_TABLE" => USER_TABLE,
	"BID_TABLE" => BID_TABLE
);

global $item_columns_query;
$item_columns_query = "SELECT $item_tbl.id, $item_tbl.name, $item_tbl.description, $item_tbl.category_id, $category_tbl.name " .
		    "AS category_name, $item_tbl.manufacturer, $item_tbl.starting_price, " . 
		    "$item_tbl.expiration_date, $user_tbl.username as vendor, $user_tbl.id as vendor_id, $user_tbl.id as vendor_id " .
		    "FROM $item_tbl " .
    		"INNER JOIN $category_tbl ON $item_tbl.category_id = $category_tbl.id " . 
    		"INNER JOIN $user_tbl ON $item_tbl.seller_username_id = $user_tbl.id ";

?>