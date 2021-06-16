<?php

        $id = $_GET['id'];
        $titulo = $_GET['titulo'];
        $opinion = $_GET['opinion'];
        $calificacion = $_GET['calificacion'];

        $conexion = mysqli_connect('localhost','root','');
        
        if(!$conexion){
            die('La conexion no se ha podido realizar.'.mysqli_error());
        } else{
                    
            mysqli_select_db($conexion,"thevault");
            
            $actualizar = "UPDATE comentarios SET titulo = '$titulo', opinion = '$opinion', calificacion = '$calificacion' WHERE id = $id";

            mysqli_query($conexion,$actualizar);

            mysqli_close($conexion);
        }
?>