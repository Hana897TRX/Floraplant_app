<?php

//--------------------------Datos de conexión
$servername="localhost";
$username="root"; //cambiar por credenciales enviados en el correo
$password="";
$dbname="shop2floramundo_tienda";

$conn = new mysqli($servername,$username,$password,$dbname);

//Checar conexión
if($conn->connect_error){
    die("Connection failed: ".$conn->connection_error);
    return;
}

//-----------------------------------------------
$action = $_POST["action"]

//obtener ordenes por id de customer
if("ORDERS_CUSTOMER"==$action){
    $db_data=array();
    $customerId = $_POST['customer_id'];
    $sql="SELECT * from ce_order where customer_id='".$customerId."';";
    $result=$conn->query($sql);
    if($result ->num_rows>  0){
        while($row = $result->fetch_assoc()){
            $db_data[]=$row;
        }
        echo json_encode($db_data);
    }else{
        echo "error"
    }
    $conn->close();
    return;
}

//requiero ayuda en query's
//obtener productos de orden
if("ORDER_PRODUCTS"==$action){
    $db_data=array();
    $orderId = $_POST['order_id'];
    $sql="SELECT * FROM ce_product JOIN ce_product_description ON ce_product.product_id=ce_product_description.product_id where ce_product.product_id in (
        SELECT ce_order_product.product_id FROM ce_order_product WHERE ce_order_product.order_id = '".$orderId."');";
    $result=$conn->query($sql);
    if($result ->num_rows>  0){
        while($row = $result->fetch_assoc()){
            $db_data[]=$row;
        }
        echo json_encode($db_data);
    }else{
        echo "error"
    }
    $conn->close();
    return;
}

//Obtener datos de una orden
if("SELECT_ORDER"==$action){
    $orderId = $_POST['order_id'];
    $consultar=$conn->query("SELECT * FROM ce_order where order_id= '".$orderId."'")
    $resultado=array();
    while($extraerDatos=$consultar->fetch_assoc()){
        $resultado[]=$extraerDatos;
    }
    
    echo json_encode($resultado);
    $conn.close();
}


//insertar una orden
if("ADD_ORDER"==$action){
    $email = $_POST['email'];
    $contra = $_POST['password'];
    
    $consultar=$conn->query("SELECT * FROM ce_customer WHERE email='".$email."' and ce_customer.password='".$password."'");
    
    $resultado=array();
    
    while($extraerDatos=$consultar->fetch_assoc()){
        $resultado[]=$extraerDatos;
    }
    
    echo json_encode($resultado);
    $conn.close();
}

?>