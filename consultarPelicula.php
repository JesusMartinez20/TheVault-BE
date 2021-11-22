<?php
    $id = $_GET['id'];
    $connection = mysqli_connect("127.0.0.1", "root", "");

    if (!$connection) {
        die('La conexion no se ha podido realizar.'.mysqli_error());
    } else {
        mysqli_select_db($connection, "thevault");

        $query = "SELECT nombre, duracion, pais, imagen, fecha_estreno AS fecha, en_proyeccion, 
                        CAST(AVG(comentarios.calificacion) AS DECIMAL(3, 2)) AS calificacion
                    FROM pelicula
                    JOIN comentarios ON comentarios.id_pelicula = pelicula.id
                    WHERE pelicula.id = '$id'";

        $queryPremios = "SELECT id, categoria, academia
                            FROM premio
                            WHERE id_pelicula = '$id'";

        $queryStaff = "SELECT staff.nombre, participacion.id AS participacion_id, 
                        participacion.rol, staff.id AS staff_id,
                        staff.nacinalidad, staff.fecha_nacimiento,
                        staff.sexo, staff.imagen 
                        FROM pelicula
                        JOIN participacion ON pelicula.id = participacion.id_pelicula
                        JOIN staff ON participacion.id_staff = staff.id
                        WHERE pelicula.id = '$id'";

        $result = mysqli_query($connection, $query)
                    or die(mysqli_error($connection));

        $resultPremios = mysqli_query($connection, $queryPremios)
                            or die(mysqli_error($connection));

        $resultStaff = mysqli_query($connection, $queryStaff)
                        or die(mysqli_error($connection));  

        $records = mysqli_num_rows($result);
        $recordsP = mysqli_num_rows($resultPremios);
        $recordsS = mysqli_num_rows($resultStaff);
        $data;
        $dataPremios = array();
        $dataStaff = array();

        if ($records > 0) {
            while ($rows = mysqli_fetch_object($result)) {
                $data = $rows;
            }

            if ($recordsP > 0) {
                while ($rows = mysqli_fetch_object($resultPremios)) {
                    $dataPremios[] = $rows;
                }
            }
    
            if ($recordsS > 0) {
                while ($rows = mysqli_fetch_object($resultStaff)) {
                    $dataStaff[] = $rows;
                }
            }

            $data->premios = $dataPremios;
            $data->staff = $dataStaff;
    
            $array = json_encode($data);
            echo $array;
        } else {
            echo "0";
        }   

        mysqli_close($connection);
    }
?>