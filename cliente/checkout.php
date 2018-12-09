<?php
// include database configuration file
include '../conexion.php';

// Inicializar carro de la compra
include 'carrito.php';
$carrito = new Carro;

// redirigir a casa si el carrito está vacío
if($carrito->total_items() <= 0){
    header("Location: index_carrito.php");
}
    
    $sql="SELECT * FROM clientes WHERE idclientes ='".$_SESSION["id_clientes"] ."' ";
                            if (!$result =$db->query($sql))
                            {
                                die('No se Conecta [' . $db->error. ']');
                            }
                            

// obtener detalles del cliente por sesión ID de cliente
$query = $db->query("SELECT * FROM clientes WHERE idclientes = ".$_SESSION['id_clientes']);
$custRow = $query->fetch_assoc();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Confirmar compra</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="shortcut icon" href="img/LOGO-SIRNO.ico" />
    <link rel="stylesheet" type="text/css" href="css/estilo.css">
    <style>
    .container{width: 100%;padding: 50px;}
    .table{width: 65%;float: left;}
    .shipAddr{width: 30%;float: left;margin-left: 30px;}
    .footBtn{width: 95%;float: left;}
    .orderBtn {float: right;}
    </style>
</head>
<body>
    <?php
include('banner_carrito.html');
?>
<br>
<div class="container" style="background-color: rgb(10,25,25);opacity:0.8;">
    <font color="white"><h1>Datos del Pedido</h1><hr>
    <table class="table">
    <thead>
        <tr>
            <th>Producto</th>
            <th>Precio</th>
            <th>Cantidad</th>
            <th>Subtotal</th>
        </tr>
    </thead>
    <tbody>
        <?php
        if($carrito->total_items() > 0){
            //obtener artículos del carrito de sesión
            $cartItems = $carrito->contents();
            foreach($cartItems as $item){
        ?>
        <tr>
            <td><?php echo $item["name"]; ?></td>
            <td><?php echo '$'.$item["price"].'.000'; ?></td>
            <td><?php echo $item["qty"]; ?></td>
            <td><?php echo '$'.$item["subtotal"].'.000'; ?></td>
        </tr>
        <?php } }else{ ?>
        <tr><td colspan="4"><p>No hay Articulos en tu carrito......</p></td>
        <?php } ?>
    </tbody>
    <tfoot>
        <tr>
            <td colspan="3"></td>
            <?php if($carrito->total_items() > 0){ ?>
            <td class="text-center"><strong>Total <?php echo '$'.$carrito->total().'.000 Pesos'; ?></strong></td>
            <?php } ?>
        </tr>
    </tfoot>
    </table>
    <div class="shipAddr">
        <h4><b>Detalles de Envio</b></h4>
        <p><?php echo $custRow['nombre_cliente']; ?> <?php echo $custRow['apellido_cliente']; ?></p>
        <p><?php echo $custRow['email_cliente']; ?></p>
        <p><?php echo $custRow['celular']; ?></p><hr>
    </div>
    <div class="footBtn">
        <a href="index_carrito.php" class="btn btn-warning"><i class="glyphicon glyphicon-menu-left"></i> Seguir Comprando</a>
        <a href="carritoAction.php?action=placeOrder" class="btn btn-success orderBtn">Realizar Pedido <i class="glyphicon glyphicon-menu-right"></i></a>
    </div>
    </font>
</div>
</body>
</html>