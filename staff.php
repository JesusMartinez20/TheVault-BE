<?php
        $id=$_GET['id'];
        $conexion = mysqli_connect('localhost','root','');
        
        if(!$conexion){
            die('La conexion no se ha podido realizar.'.mysqli_error());
        } else{
                    
            mysqli_select_db($conexion,"thevault");
            
            $consulta = "SELECT * FROM staff WHERE id=$id";

            $resultado = mysqli_query($conexion,$consulta) or die (mysqli_error());
            
            $registros = mysqli_num_rows($resultado);
            
            $datos = array();
    
            if($registros > 0){
                while($fila = mysqli_fetch_object($resultado)){
                    $datos[] = $fila;
                }
                $arreglo = json_encode($datos);
                echo $arreglo;
            }
            else
                echo "0";
            mysqli_close($conexion);
        }
    
?>