<?php
include_once "header.php";
$db = $GLOBALS['db'];
$category = $db->getCategory();

echo "<h2>Edit categories</h2><br> <ul>";
foreach ($category as $categoryItem) {
echo "<li>".$categoryItem['title']."<a href='delete.php?id=".$categoryItem['id']."'>Delete</a> <a href='update.php?id=".$categoryItem['id']."'>Update</a> </li>";

}

echo "</ul>";
?>

<br><li><a href="insert.php">Insert new category</a></li>