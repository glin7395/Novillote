<?php
	session_start();
	$_session= array();

	$_session["estado"]="0";
	$_session["id_rol"]="0";
	$_session["tipo_documento_cliente"]="0";
	header ("location: index.php");

	session_destroy();
?>