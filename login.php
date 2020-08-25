<?php

$dbhost = "localhost";
$dbuser = "root";
$dbpass = "toor";
$dbname = "equipo_del_real_madrid";

$conn = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);
if (!$conn)
{
    die("No hay conexion ".mysqli_connect_error());
}

$nombre = $_POST["txtusuario"];
$pass = $_POST["txtpassword"];

$query = mysqli_query($conn, "SELECT * FROM administradores WHERE usuario = '".$nombre."' and password = '".$pass."' ");
$nr = mysqli_num_rows($query);

if ($nr == 1)
{
    header("Location: Bienvenida-Formulario.html");
} 
else if ($nr == 0)
{
    header ("Location: InicioSesion2.html");
}


?>