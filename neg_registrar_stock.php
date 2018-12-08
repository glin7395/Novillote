<?php include ("seguridad_admin.php")
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/estilonovillo.css" rel="stylesheet" type="text/css" media="all" />
<title>Restaurante el novillo de oro</title>
<style type="text/css">

</style>
</head>

<body>
<table  width="900" border="0" align="center">
  <tr>
    <td width="790" height="131"><?php include ("banner_pro.html")
    ?></td>
  </tr>
  <tr>
    <td height="642" align="center" class="fondotabla" "><form class="form-hotizontal"  name="form-hotizontal" method="post" action="">
      <p>
        <label for="numerodocumento"></label>
        </p>
      
      <font color="white"><center><p>REGISTRO DE INVENTARIO</p></center>

      <p><?php
	  class Registro 
	  {
		public function Registrar ($entrada,$salida,$cantidad,$proveedor_idproveedor)
		  { 
			 include ('conexion.php');
			 // consultar usuario existente
		
			 {
		 $sql1 = "INSERT INTO  stock (idstock,entrada,salida,cantidad,proveedor_idproveedor) VALUES (NULL,'$entrada','$salida','$cantidad','$proveedor_idproveedor')";
		
		 if( !$result1 = $db->query($sql1))
		 					{
						die ('No conecta ['.$db->error.']');
						 } 
			echo "<center>informacion registrada</center>";  
		  }
				  
		}	
	  }
	   
	$nuevo=new Registro();	
	$nuevo->Registrar($_POST["entrada"],$_POST["salida"],$_POST["cantidad"],$_POST["proveedor_idproveedor"])
	  	  ?>    
        
      </p>
      <p>&nbsp;</p></font>
     
    </form>
    <center><a href="reg_stock.php" class="btn btn-danger role"  aria-pressed="true">Volver a Registrar</a></center><br>
    <center><a href="index_aplicativo.php" class="btn btn-danger role"  aria-pressed="true">Salir</a></center>
   
    <p></p></td>
  </tr>
  <tr>
    <td height="43"><?php include ("footer.html")
    ?></td>
  </tr>
</table>
</body>
</html>