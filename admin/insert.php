<?php

include_once "header.php";
$db = $GLOBALS['db'];

if(isset($_POST['submit'])){
    $insertCategoryItem = $db->insertCategoryItem($_POST['title'] , $_POST['path'] , $_POST['description'] );
    if($insert.categoryItem){
    header("Location: cat.php");
    } else {
    echo "ERROR";
    }

} else {

?>

<form action="" method="post">
    Display name: <br>
    <input name="title" type="text" placeholder="Category title"><br>
    Sys name: <br>
    <input name="path" type="text" placeholder="Category URL"><br>
    Path: <br>
    <input name="description" type="text" placeholder="Category description"><br>
    
    <input type="submit" name="submit" value="Insert"><br>    
</form>
<?php

}

?>