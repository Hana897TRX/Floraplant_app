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

$db_data=array();
    $sql= "SELECT distinct category_id, ce_category_description.name FROM ce_category_description;";
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

?>