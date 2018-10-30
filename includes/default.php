<?php
require_once("database.php");
require_once("globals.php");
require_once("misc.php");

error_reporting(E_ALL & ~E_NOTICE & ~E_STRICT & ~E_DEPRECATED & ~E_WARNING);

/** Place a bid on a sale item **/
function bid($record_array) {
	global $item_tbl, $user_tbl, $bid_tbl;
	
	$connection = open_mysql_db();
	$query = "INSERT INTO $bid_tbl ";
	
	if (count($record_array) == 4) {
		$query .= "( item_id, amount, bid_date, username_id ) " .
		" VALUES ('". $record_array['item_id'] . "', '" . $record_array['amount'] . "', '" . 
		$record_array['bid_date'] . "', '" . $record_array['username_id'] . "' )";
		
	} else {
        echo "Record array incorrect length: <br/> $query <br />";
        echo var_dump($record_array);
        die();
	}
	//echo "<p style='color: black'>" . $query . "</p>";
	
	$results = mysql_query($query, $connection) or show_mysql_errors(); 
	$id = mysql_insert_id();
	
	mysql_close($connection) or show_mysql_errors();
	
	return $id;
}

/** 
*** Retrieve records from a $table, whose fields match $str, in an associative array format.
*** This acts as a useful master function to grab records from any table using only arguments.
**/
function get_records($table, $string = "") {	#If $str isn't supplied, then all columns are retrieved
	global $item_tbl, $category_tbl, $user_tbl, $bid_tbl, $item_columns_query;
	
	$connection = open_mysql_db();
	
	$str = mysql_real_escape_string($string);
	
	switch ($table) {
		case ITEM_TABLE: 		#a2_item
			$query = $item_columns_query;	#See 'globals.php'
			            	    		
    		if ( !($str == "") ) {
    			if ( is_numeric($str) ) {
    				$query .= "WHERE $item_tbl.id = "			. $str . " ";
    			} else {
		    		$query .= "WHERE $item_tbl.name LIKE '%"	. $str . "%' " .
	                "OR $item_tbl.description LIKE '%"			. $str . "%' " .
	                "OR $item_tbl.manufacturer LIKE '%"			. $str . "%' " .
	                "OR $category_tbl.name LIKE '%"				. $str . "%' ";
                }
    		}
    		//echo "<p style='color: white'>" . $query . "</p>";
    	break;
		case CATEGORY_TABLE:	#a2_category
			$query = "SELECT * FROM $category_tbl ";
			if ( !($str == "") ) {
				$query .= "WHERE name LIKE '%"	. $str . "%' " . 
				"OR description LIKE '%"		. $str . "%' " .
				"OR id = '"						. $str . "' ";
			}
			//echo "<p style='color: white'>" . $query . "</p>";
		break;
		case USER_TABLE:		#a2_user
			$query = "SELECT id, username, first_name, last_name, description, e_mail, type FROM $user_tbl ";
			
			if ( !($str == "") ) {
				$query .= "WHERE username LIKE '%"	. $str . "%' " .
				"OR first_name LIKE '%"				. $str . "%' " .
				"OR last_name LIKE '%"				. $str . "%' " .
				"OR description LIKE '%"			. $str . "%' " .
				"OR e_mail LIKE '%"					. $str . "%' ";
			}
			//echo "<p style='color: white'>" . $query . "</p>";
		break;
		case BID_TABLE:			#a2_bid
			$query = "SELECT $bid_tbl.id, $item_tbl.id as item_id, $item_tbl.name AS item_name, " . 
			"$user_tbl.username as user_name, $bid_tbl.amount, $bid_tbl.bid_date " .
			"FROM $bid_tbl as bids, $item_tbl, $user_tbl " .
			"INNER JOIN $bid_tbl ON $user_tbl.username = $bid_tbl.username ";
			
			if( !($str == "") ) {
				$query .= "WHERE $item_tbl.name LIKE '%"	. $str . "%' " .
				"OR $bid_tbl.amount LIKE '%"				. $str . "%' " .
				"OR $bid_tbl.bid_date LIKE '%"				. $str . "%' ";
			}
			//echo "<p style='color: white'>" . $query . "</p>";
		break;
		default:
			#This switch-selection block should never default
			//echo 'Defaulted! Like Bernie-Mac or the Lehman-Brothers! Noooo! Oh wait, they didn't default, they just went bankrupt...\n' .
			//" \"Whaaa?\" said Muhammad.";
		break;
	}
	
	$query .= "ORDER BY " . $table . ".id"; 
	
	$items = array();
	$results = mysql_query($query, $connection);
	//echo "<p style='color: white'>" . $query . "</p>";
	//echo "<p style='color: white'>" . var_dump($results) . "</p>";
	while ( $item = mysql_fetch_array($results, MYSQL_ASSOC) ) {
		$items[] = $item;
	}

	mysql_close($connection) or show_mysql_errors();
	
	return $items;
}

