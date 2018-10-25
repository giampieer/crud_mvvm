<?php
require "Conexion.php";

$conexion 	= mysqli_connect($servidor, $usuario, $password,$basededatos) or die ("No se ha podido conectar al servidor de Base de datos");
 if(mysqli_connect_error($conexion)){
	 echo "Error";
 }
$query=mysqli_query($conexion,"SELECT * FROM Cliente");

if($query) {
   while($row=mysqli_fetch_array($query)){
     $flag[]=$row;
   }
   echo '{"listarCliente":'.json_encode($flag).' }';
}

mysqli_close($conexion);
?>