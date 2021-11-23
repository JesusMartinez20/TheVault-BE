<?php
    $put = json_decode(file_get_contents("php://input"));

    $conexion = mysqli_connect("127.0.0.1", "root", "");

    if (!$conexion) {
        die('La conexion no se ha podido realizar.'.mysqli_error());
    } else {
        mysqli_select_db($conexion, "thevault");

        $actualizar = "UPDATE premio SET
                        categoria = '$put->categoria',
                        fecha = '$put->fecha',
                        lugar = '$put->lugar',
                        academia = '$put->academia' 
                        WHERE id = $put->id";
                        
        mysqli_query($conexion,$actualizar);

        mysqli_close($conexion);
    }
?>