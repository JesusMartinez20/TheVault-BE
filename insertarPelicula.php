<?php

    $post = json_decode(file_get_contents("php://input"));

    $connection = mysqli_connect("127.0.0.1", "root", "");

    if (!$connection) {
        die('La conexion no se ha podido realizar.'.mysqli_error());
    } else {
        mysqli_select_db($connection, "thevault");

        $query = "INSERT INTO staff(nombre, duracion, pais, imagen, fecha_estreno, en_proyeccion)
                    VALUES('$post->nombre', $post->duracion, '$post->pais', '$post->imagen', $post->fecha_estreno, $post->en_proyeccion)";


        mysqli_query($connection, $query)
            or die(mysqli_error($connection));

        mysqli_close($connection);
    }
?>