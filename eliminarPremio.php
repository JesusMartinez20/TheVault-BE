<?php
        $id = $_GET['id'];
        $conexion = mysqli_connect('localhost','root','');
        
        if(!$conexion){
            die('La conexion no se ha podido realizar.'.mysqli_error());
        } else{
                    
            mysqli_select_db($conexion,"thevault");
            
            $elimina = "DELETE FROM premio WHERE id = $id";

            mysqli_query($conexion,$elimina) or die (mysqli_error());

            mysqli_close($conexion);
        }
?>