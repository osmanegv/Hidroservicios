<?php
$_SERVER = "localhost:3306";
$username = "root";
$password = "";
$database = "hidroservicios";

try {
    $conex = mysqli_connect("$_SERVER", "$username", "$password", "$database");
} catch (mysqli_sql_exception $e) {
    die("connected failed:" . $e->getMessage());
}


?>