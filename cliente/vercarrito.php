<?php
// inizializando clase de carrito
include 'carrito.php';

// seguridad cliente
    if (!session_id()) session_start();
    if ($_SESSION["estado"]!="1")
    {
    header ("location:../ind.php");
    
    }

$carrito = new Carro;
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Ver Carrito</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="shortcut icon" href="img/LOGO-SIRNO.ico" />
    <link rel="stylesheet" type="text/css" href="css/estilo.css">
    <style>
    .container{padding: 50px;}
    input[type="number"]{width: 20%;}
    </style>
    <script>
    function updateCartItem(obj,id){
        $.get("carritoAction.php", {action:"updateCartItem", id:id, qty:obj.value}, function(data){
            if(data == 'ok'){
                location.reload();
            }else{
                alert('El carrito no a actualizado los articulos, Por Favor Intenta nuevamente.');
            }
        });
    }
    </script>
</head>
</head>
<body>
        <?php
include('banner_carrito.html');
?>
<br> 
<br>
<div class="container" style="background-color: rgb(10,25,25);opacity:0.8;">
    <font color="white"><h1>Carrito de Compras</h1>
    <div class="table-responsive" >
    <table class="table table-bordered ">
    <thead>
        <tr>
            <th>Producto</th>
            <th>Precio</th>
            <th><center>Cantidad</center></th>
            <th><center>Subtotal</center></th>
            <th>&nbsp;</th>
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
            <td><input type="text" class="form-control text-center" value="<?php echo $item["qty"]; ?>" onchange="updateCartItem(this, '<?php echo $item["rowid"]; ?>')"></td>
            <td align="center"><?php echo '$'.$item["subtotal"].'.000'; ?></td>
            <td align="center">
                <a href="carritoAction.php?action=removeCartItem&id=<?php echo $item["rowid"]; ?>" class="btn btn-danger" onclick="return confirm('Estas seguro?')"><i class="glyphicon glyphicon-trash"></i></a>
            </td>
        </tr>
        </font>
        <?php } }else{ ?>
        <tr><td colspan="5"><p>Tu Carrito esta Vacio.....</p></td>
        <?php } ?>
    </tbody>
    <tfoot>
        <tr>
            <td><a href="index_carrito.php" class="btn btn-warning"><i class="glyphicon glyphicon-menu-left"></i> Seguir Comprando</a></td>
            <td colspan="2"></td>
            <?php if($carrito->total_items() > 0){ ?>
            <td class="text-center"><strong>Total <?php echo '$'.$carrito->total().'.000 Pesos'; ?></strong></td>
            <td><a href="checkout.php" class="btn btn-success btn-block">Checkout <i class="glyphicon glyphicon-menu-right"></i></a></td>
            <?php } ?>
        </tr>
    </tfoot>
    </table>
</div>
</div>
</body>
</html>