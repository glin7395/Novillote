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
<font color="white">
 <table width="160" border="0" align="center" >
  <tr>
  	 <br>
      <h2 class="fondoheaders">VENTAS</h2>
    <td height="160" align="center"  >
      <p align="center">
      	 
   
        <?php 
 class usuario
 {
	 public function listar ()
	 {
		 //session_start();
		 $cont='0';
		 
		 include ('conexion.php');
		 $sql = "SELECT * from pedidos";
		 if( !$result = $db->query($sql))
		 {
			die ('No conecta ['.$db->error.']');
		 }
		 	echo "<form id='buscador' name='buscador' method='post' action='listar_ventas_b.php'>"; 
			echo "<input id='buscar' name='buscar' type='search' placeholder='Buscar venta :' autofocus >";
			echo  "<input type='submit' name='buscador' class='btn-dark' value='Buscar'>";
			echo "</form>";
			echo "<br>";	
		 	
		     echo"<table width='80' height='140' class='fondotablas' border='1'>";
			 echo '<tr  bgcolor="#424242">';
			 echo "<td>cliente</td>";
			 echo "<td>nombre del cliente</td>";
         	 echo"<td>fecha</td>";
         	 echo "<tD>total</TD>";
         	 echo"<tD>estado </td>";
         	
       	     echo "</tr>";
			
			while($row = $result->fetch_assoc())
			{
			$iddpedidos=stripslashes($row["idpedidos"]);
			$iddclientes=stripslashes($row["clientes_idclientes"]);
			$ffechav=stripslashes($row["fecha_pedido"]);
			$ppedidos=stripslashes($row["total_pedido"]);
			$iddestados=stripslashes($row["estados_idestados"]);
			//$iddforma=stripslashes($row["formadepago_idformadepago"]);

			 //subconsulta
			  
				
				include ('conexion.php');
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


			/*$sql3 = "SELECT * FROM formadepago where idformadepago='$iddforma'";
           if( !$result3 = $db->query($sql2))
              {
            die ('No conecta ['.$db->error.']');
             }
            while($row3 = $result3->fetch_assoc())
            {
      
            $ttipopago=stripslashes($row3["tipo_de_pago"]);
            }
			*/




		  //consulta productos
		  		echo"<tr >";
		  		echo "<td>$iddpedidos</td>";
				echo "<td>$nnombre</td>";
          		echo"<td>$ffechav</td>";
          		echo"<td>$ppedidos</td>";
          		echo"<td>$descripcion</td>";
          		//echo"<td>$ttipopago</td>";

				//editar
				echo "<td>";
				echo "<form id=form1 name=form1 method=post action='modificardatospe.php'>";

				echo "<input type='hidden'  name=idpedidos value=$iddpedidos />";

				echo "<input type=submit  name=submit value=editar class='btn btn-warning' />";
      echo "</form>";
	  echo "</td>";
	  
	  //eliminar
	 // echo "<td>";



	  // aqui se hace la puta funcion en el puto form2 

	  //echo "<form id=form2 name=form2 method=post action='eliminar_usuario.php'>";
	  //echo "<input type='hidden'  name=numerodocumento value=$ddocumento />";
	  //echo "<input type=submit  name=submit value=eliminar class='btn btn-danger' />";
      //echo "</form>";
	  echo "</td>";
      echo "</tr>";
      			
			}
			//fin del while
			echo"</table>";
	
	 }//fin del metodo
	 
	 

 }//fin de la clase
 
 $nuevo=new usuario();
 $nuevo->listar();
    ?>
          </p>
</td>
</tr>
</table>
      <?php
include('footer.html');
?> 
      

</body>
</html>     