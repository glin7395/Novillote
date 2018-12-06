<?php include ("seguridad_admin.php")
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/estilonovillo.css">
       <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<title>Restaurante el novillo de oro</title>

</head>

<body>
<?php
include('banner.html');
?>
 <font color="white"><table width="900" border="0" align="center" >
  <tr>
  	 
    <td height="642" align="center" class="fondotabla" >
        <?php 

 class usuario
 {
	 public function listar ($busqueda)
	 {
		 //session_start();
	 	
		 $cont='0';
		 
		 include ('conexion.php');
		 $texto = '';	
		  $busqueda = trim($_POST['buscar']);
		  
		  if (empty($busqueda)){
			  $texto = 'Búsqueda sin resultados';
		  }else{
			  
			  $sql = "SELECT * FROM pedidos WHERE idpedidos LIKE '%" .$busqueda. "%' ORDER BY idpedidos";
			  
			  	 if( !$resultado = $db->query($sql))
				 {
					die ('No conecta ['.$db->error.']');
		 		}
			 	 if (mysqli_num_rows($resultado) > 0){ 
			     // Se recoge el número de resultados
				 $registros = '<p>HEMOS ENCONTRADO ' . mysqli_num_rows($resultado) . ' registros </p>';
			     // Se almacenan las cadenas de resultado
				 while($row = mysqli_fetch_assoc($resultado)){ 

					     echo"<table width='80' height='140' class='fondotablas' border='1'>";
			 echo '<tr  bgcolor="#424242">';
			 echo "<td>cliente</td>";
			 echo "<td>nombre del cliente</td>";
         	 echo"<td>fecha</td>";
         	 echo "<tD>total</TD>";
         	 echo"<tD>estado </td>";
       	     echo "</tr>";
		    $iddpedidos=stripslashes($row["idpedidos"]);
			$iddclientes=stripslashes($row["clientes_idclientes"]);
			$ffechav=stripslashes($row["fecha_pedido"]);
			$ppedidos=stripslashes($row["total_pedido"]);
			$iddestados=stripslashes($row["estados_idestados"]);

			 //subconsulta
			   $sql1 = "SELECT * FROM clientes WHERE idclientes='$iddclientes'";
					 if( !$result1 = $db->query($sql1))
					 		{
						die ('No conecta ['.$db->error.']');
						 }
						while($row1 = $result1->fetch_assoc())
						{
						$nnombre=stripslashes($row1["nombre_cliente"]);
						}


						///	
			$sql2 = "SELECT * FROM estados WHERE idestados='$iddestados' ";
					 if( !$result2 = $db->query($sql2))
					 		{
						die ('No conecta ['.$db->error.']');
						 }
						while($row2 = $result2->fetch_assoc())
						{
						$descripcion=stripslashes($row2["nombre_estado"]);
						}
          //finsubconsulta
		   //consulta
		  		echo"<tr >";
		  		echo "<td>$iddpedidos</td>";
				echo "<td>$nnombre</td>";
          		echo"<td>$ffechav</td>";
          		echo"<td>$ppedidos</td>";
          		echo"<td>$descripcion</td>";
				//editar
				echo "<td>";
	 			 //eliminar
	
      			
			}
			//fin del while
			echo"</table>";
	  
	  }else{
			   echo "NO HAY RESULTADOS EN LA BBDD";	
	  }
	  
	 }
  }
}
 $nuevo= new  usuario();
 $nuevo->listar($_POST['buscar']);

 ?> 
    <br>
         <p><a href="listar_usuarios.php" class='btn btn-danger'>Volver a todos los usuarios</a>
          </p></font>
</td>
</tr>
</table>
 



     <?php
include("footer.html");
 ?>
 
      
      
      </p>
      </html>
     