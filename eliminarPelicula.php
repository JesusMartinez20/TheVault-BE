<?php
        $id = $_GET['id'];
        $conexion = mysqli_connect('localhost','root','');
        
        if(!$conexion){
            die('La conexion no se ha podido realizar.'.mysqli_error());
        } else{
                    
            mysqli_select_db($conexion,"thevault");

            $eliminaStaff = "DELETE FROM participacion WHERE id_pelicula = $id";
            $eliminaPremio = "DELETE FROM premio WHERE id_pelicula = $id";
            $elimina = "DELETE FROM pelicula WHERE id = $id";

            mysqli_query($conexion,$eliminaStaff) 
                or die (mysqli_error($conexion));

            mysqli_query($conexion,$eliminaPremio) 
                or die (mysqli_error($conexion));

            mysqli_query($conexion,$elimina) 
                or die (mysqli_error($conexion));

            mysqli_close($conexion);
        }
?>