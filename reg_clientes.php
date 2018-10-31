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
<title>Registrar Usuarios</title>

</head>

<body>
<?php
include('banner.html');
?>
 
        <center>
      <h1 >REGISTRAR CLIENTES</h1>
	  </center>	  
	  <!-- Formulario !-->
     <div class="container">

  
  <form id="form1" name="form1" method="post" action="neg_registrar_clientes.php">
      <p>
        <label for="celular"></label>
        </p>
    <label for="celular"></label>
        </p>
    <div class="form-group">
      <label class="control-label col-sm-2" for="nombre_cliente">Nombre:</label>
      <div class="col-sm-10">
        <input type="nombre_cliente" class="form-control" id="nombre_cliente" placeholder="Ingrese Nombre" name="nombre_cliente">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="apellido_cliente">Apellido:</label>
      <div class="col-sm-10">
        <input type="apellido_cliente" class="form-control" id="apellido_cliente" placeholder="ingrese apellido" name="apellido_cliente">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="celular">Celular:</label>
      <div class="col-sm-10">
        <input type="celular" class="form-control" id="celular" placeholder="Ingrese numero de celular " name="celular">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="email_cliente">Email:</label>
      <div class="col-sm-10">
        <input type="email_cliente" class="form-control" id="email_cliente" placeholder="Ingrese correo electronico" name="email_cliente">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="contrasena_cliente">Contraseña:</label>
      <div class="col-sm-10">          
        <input type="contrasena_cliente" class="form-control" id="contrasena_cliente" placeholder="ingrese contraseña" name="contrasena_cliente">
      </div>
    </div>   


                                     
<center>

 <input type="submit" name="button" id="button" value="Registrar usuario" />
</center>
</div>



</body>

</html>
<?php
include('footer.html')
?> 