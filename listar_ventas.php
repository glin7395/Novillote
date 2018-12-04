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
		 $sql = "SELECT * from plato;
		 if( !$result = $db->query($sql))
		 {
			die ('No conecta ['.$db->error.']');
		 }
		 
		 	
			echo"<table width='80' height='140' class='fondotablas' border='0'>";
			 echo '<tr  bgcolor="#424242">';
        	 
			 echo "<td>fecha</td>";
         	 echo"<td>cliente</td>";
         	 echo "<tD>Nombre del vendedor</TD>";
         	
       	     echo "</tr>";
			
			while($row = $result->fetch_assoc())
			{	
			$ffechav=stripslashes($row["fecha"]);
			$ccliente=stripslashes($row["nombre_cliente"]);
			$ppersona=stripslashes($row["nombre"]);
			
			
			
			
			 //subconsulta
			  
				
				include ('conexion.php');
                 $sql = "SELECT * FROM categoria ";
					 if( !$result = $db->query($sql))
					 		{
						die ('No conecta ['.$db->error.']');
						 }
						while($row = $result->fetch_assoc())
						{
						$ffk_id_categoria=stripslashes($row["idcategoria"]);
						$categoria=stripslashes($row["tipo_categoria"]);
						echo "<option value =$ffk_id_categoria>$categoria</option>";
						}
                
                
/*
						///	
			$sql2 = "SELECT * FROM fk_id_rol WHERE idrol='$iddrol' ";
					 if( !$result2 = $db->query($sql2))
					 		{
						die ('No conecta ['.$db->error.']');
						 }
						while($row2 = $result2->fetch_assoc())
						{
						$rrol=stripslashes($row2["des_rol"]);
						
						}
          //finsubconsulta
		   //consulta
		   $sql3 = "SELECT * FROM tipodocumento WHERE iddocumento='$iddocumento' ";
					 if( !$result3 = $db->query($sql3))
					 		{
						die ('No conecta ['.$db->error.']');
						 }
						while($row3 = $result3->fetch_assoc())
						{
						$ttipodocumento=stripslashes($row3["tipo_de_documento"]);
						}
		  
		  
		  */    //fin consulta
		  // otra consubta
		      
                
		  
		  // fin de otra consuta
		 
  
		  //consulta productos
		  		echo"<tr >";
				echo "<td>$ffechav</td>";
          		echo"<td>$ccliente</td>";
          		echo"<td>$ppersona</td>";
          		
				//editar
				//echo "<td>";
				//echo "<form id=form1 name=form1 method=post action='modificardatos.php'>";

				//echo "<input type='hidden'  name=numerodocumento value=$ddocumento />";

				//echo "<input type=submit  name=submit value=editar class='btn btn-warning' />";
     // echo "</form>";
	  //echo "</td>";
	  
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

     