<?php

    $post = json_decode(file_get_contents("php://input"));

    $connection = mysqli_connect("127.0.0.1", "root", "");

    if (!$connection) {
        die('La conexion no se ha podido realizar.'.mysqli_error());
    } else {
        mysqli_select_db($connection, "thevault");

        $query = "INSERT INTO premio(categoria, fecha, lugar, academia, id_pelicula)
                    VALUES('$post->categoria', '$post->fecha', '$post->lugar', '$post->academia', $post->id_pelicula)";

        mysqli_query($connection, $query)
            or die(mysqli_error($connection));

        mysqli_close($connection);
    }
?>