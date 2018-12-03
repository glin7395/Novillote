    <?php
// include database configuration file
include '../conexion.php';

    // seguridad cliente
    if (!session_id()) session_start();
    if ($_SESSION["estado"]!="1")
    {
    header ("location:../ind.php");
    
    }


include 'carrito.php';
$carrito = new Carro;

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Carrito</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="shortcut icon" href="img/LOGO-SIRNO.ico" />
    <link rel="stylesheet" type="text/css" href="css/estilo.css">
    <style>
    .container{padding: 50px;}
    .cart-link{width: 100%;text-align: right;display: block;font-size: 22px;}
    </style>
</head>
</head>
<body>
    <?php
include('banner_carrito.html');
?>
<div class="container">
    <div class="row">
      <h3 align="center"><font size="10%" color="white">  ¡BIENVENIDO!</font></h3>
<h1> Productos </h1>
    <a href="vercarrito.php" class="cart-link" title="View Cart"><i class="glyphicon glyphicon-shopping-cart"></i></a>
    <a href="salir_cliente.php" class="cart-link" title="logout"><i class="glyphicon glyphicon-off" ></i></a>
    <div id="products" class="row list-group">
        <?php
        //get rows query
        $query = $db->query("SELECT * FROM plato ORDER BY idplato DESC LIMIT 10");
        if($query->num_rows > 0){ 
            while($row = $query->fetch_assoc()){
        ?>

        <div class="item col-lg-4" style="border-radius:5px;" >
            <div class="thumbnail" style="border:1px solid #333; background-color:#f1f1f1; border-radius:5px; padding:16px; height:400px;" align="center">
                <img src="img/<?php echo $row["imagen_plato"]; ?>" class="img-responsive" /><br />  
                <div class="caption" align="center">
                    <h4 class="list-group-item-heading"><?php echo $row["nombre_plato"]; ?></h4>
                    <p class="list-group-item-text"><?php echo $row["descripcion_plato"]; ?></p>
                    <div class="row"><br>
                        <div class="col-md-6">
                            <p class="lead"><?php echo '$'.$row["precio_plato"].' Pesos'; ?></p>
                        </div>
                        <div class="col-md-6">
                            <a class="btn btn-success" href="carritoAction.php?action=addToCart&id=<?php echo $row["idplato"]; ?>">Agregar al carrito</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <?php } }else{ ?>
        <p> No se Encontraron Producto(s) .....</p>
        <?php } ?>
    </div>
</div>
</div>
</body>
</html>