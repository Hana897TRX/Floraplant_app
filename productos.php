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

//jalar productos (todos)
if("GET_ALL"==$action){
    $db_data=array();
    $sql= "SELECT * FROM ce_product join ce_product_description on ce_product.product_id=ce_product_description.product_id ORDER BY RAND() LIMIT 10;";
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

//jalar productos (categoria)
if("GET_ALL_CATEGORY"==$action){
    $db_data=array();
    $category_id=$_POST["category_id"];
    $sql= "SELECT * from ce_product join ce_product_description on ce_product.product_id=ce_product_description.product_id where ce_product.product_id in (select ce_product_to_category.product_id from ce_product_to_category where category_id='".$category_id."') ;";
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

//jalar 1 sólo producto
if("GET_PRODUCT"==$action){
    $idProduct = $_POST['product_id'];

    $consultar=$conn->query("SELECT * FROM ce_product join ce_product_description on ce_product.product_id=ce_product_description.product_id WHERE product_id='".$idProduct."'");

    $resultado=array();

    while($extraerDatos=$consultar->fetch_assoc()){
        $resultado[]=$extraerDatos;
    }
    echo json_encode($resultado);
    $conn->close();
    return;
}

//jalar productos (populares)
if("GET_POPUS"==$action){
    $result=$conn->query("SELECT * from ce_product join ce_product_description on ce_product.product_id=ce_product_description.product_id order by viewed desc limit 10 ;");
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

//productos x search bar

if("SEARCH_PRODUCTS"==$action){
    $search = $_POST['search'];
    $result=$conn->query("SELECT * from ce_product join ce_product_description on ce_product.product_id=ce_product_description.product_id where ce_product_description.name LIKE "%".$search."%";");
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


?>