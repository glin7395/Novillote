<?php 

session_start();
$_SESSION["estado"]='0';
 unset($_SESSION['contenido_carrito']);

	header ("location: ../index.html")
	
?>
 
