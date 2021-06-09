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

$conn->set_charset("utf8");

//-----------------------------------------------

$action = $_POST["action"];

//jalar productos (todos)
if("GET_ALL"==$action){
    $db_data=array();
    $sql= "SELECT DISTINCT (ce_product.viewed), ce_product.product_id, ce_category_description.name as catName, ce_product.model, ce_product_description.name, ce_product.image, ce_product.price, ce_product.quantity,ce_product.length, ce_product.width, ce_product.height, ce_product.weight, ce_product_description.description FROM ce_product join ce_product_description on ce_product.product_id=ce_product_description.product_id join ce_product_to_category on ce_product_to_category.product_id = ce_product.product_id join ce_category_description on ce_category_description.category_id = ce_product_to_category.category_id GROUP by ce_product.product_id order by RAND() LIMIT 10;";
    $result=$conn->query($sql);
    if($result ->num_rows>  0){
        while($row = $result->fetch_assoc()){
            //$row=mb_convert_encoding($row, 'UTF-8', 'Windows-1254');
            /*utf8_encode($row["model"]);
            utf8_encode($row["name"]);
            utf8_encode($row["image"]);
            utf8_encode($row[""]);
            utf8_encode($row[""]);
            utf8_encode($row[""]);*/
            //utf8_encode($row["description"]);
            $db_data[]=$row;
        }
        echo json_encode($db_data);
    }else{
        echo "error";
    }
    $conn->close();
    return;
}

//jalar productos (categoria)
if("GET_ALL_CATEGORY"==$action){
    $db_data=array();
    $category_id=$_POST["category_id"];
    $sql= "SELECT ce_product.product_id, ce_product.model, ce_product.image, ce_product.price, ce_product.quantity, ce_product_description.name from ce_product join ce_product_description on ce_product.product_id=ce_product_description.product_id where ce_product.product_id in (select ce_product_to_category.product_id from ce_product_to_category where category_id='".$category_id."') ;";
    $result=$conn->query($sql);
    if($result ->num_rows>  0){
        while($row = $result->fetch_assoc()){
            $db_data[]=$row;
        }
        echo json_encode($db_data);
    }else{
        echo "error";
    }
    $conn->close();
    return;
}

//jalar 1 sólo producto
if("GET_PRODUCT"==$action){
    $idProduct = $_POST['product_id'];

    $consultar=$conn->query("SELECT ce_product.product_id, ce_product.model, ce_product.image, ce_product.price, ce_product.quantity,ce_product.length, ce_product.width, ce_product.height, ce_product_description.name,ce_product_description.description FROM ce_product join ce_product_description on ce_product.product_id=ce_product_description.product_id WHERE ce_product.product_id='".$idProduct."'") or die($conn->error);

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
    $result=$conn->query("SELECT DISTINCT (ce_product.viewed), ce_product.product_id, ce_category_description.name as catName, ce_product.model, ce_product_description.name, ce_product.image, ce_product.price, ce_product.quantity,ce_product.length, ce_product.width, ce_product.height, ce_product.weight, ce_product_description.description FROM ce_product join ce_product_description on ce_product.product_id=ce_product_description.product_id join ce_product_to_category on ce_product_to_category.product_id = ce_product.product_id join ce_category_description on ce_category_description.category_id = ce_product_to_category.category_id GROUP by ce_product.product_id order by ce_product.viewed desc LIMIT 10;") or die ($conn->error);
    if($result->num_rows>  0){
        while($row = $result->fetch_assoc()){
            $db_data[]=$row;
        }
        echo json_encode($db_data);
    }else{
        echo "error";
    }
    $conn->close();
    return;
}

//productos x search bar

if("SEARCH_PRODUCTS"==$action){
    $search = $_POST['search'];
    $result=$conn->query("SELECT ce_product.product_id, ce_product.model, ce_product.image, ce_product.price, ce_product.quantity, ce_product_description.name from ce_product join ce_product_description on ce_product.product_id=ce_product_description.product_id where ce_product_description.name LIKE '%".$search."%'") or die($conn->error);
    if($result ->num_rows>  0){
        while($row = $result->fetch_assoc()){
            $db_data[]=$row;
        }
        echo json_encode($db_data);
    }else{
        echo "error";
    }
    $conn->close();
    return;

}


?>