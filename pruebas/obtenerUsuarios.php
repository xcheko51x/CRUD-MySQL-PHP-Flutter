<?php

    require "conexion.php";
    
    // PRUEBAS
    //$usuario = "cheko";
    
    $sql = "SELECT * FROM usuarios";
    $query = $mysqli->query($sql);
    
    $datos = array();
    
    while($resultado = $query->fetch_assoc()) {
        $datos[] = $resultado;
    }
    
    echo json_encode($datos);
    //echo json_encode(array("usuarios" => $datos));
?>
