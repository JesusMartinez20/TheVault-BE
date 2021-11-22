<?php
    $put = json_decode(file_get_contents("php://input"));
    $conexion = mysqli_connect("127.0.0.1", "root", "");

    if (!$conexion) {
        die('La conexion no se ha podido realizar.'.mysqli_error());
    } else {
        mysqli_select_db($conexion, "thevault");

        $actualizar = "UPDATE pelicula SET
                        nombre = '$put->nombre',
                        duracion = $put->duracion,
                        pais = '$put->pais',
                        imagen = '$put->imagen',
                        fecha_estreno = $put->fecha_estreno,
                        en_proyeccion = $put->en_proyeccion
                        WHERE id = $put->id";
                        
        mysqli_query($conexion,$actualizar);

        mysqli_close($conexion);
    }
?>