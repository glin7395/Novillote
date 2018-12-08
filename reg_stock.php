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
<title>Registrar inventario</title>

</head>

<body>
<?php
include('banner_pro.html');
?>
 
        <center>
       <font color="white"><h2 >Registro de inventario</h2>
	  </center>	  
	  <!-- Formulario !-->
     <div class="container">

  
  <form class="form-horizontal" id="form1" name="form1" method="post" action="neg_registrar_stock.php">
      
       
    <div class="form-group">
     <label class="control-label col-sm-2"  for="entrada">Entrada:</label> 
      <div class="col-sm-8">
        <input type="entrada"  class="form-control" id="entrada" placeholder="Ingrese informacion del producto de entrada " name="entrada">
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="salida">Salida:</label>
      <div class="col-sm-8">
        <input type="salida" class="form-control" id="salida" placeholder="Ingrese informacion del producto de salida " name="salida">
      </div>
    </div>

     <div class="form-group">
      <label class="control-label col-sm-2" for="cantidad">cantidad:</label>
      <div class="col-sm-8">
        <input type="cantidad" class="form-control" id="cantidad" placeholder="Ingrese informacion de la antidad del producto" name="cantidad">
      </div>
    </div>
 
  <div class="form-group">
      <label class="control-label col-sm-2" for="proveedor_idproveedor">Proveedor:</label>
      <div class="col-sm-8">
      <select name="proveedor_idproveedor" class="form-control">
        <?php
        
        include ('conexion.php');
                 $sql2 = "SELECT * FROM proveedor ";
           if( !$result2 = $db->query($sql2))
              {
            die ('No conecta ['.$db->error.']');
             }
            while($row2 = $result2->fetch_assoc())
            {
            $iddgenero=stripslashes($row2["idproveedor"]);
            $ttipogenero=stripslashes($row2["representante"]);
            echo "<option value =$iddgenero>$ttipogenero</option>";
            }
                
                ?>
                </select></div></div>

   




    <input type="submit" name="button" id="button" value="Registrar usuario"  class="btn btn-danger role=" />
  </form>
</div>
</font>
</center>

<?php include ('footer.html'); 
?>
</body>
</html>
