<?php
$usuario 	= "root";
$password 	= "Gi@mpieer24-pe";
$servidor 	= "localhost";
$basededatos 	= "db_crud_mvvm";
//creación de la conexión a la base de datos con mysql_connect()
$conexion 	= mysqli_connect($servidor, $usuario, $password, $basededatos) or die ("No se ha podido conectar al servidor de Base de datos");

