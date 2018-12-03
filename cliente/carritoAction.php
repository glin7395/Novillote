<?php
// Inicializar compra del carrito 
include 'carrito.php';
$carrito = new Carro;

// incluir el archivo de configuración de la base de datos
include '../conexion.php';
if(isset($_REQUEST['action']) && !empty($_REQUEST['action'])){
    if($_REQUEST['action'] == 'addToCart' && !empty($_REQUEST['id'])){
        $productID = $_REQUEST['id'];
        // obtener detalles del producto
        $query = $db->query("SELECT * FROM plato WHERE idplato = ".$productID);
        $row = $query->fetch_assoc();
        $itemData = array(
            'id' => $row['idplato'],
            'name' => $row['nombre_plato'],
            'price' => $row['precio_plato'],
            'qty' => 1
        );
        
        $insertItem = $carrito->insert($itemData);
        $redirectLoc = $insertItem?'vercarrito.php':'index_carrito.php';
        header("Location: ".$redirectLoc);
    }elseif($_REQUEST['action'] == 'updateCartItem' && !empty($_REQUEST['id'])){
        $itemData = array(
            'rowid' => $_REQUEST['id'],
            'qty' => $_REQUEST['qty']
        );
        $updateItem = $carrito->update($itemData);
        echo $updateItem?'ok':'err';die;
    }elseif($_REQUEST['action'] == 'removeCartItem' && !empty($_REQUEST['id'])){
        $deleteItem = $carrito->remove($_REQUEST['id']);
        header("Location: vercarrito.php");


        /* Insertar orden*/

    }elseif($_REQUEST['action'] == 'placeOrder' && $carrito->total_items() > 0 && !empty($_SESSION['id_clientes'])){
        // insertar detalles del pedido en la base de datos
        $insertOrder = $db->query("INSERT INTO pedidos (clientes_idclientes, fecha_pedido, total_pedido, estados_idestados) VALUES ('".$_SESSION['id_clientes']."', '".date("Y-m-d H:i:s")."', '".$carrito->total()."', '1')");
        
        if($insertOrder){
            $orderID = $db->insert_id;
            $sql = '';
            // obtener items del carrito
            $cartItems = $carrito->contents();
            foreach($cartItems as $item){
                $sql .= " INSERT INTO detalle_pedido (pedidos_idpedidos, plato_idplato, cantidad_pedido, precio_pedido) VALUES ('".$orderID."', '".$item['id']."', '".$item['qty']."', '".$item['price']."');";
            }
            // insertar itmes de la orden a la base de datos
            $insertOrderItems = $db->multi_query($sql);
            
            if($insertOrderItems){
                $carrito->destroy();
                header("Location: orden.php?id=$orderID");
            }else{
                header("Location: checkout.php");
            }
        }else{
            header("Location: login_error_cliente.php");
        }
    }else{
        header("Location: index_carrito.php");
    }
}else{
    header("Location: index_carrito.php");
}