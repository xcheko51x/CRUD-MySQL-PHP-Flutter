<?php

    require "conexion.php";

    $nombre = $_POST['nombre'];
    $telefono = $_POST['telefono'];
    $email = $_POST['email'];

    $sql = "INSERT INTO usuarios VALUES('', '$nombre', '$telefono', '$email')";
    
    $query = $mysqli->query($sql);
    
?>
