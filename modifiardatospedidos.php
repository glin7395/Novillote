<?php include ("seguridad_admin.php")
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Acceso Novillo de Oro</title>

<style>
</style>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/estilonovillo.css" rel="stylesheet" type="text/css" media="all" />
</head>

<body>
	<font color="white">
<table width="900" border="3" align="center">
  <tr>
    <td width="790" height="131"><?php include ("banner.html")
    ?></td>
  </tr>
  <tr>
  	<td width="90" height="60" border="2" ><div align="center"  class="fondotabla">
  		<p align="center">CAMBIOS REALIZADOS</p>
    


      	<?php 
 class usuario
 {
	 public function listar ($estados_idestados )
	 
	 {	 
		 include ('conexion.php');


		 $sql = " UPDATE pedidos SET estados_idestados = '$estados_idestados ' ";
		 if( !$result = $db->query($sql))
		 {
			die ('No conecta cambios no realizados    ['.$db->error.']');
		 }

	   
	 }//fin del metodo
	 
	 	

 }//fin de la clase
 
 $nuevo=new usuario();
 $nuevo->listar($_POST["estados_idestados"])
    ?>
	 
	 
 </p>
      <p align="center"><a href="listar_ventas.php" class='btn btn-danger' >lista de cambios</a>
      	<br> 
      		<br> 
       <a href="index_aplicativo.php"   class='btn btn-success' > volver a registros</a>
      
</font>

