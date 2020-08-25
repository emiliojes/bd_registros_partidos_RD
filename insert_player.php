<?php
$nombre = filter_input(INPUT_POST, 'nombre');
$apellido = filter_input(INPUT_POST, 'apellido');
$cedula = filter_input(INPUT_POST, 'cedula');
$edad = filter_input(INPUT_POST, 'edad');
$email = filter_input(INPUT_POST, 'email');

if (!empty($nombre)){
    if(!empty($apellido)) {
    $host = "localhost";
    $dbuser = "root";
    $dbpass = "toor";
    $dbname = "equipo_del_real_madrid";

$conn = new mysqli ($host, $dbuser, $dbpass, $dbname);

if (mysqli_connect_error()) {
    die('Connect Error ('. mysqli_connect_error().')'
    . mysqli_connect_error());
}

else {
    $sql = "INSERT INTO tecnico (nombre, apellido, cedula, edad, email)
    values ('$nombre', '$apellido', '$cedula', '$edad', '$email')";
    if ($conn->query($sql)) {
        echo "Los datos fueron insertados con exito";
    }
else
{
    echo "Error: " . $sql . " " . $conn->error;
}
$conn->close();
}
    }
    else{
        echo "Password should not be empty";
        die();
    }
}
?>