/** Retrieve a single record from a specified table, by $id only **/
function get_record($table, $id) {
	global $item_tbl, $category_tbl, $user_tbl, $bid_tbl, $item_columns_query;
	
    $connection = open_mysql_db();
    
	switch ($table) {
		case ITEM_TABLE: 			#a2_item
			$query = $item_columns_query;	#See 'globals.php'
			$query .= "WHERE $item_tbl.id = $id";
    		//echo "<p style='color: white'>" . $query . "</p>";
    	break;
		case CATEGORY_TABLE:		#a2_category
			$query = "SELECT * FROM $category_tbl WHERE id = $id";
			//echo "<p style='color: white'>" . $query . "</p>";
		break;
		case USER_TABLE:			#a2_user
			if (is_numeric($id)) {	# Go by ID
				$query = "SELECT id, username, password, first_name, last_name, description, e_mail, type FROM $user_tbl WHERE id = $id";
			} else {				# Go by username
				$query = "SELECT id, username, password, first_name, last_name, description, e_mail, type FROM $user_tbl WHERE username = '$id'";
			}
			//echo "<p style='color: white'>" . $query . "</p>";
		break;
		case BID_TABLE:				#a2_bid
			$query = "SELECT $bid_tbl.id as bid_id, $bid_tbl.item_id as item_id, $bid_tbl.amount, " .
			"$bid_tbl.bid_date, $bid_tbl.username_id " .
			"FROM $bid_tbl " . 
			"WHERE $bid_tbl.id = $id "; 
			//echo "<p style='color: black'>" . $query . "</p>";
		break;
		default:
			#This switch-selection block should never default
			//echo 'Defaulted! Like Bernie-Mac or the Lehman-Brothers! Noooo! Oh wait, they didn't default, they just went bankrupt...\n' .
			//" \"Whaaa?\" said Muhammad.";
		break;
	}
	//echo "<p style='color: white'>" . $query . "</p>";
	  	
    $result = mysql_query($query, $connection) or show_mysql_errors();
    if (mysql_num_rows($result) != 1) {
        echo "Invalid query or result: $query <br/>";
        echo var_dump($result);
        die();
    }
	
    $item = mysql_fetch_array($result);
	
    mysql_close($connection) or show_mysql_errors();
    
    return $item;
}

/** List all items according to a [CATEGORY_TABLE.id] **/
function get_items_by_category($category) {
	global $item_tbl, $category_tbl, $item_columns_query;
	
    $connection = open_mysql_db();
	
	$query = $item_columns_query;
	$query .= "WHERE $category_tbl.id = '" . $category . "' ";
	
	//echo "<p style='color: black'>" . $query . "</p>"; exit;

    $query .=  "ORDER BY $item_tbl.id";
    $result = mysql_query($query, $connection) or show_mysql_errors();

    $items = array();
    while ($item = mysql_fetch_array($result)) {
        $items[] = $item;
    }

    mysql_close($connection) or show_mysql_errors();
    return $items;
}

/** List all items according to a vendor [USER_TABLE.id] **/
function get_items_by_user($user) {
	global $item_tbl, $user_tbl, $item_columns_query;
	
    $connection = open_mysql_db();
	
	$query = $item_columns_query;
	
	if (is_numeric($id)) {	# Go by ID
		$query .= "WHERE $user_tbl.id = '" . $user . "' ";
	} else {				# Go by username
		$query .= "WHERE $user_tbl.username = '" . $user . "' ";
	}
	
	//echo "<p style='color: black'>" . $query . "</p>"; exit;

    $query .=  "ORDER BY $user_tbl.id";
    $result = mysql_query($query, $connection) or show_mysql_errors();

    $items = array();
    while ($item = mysql_fetch_array($result)) {
        $items[] = $item;
    }

    mysql_close($connection) or show_mysql_errors();
    return $items;
}


/** Add a new record into ITEM_TABLE, by taking data from an associative $record_array. It then returns the [id] of that newly created record **/
function add_item($record_array) {
	global $item_tbl, $category_tbl, $user_tbl, $bid_tbl;
	
	$connection = open_mysql_db();
	$query = "INSERT INTO $item_tbl";
	
	if (count($record_array) > 5) {
		$query .= " (name, description, category_id, manufacturer, starting_price, expiration_date, seller_username_id) " .
		"VALUES ( '" . $record_array['name'] . "', '" . $record_array['description'] . "', '" . $record_array['item_category'] . "', '" . 
					$record_array['manufacturer'] . "', '" . $record_array['starting_price'] . "', '" . $record_array['expiration_date'] . "', " .
					"'". (int) $record_array['seller_username_id'] . "' )";
	
	} else {
        echo "Record array incorrect length: <br/> $query <br />";
        echo var_dump($record_array);
        die();
	}
	//echo "<p style='color: white'>" . $query . "</p>";
	
	$results = mysql_query($query, $connection) or show_mysql_errors(); 
	$id = mysql_insert_id();
	
	mysql_close($connection) or show_mysql_errors();
	
	return $id;
}

