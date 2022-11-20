<?php

include_once "header.php";
$db = $GLOBALS['db'];


if(isset($_POST['submit'])){
    $updateCategoryItem = $db->updateCategoryItem($_POST['title'] , $_POST['path'] , $_POST['description'], $_POST['id']);
    if($updateCategoryItem){
    header("Location: cat.php");
    } else {
    echo "ERROR";
    }
} else {
    if(isset($_GET['id'])) {
    $categoryItem = $db->getCategoryItem($_GET['id']);
    
    ?>
    <form action="" method="post">
    <input name="id" type="hidden" value="<?php echo $categoryItem['id'] ?>"><br>
    Category title: <br>
    <input name="title" type="text" value="<?php echo $categoryItem['title'] ?>"><br>
    Path: <br>
    <input name="path" type="text" value="<?php echo $categoryItem['path'] ?>"><br>
    Description: <br>
    <input name="description" type="text" value="<?php echo $categoryItem['description'] ?>"><br>
    
    <input type="submit" name="submit" value="Update"><br>    
    </form>
    <?php

    } else {
        header("Location: cat.php");
    }
}
?>