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
            
            $actualizar = "UPDATE usuario SET nombre = '$nombre', contrasena = '$contrasena', fecha_nacimiento = '$fecha_nac', correo = '$correo', avatar=$avatar WHERE username = '$username'";

            mysqli_query($conexion,$actualizar);

            mysqli_close($conexion);
        }
?>