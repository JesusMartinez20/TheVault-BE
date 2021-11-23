<?php
        $id = $_GET['id'];
        $conexion = mysqli_connect('localhost','root','');
        
        if(!$conexion){
            die('La conexion no se ha podido realizar.'.mysqli_error());
        } else{
                    
            mysqli_select_db($conexion,"thevault");
            
            $busqueda = "SELECT staff.*, participacion.id AS participacion_id, rol, id_pelicula, id_staff 
                        FROM staff 
                        JOIN participacion ON participacion.id_staff = staff.id 
                        WHERE staff.id = '$id'";
		
            $resultado = mysqli_query($conexion,$busqueda) or die (mysqli_error());
            
            $registros = mysqli_num_rows($resultado);
            
            $datos = array();
    
            if($registros > 0){
                while($fila = mysqli_fetch_object($resultado)){
                    $datos[] = $fila;
                }
                $arreglo = json_encode($datos[0]);
                echo $arreglo;
            }
            else
                echo "0";
            mysqli_close($conexion);
            
            
        }
?>