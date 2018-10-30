<?php

require "includes/default.php";
require "includes/auth.php";


$table = $_GET['table'];
$id = $_GET['id'];

delete_record($table, $id);

header("Location: item_list.php?table=$table&deleted=yes");
exit;

?>