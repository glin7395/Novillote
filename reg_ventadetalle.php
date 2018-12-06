<?php include ("seguridad_admin.php")
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="css/estilos.css">
            <link rel="stylesheet" type="text/css" href="css/estilonovillo.css">

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
<font color="white">

<table width="80" border="0" align="center" >
  <tr>
    <br>
      <h2 class="fondoheaders">Detalles de las ventas</h2>
      <br>

<div class="container"  style="background-color: rgb(0,0,0);opacity:0.4;}  ">


  <form id="form2" name="form1" method="post" action="neg_registrar_ventadetalle.php">


 <div class="form-group">
      <label class="control-label col-sm-2" for="pedidos_idpedidos">Pedido:</label>
      <div class="col-sm-10">
      <select name="pedidos_idpedidos" class="form-control">
        <?php
        
        include ('conexion.php');
                 $sql1 = "SELECT * FROM pedidos ";
           if( !$result1 = $db->query($sql1))
              {
            die ('No conecta ['.$db->error.']');
             }
            while($row1 = $result1->fetch_assoc())
            {
            $iddpedidos=stripslashes($row1["idpedidos"]);
            $ttipopago=stripslashes($row1["estados_idestados"]);
            
            echo "<option value =$iddpedidos>$ttipopago</option>";
            }
                
                ?>
                </select>
        </div>
  </div>

 <div class="form-group">
      <label class="control-label col-sm-2" for="plato_idplato">Producto:</label>
      <div class="col-sm-10">
      <select name="plato_idplato" class="form-control">
        <?php
        
        include ('conexion.php');
                 $sql2 = "SELECT * FROM plato ";
           if( !$result2 = $db->query($sql2))
              {
            die ('No conecta ['.$db->error.']');
             }
            while($row2 = $result2->fetch_assoc())
            {
            $iddplato=stripslashes($row2["idplato"]);
            $nnombrepla=stripslashes($row2["nombre_plato"]);
            echo "<option value =$iddplato>$nnombrepla</option>";
            }
                
                ?>
                </select>
                 <br><br><br>
        </div>
      </div>


          <div class="form-group">
      <label class="control-label col-sm-2" for="cantidad_venta">Cantidad:</label>
      <div class="col-sm-10">
        <input type="cantidad_pedido" class="form-control" id="cantidad_pedido"  name="cantidad_pedido">
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="cantidad_venta">precio del pedido:</label>
      <div class="col-sm-10">
        <input type="precio_pedido" class="form-control" id="precio_pedido"  name="precio_pedido">
      </div>
    </div>

       <tr>
          <td colspan="2" ><label for="contrasena">
            <div align="center">
              <input type="submit" name="button" id="button"  class="btn btn-danger role" value="Registrar" />
              </div>
            </label></td>
        </tr>
    </table>
      
    </form>
  </div>
  </tr>
  <tr>

  </tr>
</font>
</table>
<?php include ('footer.html');
?>
</body>
</html>