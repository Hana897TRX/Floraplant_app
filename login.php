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

if("LOGIN"==$action){
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

if("NEW_USER"==$action){
    $dato1=$_POST[""];
    $dato1=$_POST[""];
    $dato1=$_POST[""];

    $sql="";
    $res=$conn->query($sql);
    echo "correto";
    $conn->close();
    return;
}



?>

