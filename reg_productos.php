<?php include ("seguridad_admin.php")
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="css/estilos.css">
          <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Restaurante el novillo de oro</title>
<style type="text/css">

</style>
</head>

<body>
<?php include ('banner.html')
?>
<table width="900" border="0" align="center">
  <tr>
    <td height="642" align="center" ><form id="form1" name="form1" method="post" action="neg_registrar_productos.php">
      <p>
        <label for="id_producto"></label>
        </p>
      <p>PRODUCTOS</p>
      <p></p>
      <table width="351" height="259" border="0">
        <tr>
          <td width="92" bgcolor="#FFFFFF"><div align="center">producto</div></td>
          <td width="140" bgcolor="#FFFFFF"><div align="center">
            <input type="text" name="nombre_producto" id="textfield3" />
          </div></td>
        </tr>
        <tr>
          <td bgcolor="#FFFFFF"><div align="center">precio</div></td>
          <td bgcolor="#FFFFFF"><div align="center">
            <input type="number" name="precio_producto" id="textfield4" />
          </div></td>
        </tr>
      
        <tr>
          <td bgcolor="#FFFFFF"><div align="center">categoria</div></td>
          <td bgcolor="#FFFFFF"><div align="center">
            <select name="categoria_idcategoria" id="categoria_idcategoria">
              <option value="seleccione:" >seleccione</option>
              <?php
				
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
                
                ?>
            </select>
          </div></td>
        </tr>
        <tr>
          <center><td colspan="2" bgcolor="#FFFFFF"><label for="contrasena">
            <input type="submit" name="button" id="button" value="Registrar" /></center>
            </label></td>
        </tr>
    </table>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
    </form>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    </td>
  </tr>
</table>
</body>
</html>
<?php
include('footer.html');
?> 