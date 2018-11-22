<?php
// Conexion base de datos // 
$db = new mysqli('localhost','root','','novillo');
$acentos = $db->query("SET NAMES 'utf8'");
if ($db->connect_error > 0 )
{
	die('No se pudo conectar a DB [' . $db->connect_error . ']');
}
// Fin conexion base de datos// 

			
$documento=$_POST["contrasena"];
$sql="SELECT * FROM  persona WHERE numerodocumento='$documento'";
		if(!$result = $db->query($sql))
		{
			die('Se encontro un error [' . $db->error .']');	
		}
		$dbdocumento=0;
		while($row = $result->fetch_assoc())
						{
							$dbemail= stripslashes($row["email"]);
							$dbdocumento= stripslashes($row["numerodocumento"]);
							$dbnombre= stripslashes($row["nombre"]);

						}
		if($dbdocumento==0)
		{
			include("index_a.php");
			
		}
		if($dbdocumento!=0)
			{
			//Generando contraseña random
			$characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    		$charactersLength = strlen($characters);
    		$randomString = '';
   			 for ($i = 0; $i < 8; $i++)
   			  {
       	 	$randomString .= $characters[rand(0, $charactersLength - 1)];
       	 	}

       	 	//Cambiando Contraseña en la base de datos
       	 	$sql2="UPDATE persona SET contrasena='$randomString' WHERE numerodocumento='$documento'";
			if(!$result2 = $db->query($sql2))
			{
			die('Se encontro un error al cambiar contraseña [' . $db->error .']');	

    		}
			
			$subject  = 'Recuperar Contraseña';
			$message  = 'Señor(a) '.$dbnombre.'  aqui esta su nueva contraseña para ingresar a nuestro sistema <b>'.$randomString.' </b> ';
			$headers  = 'From: Novillo' . "\r\n" .
            'MIME-Version: 1.0' . "\r\n" .
            'Content-type: text/html; charset=utf-8';
			if(mail($dbemail, $subject, $message, $headers))
			   include("index.php");
			else
			    echo "Email sending failed";

		}
?>