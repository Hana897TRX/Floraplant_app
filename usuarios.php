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

$action = $_POST["action"];

if("GET_USUARIO"==$action){
    $customer_id = $_POST['customer_id'];
    $consultar=$conn->query("SELECT * FROM ce_customer WHERE customer_id = '".$customer_id."';") or die($conn->error);
    $resultado=$consultar->fetch_assoc();  
  //  print_r($resultado);
    echo json_encode($resultado);
    $conn->close();
}

?>