/** Add a new record into CATEGORY_TABLE, by taking data from an associative $record_array. It then returns the [id] of that newly created record **/
function add_category($record_array) {
	global $category_tbl;
	
	$connection = open_mysql_db();
	$query = "INSERT INTO $category_tbl";

	if (count($record_array) == 2) {
		$query .= " (name, description) " .
			"VALUES ( '" . $record_array['name'] . "', '" . $record_array['description'] . "' )";
			
	} else {
		echo "Record array incorrect length: <br/> $query <br />";
        echo var_dump($record_array);
        die();
	}	
	//echo "<p style='color: white'>" . $query . "</p>";

	$results = mysql_query($query, $connection) or show_mysql_errors();
	$id = mysql_insert_id();
	
	mysql_close($connection) or show_mysql_errors();
	
	return $id;
}

/** Add a new record into USER_TABLE, by taking data from an associative $record_array. It then returns the [id] of that newly created record **/
function add_user($record_array) {
	global $item_tbl, $category_tbl, $user_tbl, $bid_tbl;
	
	$connection = open_mysql_db();
	$query = "INSERT INTO $user_tbl";
	
	if (count($record_array) == 6) {
		$query .= " (username, password, first_name, last_name, e_mail, type, description) " .
		"VALUES ( '" . $record_array['username'] . "', '" . $record_array['password'] . "', '" . $record_array['first_name'] . "', '" . 
					$record_array['last_name'] . "', '" . $record_array['email'] . "', 'user', '" . $record_array['description'] ."' )";

	} else {
        echo "Record array incorrect length: <br/> $query <br />";
        echo var_dump($record_array);
        die();
	}
	
	$results = mysql_query($query, $connection) or show_mysql_errors();
	$id = mysql_insert_id();
	
	mysql_close($connection) or show_mysql_errors();
	
	return $id;
}

/** Delete a record, in a specified $table, by its [id]. No deleting from the BID_TABLE! **/
function delete_record($table, $id) {
	global $item_tbl, $category_tbl, $user_tbl, $bid_tbl;
	
	$connection = open_mysql_db();
	
	if ($table == $item_tbl || $table == $category_tbl || $table == $user_tbl) {
		$query = "DELETE FROM $table WHERE id = $id";
		$result = mysql_query($query, $connection) or show_mysql_errors();
	} else {
		//echo "<p style='color: white'>" . "No deleting from the BID_TABLE!" . "</p>";
    }
    
	mysql_close($connection) or show_mysql_errors();
}

/** Update a record in the ITEM_TABLE; TODO: Add columns for bidding on items **/
function update_item($record_array) {
	global $item_tbl;
	
	$connection = open_mysql_db();

	if (count($record_array) == 7) {
		$query = "UPDATE $item_tbl SET " . 
		"name = '" . $record_array['name'] . "', description = '" . $record_array['description'] . "', category_id = '"  .
		$record_array['item_category'] . "', manufacturer = '" . $record_array['manufacturer'] . "', starting_price = '" .
		$record_array['starting_price'] . "', expiration_date = '" . $record_array['expiration_date'] . " '";
		
	}  else {
		echo "Invalid argumenets supplied: <br/>";
        echo var_dump($record_array);
        echo "<p style='color: black'>" . $query . "</p>";
        die();
	}
	
	$query .= "WHERE id = " . $record_array['id'];
	//echo "<p style='color: black'>" . $query . "</p>"; exit;
	
	$result = mysql_query($query, $connection) or show_mysql_errors();

	mysql_close($connection) or show_mysql_errors();
}

/** Update a record in the CATEGORY_TABLE **/
function update_category($record_array) {
	global $category_tbl;
	
	$connection = open_mysql_db();	

	if (count($record_array) == 3) {
		$query = "UPDATE $category_tbl SET " . 
		"name = '" . $record_array['name'] . "', description = '" . $record_array['description'] . "' ";
	} else {
		echo "Invalid arguments supplied: <br/>";
        echo var_dump($record_array);
        die();
	}
	
	$query .= "WHERE id = '" . $record_array['id'] . "'";
	//echo "<p style='color: black'>" . $query . "</p>"; exit;
	
	$result = mysql_query($query, $connection) or show_mysql_errors();

	mysql_close($connection) or show_mysql_errors();
}

/** Update a record in the USER_TABLE **/
function update_user($record_array) {
	global $user_tbl;
	
	$connection = open_mysql_db();	
	
	$no_pass_query = "UPDATE $user_tbl SET " . 
		"username = '" . $record_array['username'] . "', first_name = '" . $record_array['first_name'] . "', " .
		"last_name = '" . $record_array['last_name'] . "', description = '" . $record_array['description'] . "', " .
		"e_mail = '" . $record_array['e_mail'] . "'";
		
	if (count($record_array) == 9 && empty($record_array['password']) ) {
		$queru = $no_pass_query;
		
	} else if (count($record_array) == 9 && !empty($record_array['password']) ) {
		$query = $no_pass_query . ", password = '" . $record_array['password'] . "' ";
		
	} else {
		echo "Invalid arguments supplied: <br/>";
        echo var_dump($record_array);
        die();
	}
	
	$query .= "WHERE id = '" . $record_array['id'] . "'";
	//echo "<p style='color: black'>" . $query . "</p>"; exit;
	
	$result = mysql_query($query, $connection) or show_mysql_errors();

	mysql_close($connection) or show_mysql_errors();
}

?>