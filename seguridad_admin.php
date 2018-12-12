<?php
	session_start();
	
		if(
			($_SESSION["estado"]!="1")
			&&
			($_SESSION["id_rol"]!="admin")
			&&
			($_SESSION["tipo_documento_cliente"]!="1")
		)
		{
		header ("location: index_a.php");
		}

?>