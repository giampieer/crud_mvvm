<?php
require "Conexion.php";

$idcliente = $_REQUEST['idcliente'];
$conexion = new mysqli($servidor, $usuario, $password, $basededatos);
// Check connection
if ($conexion->connect_error) {
    die("Connection failed: " . $conexion->connect_error);
} 

// sql to delete a record
$sql = "DELETE FROM Cliente WHERE idcliente='$idcliente'";

if ($conexion->query($sql) === TRUE) {
    echo "Record deleted successfully";
} else {
    echo "Error deleting record: " . $conexion->error;
}

$conexion->close();
