<?php include ("seguridad_admin.php")
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Novillo de Oro</title>
<style>
</style>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/estilonovillo.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Restaurante el novillo de oro</title>
</head>
<body>
<table width="120" height="120" border="0" align="center" >
  <tr>
    <td width="120" height="120"><?php include ("banner_pro.html")
    ?></td>
  </tr>
  <font color="white"><tr>
    <center><td height="420" align="center" >
      <p><br><br>
       <h2 class="fondoheaders">LISTA DE PROVEEDORES</h2>
       <br><br>

        <?php 
 class usuario
 {
	 public function listar ()
	 {
		 //session_start();
		 $cont='0';
		 
		 include ('conexion.php');
		 $sql = " SELECT * FROM stock ";
		 if( !$result = $db->query($sql))
		 {
			die ('No conecta ['.$db->error.']');
		 }
		 
		 	
			echo"<center><table width='40' height='180' class='fondotablas' border='0'></center>";
			 echo '<tr  bgcolor="#424242">';
        	 echo "<td>Informacion de entrada</td>";
			 echo "<td>Informacion de salida</td>";
			 echo "<td>Informacion de la cantidad</td>";
			 echo "<td>Proveedor</td>";
       	     echo "</tr>";
			

			while($row = $result->fetch_assoc())
			{
	
			$eentrada=stripslashes($row["entrada"]);
			$ssalida=stripslashes($row["salida"]);
			$ccantidad=stripslashes($row["cantidad"]);
			$iddproveedor=stripslashes($row["proveedor_idproveedor"]);

			
			$sql2 = "SELECT * FROM proveedor WHERE idproveedor= '$iddproveedor' ";
					 if( !$result2 = $db->query($sql2))
					 		{
						die ('No conecta ['.$db->error.']');
						 }
						while($row2 = $result2->fetch_assoc())
						{
						$ttipodocumento=stripslashes($row2["representante"]);
						}
  
		  //consulta productos
		  		echo"<tr>";
         		
				echo "<td>$eentrada</td>";
       			echo "<td>$ssalida</td>";
				echo "<td>$ccantidad</td>";
				echo "<td>$ttipodocumento</td>";
				/*//editar
				echo "<td>";
				echo "<form id=form1 name=form1 method=post action='modificardatos.php'>";

				echo "<input type=submit name=submit value=editar />";
      echo "</form>";
	  echo "</td>";
	  //eliminar
	  echo "<td>";
				echo "<form id=form2 name=form2 method=post action='eliminar_usuario.php'>";

				echo "<input type=submit name=submit value=eliminar />";
      echo "</form>";
	  echo "</td>";
       			echo "</tr>";*/
      			
			}
			//fin del while
			echo"</table>";
	
	 }//fin del metodo
	 
	 

 }//fin de la clase
 
 $nuevo=new usuario();
 $nuevo->listar();
    ?>
      </p>
      <center>
  
    <p><a href="index_aplicativo.php" class="btn btn-danger role"  aria-pressed="true">Volver</a>
    	<a href="reg_stock.php" class="btn btn-warning role"  aria-pressed="true">Registrar informacion del inventario</a></p>
    </center>

    </center>
    	</font>
    	</center>




     <?php
include('footer.html');
?> 
      
      
      </p>
     