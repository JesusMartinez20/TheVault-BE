<?php

    $username = $_GET['username'];
    $nombre = $_GET['nombre'];
    $contrasena = $_GET['contrasena'];
    $fecha_nac = $_GET['fecha_nac'];
    $correo = $_GET['correo'];
    $avatar = $_GET['avatar'];

        $conexion = mysqli_connect('localhost','root','');
        
        if(!$conexion){
            
            die('La conexion no se ha podido realizar.'.mysqli_error());
        } else{
            
            mysqli_select_db($conexion,"thevault");
            
            $query = "INSERT INTO usuario VALUES ('$username',now(),'$nombre','$contrasena','$fecha_nac','$correo',$avatar)";

            mysqli_query($conexion,$query);

            mysqli_close($conexion);
        }
?>