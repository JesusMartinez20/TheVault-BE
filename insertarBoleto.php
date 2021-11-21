<?php
        $id_username = $_GET['id_username'];
        $asientos = $_GET['asientos'];
        $id_funcion = $_GET['id_funcion'];

        $conexion = mysqli_connect('localhost','root','');
        
        if(!$conexion){            
            die('La conexion no se ha podido realizar.'.mysqli_error());
        } else{
            
            mysqli_select_db($conexion,"thevault");
            
            $query = "INSERT INTO boletos (asientos,id_funcion,id_username) VALUES ($asientos,$id_funcion,'$id_username')";

            mysqli_query($conexion,$query);

            mysqli_close($conexion);
        }
?>