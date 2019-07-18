<?php

    require "conexion.php";

    $idUsuario = $_POST['idUsuario'];
    $nombre = $_POST['nombre'];
    $telefono = $_POST['telefono'];
    $email = $_POST['email'];
    
    /*$idUsuario = "27";
    $nombre = "sergio";
    $telefono = "123456";
    $email = "sergio";*/

    $sql = "UPDATE usuarios SET nombre='$nombre', telefono='$telefono', email='$email' WHERE idUsuario='$idUsuario'";
    
    $query = $mysqli->query($sql);

?>
