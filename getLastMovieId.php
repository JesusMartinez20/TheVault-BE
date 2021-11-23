<?php
    $connection = mysqli_connect('localhost','root','');
    
    if(!$connection){
        die('La conexion no se ha podido realizar.'.mysqli_error());
    } else{
        mysqli_select_db($connection, "thevault");
                
        $getIdQuery = "SELECT id FROM pelicula ORDER BY id DESC LIMIT 1";

        $resultado = mysqli_query($connection, $getIdQuery)
            or die(mysqli_error($connection)); 

        $registros = mysqli_num_rows($resultado);

        $datos = array();

        if($registros > 0){
            while($fila = mysqli_fetch_object($resultado)){
                $datos[] = $fila;
            }
            echo json_encode($datos[0]);
        }
    }
?>