<?php

    $post = json_decode(file_get_contents("php://input"));

    $connection = mysqli_connect("127.0.0.1", "root", "");

    if (!$connection) {
        die('La conexion no se ha podido realizar.'.mysqli_error());
    } else {
        mysqli_select_db($connection, "thevault");

        $queryStaff = "INSERT INTO staff(nombre, nacinalidad, fecha_nacimiento, sexo, imagen)
                        VALUES('$post->nombre', '$post->nacionalidad', '$post->fecha_nacimiento', '$post->sexo', '$post->imagen')";

        $queryParticipacion = "INSERT INTO participacion(rol, id_pelicula, id_staff)
                                VALUES('$post->rol', '$post->id_pelicula', '$post->id_staff')";

        mysqli_query($connection, $queryStaff)
            or die(mysqli_error($connection));

        mysqli_query($connection, $queryParticipacion)
            or die(mysqli_error($connection));

        mysqli_close($connection);
    }
?>