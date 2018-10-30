<?php	/** THIS FILE MUST BE INCLUDED AFTER A $smarty = new Smarty; STATEMENT **/
		/** ALSO: EVERY .php FILE EXCEPT FOR THE login.php, register.php MUST INCLUDE THIS FILE **/
		/** FOR CONSISTENCY, INCLUDE THIS FILE AFTER THE $smarty = new Smarty; STATEMENT **/

if (isset($_SESSION['user'])) {
	$smarty->assign("session_user", $_SESSION['user']);
	$smarty->assign("session_user_type", $_SESSION['user_type']);
	$smarty->assign("session_user_id", $_SESSION['user_id']);
}

?>