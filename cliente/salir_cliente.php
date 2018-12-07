<?php 

session_destroy();
$_SESSION["estado"]='0';
 unset($_SESSION['contenido_carrito']);

	header ("location: ../inicio_sesion.php")
	
?>
 
