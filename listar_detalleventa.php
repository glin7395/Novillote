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
include('banner.php');
?>
<font color="white">
 <table width="160" border="0" align="center" >
  <tr>
  	 <br>
      <h2 class="fondoheaders">INFORMACION DE VENTAS</h2>
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
		 $sql = "SELECT detalle_pedido.pedidos_idpedidos,detalle_pedido.iddetalle_pedido,plato.nombre_plato,detalle_pedido.cantidad_pedido,detalle_pedido.precio_pedido,clientes.nombre_cliente,pedidos.total_pedido FROM detalle_pedido
INNER JOIN pedidos
ON detalle_pedido.pedidos_idpedidos=pedidos.idpedidos
INNER JOIN clientes
ON pedidos.clientes_idclientes=clientes.idclientes
INNER JOIN plato
on detalle_pedido.plato_idplato=plato.idplato
ORDER BY pedidos_idpedidos
";
		 if( !$result = $db->query($sql))
		 {
			die ('No conecta ['.$db->error.']');
		 }
		 	
		 	
		     echo"<table width='80' height='140' class='fondotablas' border='1'>";
			 echo '<tr  bgcolor="#424242">';
			 echo "<td>Pedido</td>";
			 echo "<td>detalle</td>";
			 echo "<td>Plato</td>"; 
			 echo"<td>Cantidad</td>";
			 echo "<tD>Precio</TD>";
			 echo "<tD>Cliente</TD>";
			 echo "<tD>Total</TD>";
       	     echo "</tr>";


			
			while($row = $result->fetch_assoc())
			{
			$iddpedidos=stripslashes($row["pedidos_idpedidos"]);
			$iddetalles=stripslashes($row["iddetalle_pedido"]);
			$nnombre_plato=stripslashes($row["nombre_plato"]);
			$ccantidad=stripslashes($row["cantidad_pedido"]);
			$pprecio=stripslashes($row["precio_pedido"]);
			$nnombre=stripslashes($row["nombre_cliente"]);
			$ttotal=stripslashes($row["total_pedido"]);
		


			 //subconsult
				
			/*include ('conexion.php');
                 $sql1 = "SELECT * FROM pedidos WHERE idpedidos='$iddpedidos'";
					 if( !$result1 = $db->query($sql1))
					 		{
						die ('No conecta ['.$db->error.']');
						 }
						while($row1 = $result1->fetch_assoc())
						{
						$nombrecliente=stripslashes($row1["idpedidos"]);
						}
						///	
			$sql2 = "SELECT * FROM plato WHERE idplato='$iddplato' ";
					 if( !$result2 = $db->query($sql2))
					 		{
						die ('No conecta ['.$db->error.']');
						 }
						while($row2 = $result2->fetch_assoc())
						{
						$nnombreplato=stripslashes($row2["nombre_plato"]);
						}*/
		  //consulta productos

		  		echo"<tr>";
		  		echo "<td>$iddpedidos</td>";
		  		echo "<td>$iddetalles</td>";
				echo "<td>$nnombre_plato</td>";
          		echo"<td>$ccantidad</td>";
          		echo"<td>$pprecio</td>";
          		echo"<td>$nnombre</td>";
          		echo"<td>$ttotal</td>";
				//editar
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