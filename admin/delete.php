<?php

include_once "header.php";
$db = $GLOBALS['db'];

if(isset($_GET['id'])){
    $deleteCategoryItem = $db->deleteCategoryItem($_GET['id']);
    
    if($insert.categoryItem){
    header("Location: cat.php");
    } else {
    echo "ERROR";
    }

} else {

echo "ERROR";
}

?>