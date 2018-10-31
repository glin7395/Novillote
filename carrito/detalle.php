<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="utf-8"/>
	<title>Carrito de Compras</title>
	<link rel="stylesheet" type="text/css" href="./css/estilos.css">
	<script type="text/javascript"  href="./js/scripts.js"></script>
</head>
<body>
	<header>
		<h1>Detalle</h1>
		<a href="./carritodecompras.php" title="ver carrito de compras">
			<img src="./imagenes/carrito21.png">
		</a>
	</header>
	<section>
		
	<?php
  include ("conexion.php");
     $consulta="select * from plato where idPlato=".$_GET['id'];
 	 $query=mysqli_query($conexion, $consulta); 
  		while ($f=mysqli_fetch_array($query,MYSQLI_ASSOC)) {
  	?>

  
   	<center>
    	<img src="./productos/<?php echo $f['imagen'];?>"><br>
    	<div class="textcarrito">
    	<span><?php echo $f['nombre'];?></span><br>
    	<span>Descripción:<?php echo $f['descripcion'];?></span><br>
    	<span>Precio:<?php echo $f['precio'];?></span><br>
        </div>
    	<a href="./carritodecompras.php?id=<?php echo $f['idPlato'];?>"><p>Añadir al carrito de compras</p></a>
   		</center>
  	
 	<?php
 	 }
 	?>
		
		

		
	</section>
</body>
</html>