<?php

function mysql_to_php_dt($datetime) {
	return strtotime($datetime);
}

function php_to_mysql_dt($timestamp) {
	return date('Y-m-d H:i:s', $timestamp);
}

/** Return the sum of the [amount] column **/
function sum_bid_amounts($record_array) {
	$sum = 0;
	for ($i = 0; i < count($record_array); $i++) {
		$sum = $sum + $record_array[$i]['amount'];
	}
	
	return $sum;
}

/** Retrieve all the bids on an item's $id **/
function get_bids_for_item($id) {
	global $item_tbl, $user_tbl, $bid_tbl;
	
	$connection = open_mysql_db();
	$query = "SELECT $bid_tbl.* FROM $bid_tbl WHERE $bid_tbl.item_id = $id";
	
	//echo "<p style='color: black'>" . $query . "</p>";
	
	$results = mysql_query($query, $connection) or show_mysql_errors();
 
	$records = mysql_fetch_array($results, MYSQL_ASSOC);
	
	mysql_close($connection) or show_mysql_errors();
	
	return $records;
}

//echo php_to_mysql_dt(time());

?>