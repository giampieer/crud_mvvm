<?php
require "Conexion.php";

$nombres_apellidos = $_REQUEST["nombres_apellidos"];
$celular = $_REQUEST["celular"];
$password = $_REQUEST["password"];
$correo = $_REQUEST["correo"];

$conexion = mysqli_connect($servidor, $usuario, $password,$basededatos);

$res=$conexion->query("insert into Cliente (nombres_apellidos, celular, password, correo) 
values ('$nombres_apellidos','$celular','$password','$correo')");

if($res === TRUE)  {
echo "josuecito";
}

?>