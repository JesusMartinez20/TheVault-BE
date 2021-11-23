<?php

    $post = json_decode(file_get_contents("php://input"));

    $connection = mysqli_connect("127.0.0.1", "root", "");

    if (!$connection) {
        die('La conexion no se ha podido realizar.'.mysqli_error());
    } else {
        mysqli_select_db($connection, "thevault");

        $query = "INSERT INTO pelicula(nombre, duracion, pais, imagen, fecha_estreno, en_proyeccion)
                    VALUES('$post->nombre', $post->duracion, '$post->pais', '$post->imagen', '$post->fecha_estreno', '$post->en_proyeccion')";


        mysqli_query($connection, $query)
            or die(mysqli_error($connection));
        
        //
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
        //

        mysqli_close($connection);
    }
?>