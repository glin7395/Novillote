<?php
if(!isset($_REQUEST['id'])){
    header("Location: index_carrito.php");
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Orden Enviada </title>
    <meta charset="utf-8">
     <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="shortcut icon" href="img/LOGO-SIRNO.ico" />
    <link rel="stylesheet" type="text/css" href="css/estilo.css">


    <style>
    .container{width: 100%;padding: 50px;}
    p{color: #333;font-size: 18px;}
    </style>
</head>
</head>
<body>
<div class="container-fuid" align="center">
    <h1>Orden</h1><br>
    <p>su pedido ha sido Enviado. ID de Orden # <?php echo $_GET['id']; ?></p><br><br>
    <a href="index_carrito.php" class="btn btn-warning"><i class="glyphicon glyphicon-menu-left"></i> Regresar</a>
</div>
</body>
</html>