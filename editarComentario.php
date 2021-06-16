<?php
    $put = json_decode(file_get_contents("php://input"));
    $connection = mysqli_connect("127.0.0.1", "root", "");

    if (!$connection) {
        die('La conexion no se ha podido realizar.'.mysqli_error());
    } else {
        mysqli_select_db($connection, "thevault");

        $query = "SELECT * FROM comentarios
                    WHERE id = '$put->id'";

        $result = mysqli_query($connection, $query)
                    or die(mysql_error($connection));

        $records = mysqli_num_rows($result);
        $data;

        if ($records > 0) {
            while ($rows = mysqli_fetch_object($result)) {
                $data = $rows;
            }
        } 
        
        $title = $data->titulo;
        $opinion = $data->opinion;
        $score = $data->calificacion;

        if ($put->title != "") {
            $title = $put->title;
        }
        if ($put->opinion != "") {
            $opinion = $put->opinion;
        }
        if ($put->score != "") {
            $score = $put->score;
        }

        $query = "UPDATE comentarios
                    SET titulo = '$title',
                        opinion = '$opinion',
                        calificacion = '$score' 
                    WHERE id = '$put->id'";

        mysqli_query($connection,$query) 
            or die (mysqli_error());

        mysqli_close($connection);
    }
?>