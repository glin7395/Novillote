
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Acceso Novillo de Oro</title>

<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/estilonovillo.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Restaurante el novillo de oro</title>
</head>
<body>
<table width="983" border="0" align="center" >
 <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
  <a class="navbar-brand" href="index.html">Restaurante Novillo de Oro </a>
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
</nav>

    <header class="masthead"  class="hea"  >
      <div class="overlay">
        <div class="container">
          <center>  <br>
          <h2 class="display-7 text-white">Administrador</h2></center>
        </div>
      </div>
    </header>
    <center>
 <td width="360" height="35" border="0"></td>
      </tr>
      <td height="200">
          <table width="200" height="100" border="0" align="center">
            <tr>
              <td height="120"><table width="110" border="0" align="center">
                <tr>
                  <th width="120" align="center" nowrap="nowrap" bgcolor= "">
          


 
                

                <center><img src="images/logosirno.png" width="120" height="120" class="pglo" />
                  <label class="display-7 text-white" for="contrasena">Ingrese su Documento</label><br>
                   <form action="recuperar_contrasena.php" method="post">
                    
                     <?php $variable=$_POST["algo"]; 
                               echo "<input type='hidden' name='rol' value='$variable'>";
                               if ($variable=="Clientes") {
                                 echo "<input type='text' name='email' placeholder='Email Cliente' required='on' >";
                               }
                               if ($variable!="Clientes") {
                                echo "<input type='text' name='contrasena' placeholder='Documento ' required='on' >";
                               }

                           ?>
                           <br>   <br>   
                           <input type="submit" name="" class="btn btn-primary" value="Recuperar">
                               
                    </center>
                          </div>
                              </th>
                                  </tr>

          
              <th width="20" height="140" align="center" nowrap="nowrap">
               <div class="row">
                  <div class="col-md-12" align="center">
                                              
                             
                              
                            

                            </form>
                            </div>
                              </th>
                   
       
                </tr>
                 </table>
                  </td>
                   </tr>
                    </table> 




    <footer  class="foot">
      <div class="container">
        <p class="m-0 text-center text-black">Derechos reservados © 2018 eldelsena best lince intergalactico de las montañas del himalaya</p>
          </div>
            </footer> 
              
                </td>
                  </tr>
                    </table>
                      </body>
                        </html>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <!--  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="js/boostrap.min.js"</script> -->





