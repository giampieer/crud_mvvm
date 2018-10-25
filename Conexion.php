<?php
//REALIZANDO PRIMERA CONEXION

//parametros


$usuario 	= "bprueba";
$password 	= "NbApD123@";
$servidor 	= "bprueba.db.5006165.19a.hostedresource.net";
$basededatos 	= "bprueba";
//creación de la conexión a la base de datos con mysql_connect()
$conexion 	= mysqli_connect($servidor, $usuario, $password, $basededatos) or die ("No se ha podido conectar al servidor de Base de datos");

