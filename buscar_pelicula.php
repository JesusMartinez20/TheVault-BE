<?php
        $id=$_GET['id'];
        $conexion = mysqli_connect('localhost','root','');
        
        if(!$conexion){
            die('La conexion no se ha podido realizar.'.mysqli_error());
        } else{
                    
            mysqli_select_db($conexion,"thevault");
            
            $consulta = "SELECT 
                            pelicula.id,
                            pelicula.nombre, 
                            pelicula.imagen,
                            pelicula.duracion, 
                            pelicula.fecha_estreno, 
                            (SELECT COUNT(id) FROM premio WHERE id_pelicula=pelicula.id) AS premios, 
                            (SELECT COUNT(id) FROM comentarios WHERE id_pelicula=pelicula.id) AS comentarios
                        FROM pelicula 
                        LEFT JOIN premio ON pelicula.id=premio.id_pelicula 
                        LEFT JOIN comentarios ON pelicula.id=comentarios.id_pelicula 
                        WHERE pelicula.id=$id
                        GROUP BY pelicula.id;";

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