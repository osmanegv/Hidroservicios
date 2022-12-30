<?php

include("conexion.php");
// Llamada al procedimiento almacenado

$username = mysqli_real_escape_string($conex, $_POST['email']);
$password = mysqli_real_escape_string($conex, $_POST['password']);

$result = mysqli_query($conex, "CALL ValidateLogin('$username', '$password')");
$count = mysqli_fetch_array($result)[0];

// Procesa el resultado
if ($count=='1') {

    session_start();
    $_SESSION['login'] = true;
    header("Location: /dock.php");
    exit;

} else {
    header("Location: /pages/login.php");
}

// Cierra la conexión
mysqli_close($conex);


?>

