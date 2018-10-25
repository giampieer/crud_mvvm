<?php
require "Conexion.php";




//creación de la conexión a la base de datos con mysql_connect()
$conexion 	= mysqli_connect($servidor, $usuario, $password,$basededatos) or die ("No se ha podido conectar al servidor de Base de datos");                                                                                                                         
//Selección del a base de datos a utilizar
//$db2 = mysqli_select_db($conexion2, $basededatos2) or die ("Upps! Pues va a ser que no se ha podido conectar a la base de datos");

 if(mysqli_connect_error($conexion)){
	 echo "FALLO";
 }


$query=mysqli_query($conexion,"
SELECT * FROM Cliente

");


if($query)
{
   while($row=mysqli_fetch_array($query)){
              $flag[]=$row;
   }

   echo '{"listarCliente":'.json_encode($flag).' }';
}


mysqli_close($conexion);

?>