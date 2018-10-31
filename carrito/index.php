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
		<h1>Carrito De Compras</h1>
		<a href="./carritodecompras.php" title="ver carrito de compras">
			<img src="./imagenes/carrito21.png">
		</a>
	</header>
	<section>
		
	<?php
  include ("conexion.php");
     $consulta="select * from plato";
 	 $query=mysqli_query($conexion, $consulta); 
  		while ($f=mysqli_fetch_array($query,MYSQLI_ASSOC)) {
  	?>

   <div class="producto">
   	<center>
    	<img src="./productos/<?php echo $f['imagen'];?>"><br>
    	<span><?php echo $f['nombre'];?></span><br>
    	<a href="./detalle.php?id=<?php echo $f['idPlato'];?>"><div class="textcarrito">
    	ver</div> </a>
   		</center>
  	</div>
 	<?php
 	 }
 	?>
		
	</section>
</body>
</html>