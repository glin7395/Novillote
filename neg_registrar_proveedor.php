<?php include ("seguridad_admin.php")
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="css/estilos.css">
<title>Restaurante el novillo de oro</title>
<style type="text/css">

</style>
</head>

<body>
<table width="900" border="0" align="center">
  <tr>
    <td width="790" height="131"><?php include ("banner.html")
    ?></td>
  </tr>
  <tr>
    <td height="642" align="center" bgcolor="transparent"><form class="form-hotizontal"  name="form-hotizontal" method="post" action="">
      <p>
        <label for="numerodocumento_pro"></label>
        </p>
      <p>&nbsp;</p>
      <p>REGISTRO DE PROVEEDORES</p>

      <p><?php
	  class Registro 
	  {
		public function Registrar ($representante,$empresa,$contrasena_pro,$numerodocumento_pro,$tipodocumento_iddocumento )
		  { 
			 include ('conexion.php');
			 // consultar usuario existente
			 $existencia=0;
			  $sql = "SELECT * FROM proveedor where numerodocumento_pro='$numerodocumento_pro'";
					 if( !$result = $db->query($sql))
					 		{
						die ('No conecta ['.$db->error.']');
						 }
						while($row = $result->fetch_assoc())
						{
						$ddocumento=stripslashes($row["numerodocumento_pro"]);				
						$existencia=$existencia+1;
						}	 
			 // 
			 if ($existencia=="0")
			 {
		 $sql2 = "INSERT INTO  proveedor (idproveedor,representante,empresa,contrasena_pro,numerodocumento_pro,tipodocumento_iddocumento) VALUES (NULL,'$representante','$empresa',$contrasena_pro,'$numerodocumento_pro','$tipodocumento_iddocumento')";
		 if( !$result2 = $db->query($sql2))
		 					{
						die ('No conecta ['.$db->error.']');
						 } 
			echo "proveedor registrado";  
		  }
		  if ($existencia!="0")
		  		{
			  echo"No se puede registrar";
			  }		  
		}	
	  }
	   
	$nuevo=new Registro();	
	$nuevo->Registrar($_POST["representante"],$_POST["empresa"],$_POST["contrasena_pro"],$_POST["numerodocumento_pro"],$_POST["tipodocumento_iddocumento"])
	  	  ?>    
        
      </p>
      <p>&nbsp;</p>
     
    </form>
   
    <p></p></td>
  </tr>
  <tr>
    <td height="43"><?php include ("footer.html")
    ?></td>
  </tr>
</table>
</body>
</html>