<html>
	<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="css/estilos.css">
		<link rel="shortcut icon" href="mario.ico">
		<title>Inicio</title>
    <style >
    </style>
    <link href="css/estilonovillo.css" rel="stylesheet" type="text/css" media="all" />
    <link rel="shortcut icon" href="images/LOGO-SIRNO.ico" />
	</head>


<body >



<div id="header">			
<font size="1px" color="white"> <h1 class="titulo">
<img src="images/LOGOSIRNO.png" width="95" height="85">NOVILLO DE ORO</h1></font>		

<div id='cssmenu'>



<ul>




   <li><a href='index_aplicativo.php' target="iframe_a" ><span>Inicio</span></a></li>
   <li class='active has-sub'><a href='#'><span>Usuarios</span></a>
   <ul>
     <li ><a href='reg_usuarios.php' target="iframe_a"><span>Registrar usuario</span></a>
   	 <li ><a href='listar_solousuarios.php' target="iframe_a"><span>Listar  Usuarios</span></a>
   	  <li ><a href='listar_administradores.php' target="iframe_a"><span>Listar Administradores</span></a>	
         <li ><a href='listar_usuarios.php' target="iframe_a"><span>Listar Todos los usuarios</span></a>
           <li ><a href='modificar.php' target="iframe_a"><span>Modificar Datos de Usuario</span></a>
     
</ul>	



   <li class='active has-sub'><a href='#'><span >Inventario</span></a>
      <ul>
         


         <li class='has-sub'><a href='#'><span>Categoria</span></a>
            <ul>
               <li><a href='reg_categoria_admin.php'><span>Registrar Categorias</span></a></li>
              <li class='has-sub'><a href='listar_Categorias_admin.php'><span>Ver Categorias</span></a>
          
         </li>
            
            </ul>
         </li>
     



         <li class='has-sub'><a href='#'><span>Platos</span></a>
            <ul>
               <li><a href='reg_productos.php'><span>Registrar Plato nuevo</span></a></li>
               <li class='last'><a href='listar_productos.php'><span>Listar Platos</span></a></li>
            
            </ul>
         </li>



         <li class='has-sub'><a href='#'><span>Proveedor</span></a>
            <ul>
            <li><a href='reg_proveedor_admin.php'><span>Registrar Proveedores</span></a></li>
             <li class='last'><a href='listar_proveedores_admin.php'><span>Listar Proveedores</span></a></li>
            </ul>
         </li>
      </ul>
   </li>



   <li>
  <a href='#'><span>Ventas</span></a>
      <ul>
               
                <li class='last'><a href='listar_ventas.php' target="iframe_a"><span>Listar Ventas</span></a></li>
                 <li class='last'><a href='listar_detalleventa.php' target="iframe_a"><span>Listar informacion</span></a></li>
                  
      </ul>
  </li>



   <li><a href='#'><span>Clientes</span></a>
   <ul>
         
         
             <li class='last'><a href='reg_clientes_admin.php' target="iframe_a"><span>Clientes</span></a></li>
             <li class='last'><a href='listar_clientes.php' target="iframe_a"><span>Lista de Clientes</span></a></li>
      
      </li>
                 
            </ul></li>






   <li class="salirban"><a href='salir.php'><span style="">SALIR</span></a></li>






</ul>





</div>
</table>


<?php 
echo "Usuario #Identificacion : ";
echo $_SESSION['numerodocumento'];
?>




