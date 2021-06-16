<?php
    $id = $_GET['id'];
    $connection = mysqli_connect("127.0.0.1", "root", "");

    if (!$connection) {
        die('La conexion no se ha podido realizar.'.mysqli_error());
    } else {
        mysqli_select_db($connection, "thevault");

        $query = "SELECT comentarios.*, usuario.avatar FROM comentarios
                    JOIN usuario ON usuario.username = comentarios.usuario
                    WHERE id_pelicula = '$id'";

        $result = mysqli_query($connection, $query)
                    or die(mysql_error($connection));

        $records = mysqli_num_rows($result);
        $data;

        if ($records > 0) {
            while ($rows = mysqli_fetch_object($result)) {
                $data[] = $rows;
            }

            $array = json_encode($data);
            echo $array;
        } else {
            echo "0";
        }   

        mysqli_close($connection);
    }
?>