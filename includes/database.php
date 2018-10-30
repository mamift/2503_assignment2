<?php # By Muhammad Miftah S2757691, portions of code adapted from Rodney Topour

/* This first if-conditional block is just to switch quickly between localhost and the Griffith Server. */
// if ($_SERVER['SERVER_NAME'] == "localhost" || $_SERVER['SERVER_NAME'] == "rath1")	{ 
// 	define("HOST", "localhost");	#Local host is used for testing
// } else {
// 	define("HOST", "mysql.ict.griffith.edu.au");
// }
define("HOST", "localhost"); #Local host is used for testing
define("USER", "s2757691"); 		#The database owner's name
define("PASSWORD", "EYrKk75Y"); 	#The database owner's password
define("DATABASE", "s2757691db"); 	#The database's name

/** Show MySQL errors **/
function show_mysql_errors() {	
	die("Error ". mysql_errno() . " : " . mysql_error());
}

/** Open MySQL connection and select the database **/
function open_mysql_db() {
	$connection = mysql_connect(HOST, USER, PASSWORD) or die("Could not connect");
	mysql_select_db(DATABASE, $connection) or show_mysql_errors();
	return $connection;
}

?>