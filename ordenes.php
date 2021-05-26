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

//obtener productos de orden
if("ORDER_PRODUCTS"==$action){
    
}


//insertar una orden

?>