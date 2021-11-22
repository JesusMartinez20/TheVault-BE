<?php
    $put = json_decode(file_get_contents("php://input"));
    $conexion = mysqli_connect("127.0.0.1", "root", "");

    if (!$conexion) {
        die('La conexion no se ha podido realizar.'.mysqli_error());
    } else {
        mysqli_select_db($conexion, "thevault");

        $actualizar = "UPDATE staff SET
                        nombre = '$put->nombre',
                        nacinalidad = '$put->nacionalidad',
                        fecha_nacimiento = '$put->fecha_nacimiento',
                        sexo = '$put->sexo',
                        imagen = '$put->imagen'
                        WHERE id = $put->id_staff";

        $actualizarParticipacion = "UPDATE participacion SET
                                    rol = '$put->rol'
                                    WHERE id = $put->id_participacion";
                        
        mysqli_query($conexion,$actualizar);
        mysqli_query($conexion,$actualizarParticipacion);

        mysqli_close($conexion);
    }
?>