





<?php 
ob_start();
include("./pages/home.php");
$output = ob_get_clean();
echo $output;
?>