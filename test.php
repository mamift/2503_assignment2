<?php

include("includes/misc.php");

//echo php_to_mysql_dt(strtotime("+1 week"));

$d_ate = strtotime("+1 week");

echo date( 'Y-m-d H:i:s', $d_ate);
//echo preg_replace('#(\d{2})/(\d{2})/(\d{4})\s(.*)#', '$3-$2-$1 $4', );

?>