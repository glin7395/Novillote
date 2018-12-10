<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="css/bootstrap.min.css">
 <link rel="stylesheet" type="text/css" href="css/estilonovillo.css">
 <link rel="shortcut icon" href="images/LOGO-SIRNO.ico">

   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Registrar Usuarios</title>
<center>
<body>
  <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
  <a class="navbar-brand" href="">Restaurante Novillo de Oro </a>
    <a class="navbar-brand" href="inicio_sesion.php">Iniciar Sesion</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"   aria-controls="navbarSupportedContent"aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
        </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
       
         </li>

      <li class="nav-item">
       
        <li class="nav-item">
        
          <li class="nav-item">
          
            <li class="nav-item">

          </li>
        </ul>

     

    
  </div>

 <!-- form de registro del puto cliente-->

   
        <a href="inicio_sesion.php" class="btn btn-dark" role="button" aria-pressed="true">Salir</a>

   </nav>
   <font color="white">
    <br>
      <h1 class="fondoheaders">Ingresa tus datos</h1>
	  </center>	  
	  <!-- Formulario !-->
     <div class="container">
      <br>
    
  <form id="form3" name="form1" method="post" action="neg_registro_clientes.php">
      
     

    <div class="form-group">
      <label class="control-label col-sm-2" for="nombre_cliente">Nombre:</label>
      <div class="col-sm-10">
        <input type="nombre_cliente" class="form-control" id="nombre_cliente" placeholder="Ingresa tu Nombre" name="nombre_cliente" >
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="apellido_cliente">Apellido:</label>
      <div class="col-sm-10">
        <input type="apellido_cliente" class="form-control" id="apellido_cliente" placeholder="Ingresa tu Apellido" name="apellido_cliente">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="celular">Celular:</label>
      <div class="col-sm-10">
        <input type="celular" class="form-control" id="celular" placeholder="Ingresa tu Numero de celular " name="celular">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="email_cliente">Email:</label>
      <div class="col-sm-10">
        <input type="email_cliente" class="form-control" id="email_cliente" placeholder="Ingresa tu Correo electronico" name="email_cliente">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="contrasena_cliente">Contraseña:</label>
      <div class="col-sm-10">          
        <input type="contrasena_cliente" class="form-control" id="contrasena_cliente" placeholder="Ingresa  tu Contraseña" name="contrasena_cliente">
      </div>
    </div> 

     <div class="form-group">
      <label class="control-label col-sm-2" for="genero_idgenero">Genero:</label>
      <div class="col-sm-6 col-md-4">
      <select name="genero_idgenero" class="form-control btn btn-default dropdown-toggle"  style="height: 110%;" >
        <?php
        
        include ('conexion.php');
                 $sql2 = "SELECT * FROM genero ";
           if( !$result2 = $db->query($sql2))
              {
            die ('No conecta ['.$db->error.']');
             }
            while($row2 = $result2->fetch_assoc())
            {
            $iddgenero=stripslashes($row2["idgenero"]);
            $ttipogenero=stripslashes($row2["tipo_de_genero"]);
            echo "<option value =$iddgenero>$ttipogenero</option>";
            }
                
                ?>
                </select>
              </div>
            </div>
  
   <div class="form-group">
      <label class="control-label col-sm-2" for="tipodocumento_iddocumento">Tipo de documento:</label>
      <div class="col-sm-6 col-md-4">
      <select name="tipodocumento_iddocumento" class="form-control btn btn-default dropdown-toggle" style="height: 110%;">
          <?php
        
        include ('conexion.php');
                 $sql3 = "SELECT * FROM tipodocumento ";
           if( !$result3 = $db->query($sql3))
              {
            die ('No conecta ['.$db->error.']');
             }
            while($row3 = $result3->fetch_assoc())
            {
            $idddocumento=stripslashes($row3["iddocumento"]);
            $ttipodocumento=stripslashes($row3["tipo_de_documento"]);
            echo "<option value =$idddocumento>$ttipodocumento</option>";
            }
                ?>

                
      
      </select>
                 
      </div>

    </div>  



</font>
<center>
  <br>
 <input type="submit" name="button" id="button"   class="btn btn-danger role"  value="Registrate" /></center>


</div>
</form>
<br>
<div class="container"  style="background-color: rgb(25,45,45);opacity:0.8;}  ">
                 <center>><div style= 'color:#FFFFFF; font-size:12px;'>Ingresaras al sistema con tu Correo Electronico / E-mail</div></center>
</div>


    <footer  class="foot">
      <div class="container">
        <p class="m-0 text-center text-white">Derechos reservados © 2018 Novillo de Oro</p>
          </div>
            </footer> 
</font>
</body>

</html>
