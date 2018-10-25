<?php
require "Conexion.php";
$nombres_apellidos = $_REQUEST["nombres_apellidos"];
$celular = $_REQUEST["celular"];
$correo = $_REQUEST["correo"];
$dni = $_REQUEST ["dni"];
$fecha_nacimiento = $_REQUEST["fecha_nacimiento"];
$domicilio = $_REQUEST ["domicilio"];
$telefono_casa = $_REQUEST["telefono_casa"];
$estado = $_REQUEST ["estado"];

$conexion = mysqli_connect($servidor, $usuario, $password,$basededatos);

$res=$conexion->query("update Cliente set nombres_apellidos='$nombres_apellidos', fecha_nacimiento='$fecha_nacimiento' ,
 domicilio='$domicilio', correo='$correo,' celular='$celular', telefono_casa='$telefono_casa,'".
										   "estado='$estado' where dni='$dni'");

if($res === TRUE)  {
echo "josuecito";
}

?>