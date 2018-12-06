<?php include ("seguridad_admin.php")
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Restaurante el novillo de oro</title>
<style type="text/css">

</style>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/estilonovillo.css" rel="stylesheet" type="text/css" media="all" />
</head>

<body>
  <table width="400" border="0" align="center" >
    <tr>
     <font color="white">
      <td width="480" height="131"><?php include ("banner.html")?></td>
        </tr>
          <tr>
            <td height="480" align="center"  border="0">
             <br>
                <center><h3>Actualizar Datos</h3>
     
      <?php 
 class usuario
 {
   public function listar ($idpedidos)
   {
     //session_start();
     $cont='0';
     
     include ('conexion.php');
     $sql = "SELECT * FROM pedidos Where idpedidos='$idpedidos' ";
     if( !$result = $db->query($sql))
     {
      die ('No conecta ['.$db->error.']');
     }
     
        echo"<br>";
       echo"<table width='80' height='110' border='0'>";
       echo '<tr bgcolor="#424242">';
       echo "<td>Id pedidos</td>";
       echo"<td>Clientes</td>";
       echo"<td>Fecha</td>";
       echo"<td>Total</td>";
       echo"<td>Estado</td>";
       echo "</tr>";
      
      while($row = $result->fetch_assoc())
      {
      $iidpedidos =stripslashes($row["idpedidos"]);
      $_SESSION["iidpedidos"]=stripslashes($row["idpedidos"]);  

      $nnombre=stripslashes($row["clientes_idclientes"]);
      $_SESSION["nnombre"]=stripslashes($row["clientes_idclientes"]);
      
      $aapellido=stripslashes($row["fecha_pedido"]);
      $_SESSION["aapellido"]=stripslashes($row["fecha_pedido"]);
      
      $ttelefono=stripslashes($row["total_pedido"]);
      $_SESSION["ttelefono"]=stripslashes($row["total_pedido"]);

      $ggenero_idgenero=stripslashes($row["estados_idestados"]);
      $_SESSION["ggenero_idgenero"]=stripslashes($row["estados_idestados"]);

      
  
        
        echo '<tr bgcolor="#777777">';
            //echo "<td>$ffk_id_rol</td>";
        echo "<td>$iidpedidos</td>";
        echo "<td>$nnombre</td>";
        echo"<td>$aapellido</td>";
        echo"<td>$ttelefono</td>";
        
        echo"<td>$ggenero_idgenero</td>";
 
        //echo "<td>$rrol</td>";
            echo "</tr>";
            
      }
      //fin del while
      echo"</table>";
  
   }//fin del metodo
   
   

 }//fin de la clase
 

 $nuevo=new usuario();
 $nuevo->listar($_POST["idpedidos"]);
    ?>

     <form id="form1" name="form1" method="post" action="modifiardatospedidos.php">
      <table width="180" height="140" style="background-color: transparent; color: white;" border="0">
         
         <tr>
          <td ><div align="center">Estado</div></td>
          <td ><label for="estados_idestados"></label>
            <div align="center">
              <select name="estados_idestados" id="estados_idestados">
                <option value="seleccione:" >seleccione</option>
                <?php
        
        include ('conexion.php');
                 $sql2 = "SELECT * FROM estados ";
           if( !$result2 = $db->query($sql2))
              {
            die ('No conecta ['.$db->error.']');
             }
            while($row2 = $result2->fetch_assoc())
            {
            $iddgenero=stripslashes($row2["idestados"]);
            $ttipogenero=stripslashes($row2["nombre_estado"]);
            echo "<option value =$iddgenero>$ttipogenero</option>";
            }
                
                ?>
                </select>
            </div></td>
        </tr>
  

            </div></td>
        </tr>

              

          <center><td colspan="2" ><label for="contrasena"></center>
            
            <div align="center">
                <div class="container">
                  
                    <input type="submit" class="btn btn-success "  name="button" id="button" value="Actualizar"/>
                    <br>

                     <input type="submit" class="btn btn-danger" value="Volver" href="listar_ventas.php"/>   
                  
                </div>
             </div>

              
                
                      </label>
                    </td>
                    <style type="text/css">
                      .btn{
                        margin-top: 3px;
                        margin-left: 550px;
                      }
                    </style>


        </tr>

    </font>    
    </center>    
    </table>
    </form>
    </td>
    </tr>
    <tr>
    <td height="43"><?php include ("footer.html")?></td>
    </tr>
    </table></body></html>