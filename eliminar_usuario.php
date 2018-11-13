<?php 
 class eliminacion
 {
	 public function eliminar ($numerodocumento)
	 {
		 //session_start();
		 $cont='0';
		 
		 include ('conexion.php');
		 $sql = "DELETE FROM persona WHERE numerodocumento ='$numerodocumento'";
		 if( !$result = $db->query($sql))
		 {
			die ('No conecta ['.$db->error.']');
		 }
		 	echo "el usuario a sido eliminado";  

	 }//fin del metodo
	 
	

 }//fin de la clase
 
 $nuevo=new eliminacion();
 $nuevo->eliminar($_POST["numerodocumento"]);
    ?>
	