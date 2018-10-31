<?php
session_start();
					 $arreglo=$_SESSION['carrito'];
   					 $encontro=false;
   					 $numero=0;
    					for($i=0;$i<count($arreglo);$i++)
    					{
     						if($arreglo[$i]['Id']==$_GET['id'])
     						{
     						 $encontro=true;
      						 $numero=$i;
    						 }
    					}
    					if($encontro==true)
    					{
    						$arreglo[$numero]['Cantidad']=$arreglo[$numero]['Cantidad']+1;
    						$_SESSION['carrito']=$arreglo;
    					}

					

?>