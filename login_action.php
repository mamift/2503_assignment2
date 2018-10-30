<?php
require("includes/default.php");
require("includes/auth.php"); 		#the session_start() function is called in 'auth.php'

$username = trim(							$_POST['username']);
$password = trim(							$_POST['password']);

# For quickly getting back to a referring page
$goto = @ 		$_GET['goto'];
$item_id = @ 	$_GET['item_id'];	

if (empty($username) && empty($password) ) {
	# Fail!
	header("Location: login.php?error=emptiness");
	
} else {

	if (authorise($username, $password)) {
		begin_session($username);
		
		if (isset($goto)) {	#For navigating to a referring page
			switch($goto) {
				case 'bid': #Bidding on an item
					if (isset($item_id)) header("Location: item_detail.php?table=$item_tbl&id=$item_id"); #insert bid url	
					else header("Location: item_list.php?table=$item_tbl");
				break;
				
				case 'add_cat': #Add a new category
					header("Location: item_add.php?table=$category_tbl"); #add a new category page, only for adminstrators
				break;
			}
		} else {				
			header("Location: index.php");
		}
	} else {
		# Fail!
		header("Location: login.php?error=$username");
	}
}

?>
