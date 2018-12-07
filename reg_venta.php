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
<link rel="shortcut icon" href="images/LOGO-SIRNO.ico">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/estilonovillo.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Restaurante el novillo de oro</title>
</head>
  
<body>
<?php include ('banner.html')
?>
<table width="120"  height="260" border="0" align="center">
<form id="form1" name="form1" method="post" action="neg_registrar_venta.php">
  <tr>
    <td height="260" align="center"><form id="form1" name="form1" method="post" action="neg_registrar_venta.php">
       <h2 class="fondoheaders">REGISTRO DE VENTAS</h2>
      
      <table width="140" height="259" border="0">
        
        <tr>
          <font color="white"><td ><div align="center"class="fondotablas" >FECHA</div></td></font>
          <td ><div align="center">

 <input type="date" name="fecha" min="2018-10-25"
                                 max="2020-12-30" >
          </div></td>
        </tr>
          <tr>
          <td ><div align="center"class="fondotablas">NOMBRE DEL CLIENTE</div></td>
          <td ><div align="center">
            <select name="clientes_idclientes" id="clientes_idclientes">
              <option value="seleccione:" >seleccione</option>
              <?php
        
        include ('conexion.php');
                 $sql2 = "SELECT * FROM clientes ";
           if( !$result2 = $db->query($sql2))
              {
            die ('No conecta ['.$db->error.']');
             }
            while($row2 = $result2->fetch_assoc())
            {
            $iddclientes=stripslashes($row2["idclientes"]);
            $ccliente=stripslashes($row2["nombre_cliente"]);
            echo "<option value =$iddclientes>$ccliente</option>";
            }
                
                ?>
            </select>
          </div></td>
        </tr>
        <tr>
          <td><div align="center"class="fondotablas">NOMBRE DEL VENDEDOR</div></td>
          <td ><div align="center">
            <select name="persona_idpersona" id="persona_idpersona">
              <option value="seleccione:" >seleccione</option>
              <?php
				
				include ('conexion.php');
                 $sql3 = "SELECT * FROM persona ";
					 if( !$result3 = $db->query($sql3))
					 		{
						die ('No conecta ['.$db->error.']');
						 }
						while($row3 = $result3->fetch_assoc())
						{
						$iddpersona=stripslashes($row3["idpersona"]);
						$nnombre=stripslashes($row3["nombre"]);
						echo "<option value =$iddpersona>$nnombre</option>";
						}
                
                ?>
            </select>
          </div></td>
        </tr>
      
  
       
       
        <tr>
          <td colspan="2" class="fondotablas"><label for="contrasena">
            <div align="center">
              <input type="submit" name="button" id="button" value="Registrar" />
              </div>
            </label></td>
        </tr>
    </table>
      
    </form>
  
  </tr>
  <tr>

  </tr>
</table>
<?php include ('footer.html');
?>
</body>
</html>