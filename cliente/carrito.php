<?php 
if (!session_id()) session_start();
class Carro {
    protected $contenido_carrito = array();
    
    public function __construct(){
        // obtener el array de carrito de la compra de la sesión
        $this->contenido_carrito = !empty($_SESSION['contenido_carrito'])?$_SESSION['contenido_carrito']:NULL;
        if ($this->contenido_carrito === NULL){
            // establecer algunos valores base
            $this->contenido_carrito = array('total_carrito' => 0, 'total_items' => 0);
        }
    }
    
    /**
     * Contenido del carrito: devuelve el array del carrito completo
     * @param    bool
     * @return    array
     */
    public function contents(){
        // reorganizar el más nuevo primero
        $carrito = array_reverse($this->contenido_carrito);

        // removerlos para que no creen un problema al mostrar la tabla del carrito
        unset($carrito['total_items']);
        unset($carrito['total_carrito']);

        return $carrito;
    }
    
    /**
     * obtener carrito item: Devuelve los detalles de un artículo específico del carrito.
     * @param    string    $row_id
     * @return    array
     */
    public function obtener_item($row_id){
        return (in_array($row_id, array('total_items', 'total_carrito'), TRUE) OR ! isset($this->contenido_carrito[$row_id]))
            ? FALSE
            : $this->contenido_carrito[$row_id];
    }
    
    /**
     * Total Items: Devuelve el total de artículos
     * @return    int
     */
    public function total_items(){
        return $this->contenido_carrito['total_items'];
    }
    
    /**
     * carrito Total: Devuelve el precio total
     * @return    int
     */
    public function total(){
        return $this->contenido_carrito['total_carrito'];
    }
    
    /**
     * Insertar elementos en el carrito y guardarlo en la sesión.
     * @param    array
     * @return    bool
     */
    public function insert($item = array()){
        if(!is_array($item) OR count($item) === 0){
            return FALSE;
        }else{
            if(!isset($item['id'], $item['name'], $item['price'], $item['qty'])){
                return FALSE;
            }else{
                /*
                 * Insert Item
                 */
                // preparar la cantidad
                $item['qty'] = (float) $item['qty'];
                if($item['qty'] == 0){
                    return FALSE;
                }
                // preparar el precio
                $item['price'] = (float) $item['price'];
                // crear un identificador único para el artículo que se inserta en el carrito
                $rowid = md5($item['id']);
                // obtener la cantidad si ya está allí y agregarlo en
                $old_qty = isset($this->contenido_carrito[$rowid]['qty']) ? (int) $this->contenido_carrito[$rowid]['qty'] : 0;
                // volver a crear la entrada con identificador único y cantidad actualizada
                $item['rowid'] = $rowid;
                $item['qty'] += $old_qty;
                $this->contenido_carrito[$rowid] = $item;
                
                // save carrito Item
                if($this->save_carrito()){
                    return isset($rowid) ? $rowid : TRUE;
                }else{
                    return FALSE;
                }
            }
        }
    }
    
    /**
     * Actualizar el carrito
     * @param    array
     * @return    bool
     */
    public function update($item = array()){
        if (!is_array($item) OR count($item) === 0){
            return FALSE;
        }else{
            if (!isset($item['rowid'], $this->contenido_carrito[$item['rowid']])){
                return FALSE;
            }else{
                // prep the quantity
                if(isset($item['qty'])){
                    $item['qty'] = (float) $item['qty'];
                    // remove the item from the carrito, if quantity is zero
                    if ($item['qty'] == 0){
                        unset($this->contenido_carrito[$item['rowid']]);
                        return TRUE;
                    }
                }
                
                // find updatable keys
                $keys = array_intersect(array_keys($this->contenido_carrito[$item['rowid']]), array_keys($item));
                // prep the price
                if(isset($item['price'])){
                    $item['price'] = (float) $item['price'];
                }
                // product id & name shouldn't be changed
                foreach(array_diff($keys, array('id', 'name')) as $key){
                    $this->contenido_carrito[$item['rowid']][$key] = $item[$key];
                }
                // save carrito data
                $this->save_carrito();
                return TRUE;
            }
        }
    }
    
    /**
     * Save the carrito array to the session
     * @return    bool
     */
    protected function save_carrito(){
        $this->contenido_carrito['total_items'] = $this->contenido_carrito['total_carrito'] = 0;
        foreach ($this->contenido_carrito as $key => $val){
            // make sure the array contains the proper indexes
            if(!is_array($val) OR !isset($val['price'], $val['qty'])){
                continue;
            }
     
            $this->contenido_carrito['total_carrito'] += ($val['price'] * $val['qty']);
            $this->contenido_carrito['total_items'] += $val['qty'];
            $this->contenido_carrito[$key]['subtotal'] = ($this->contenido_carrito[$key]['price'] * $this->contenido_carrito[$key]['qty']);
        }
        
        // if carrito empty, delete it from the session
        if(count($this->contenido_carrito) <= 2){
            unset($_SESSION['contenido_carrito']);
            return FALSE;
        }else{
            $_SESSION['contenido_carrito'] = $this->contenido_carrito;
            return TRUE;
        }
    }
    
    /**
     * Remove Item: Removes an item from the carrito
     * @param    int
     * @return    bool
     */
     public function remove($row_id){
        // unset & save
        unset($this->contenido_carrito[$row_id]);
        $this->save_carrito();
        return TRUE;
     }
     
    /**
     * Destroy the carrito: Empties the carrito and destroy the session
     * @return    void
     */
    public function destroy(){
        $this->contenido_carrito = array('total_carrito' => 0, 'total_items' => 0);
        unset($_SESSION['contenido_carrito']);

                        
    }
}