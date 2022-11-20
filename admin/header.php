<?php
include_once "../class/db.php";
use portalove\DB; /*použi dalšiu triedu pre ïalšie fungovanie*/

$db = new DB("localhost","portalove-riesenia","root","");
global $db;

?>
<center>
<h1>ADMIN PANEL</h1>
<br><br><br><br>
<ul>
    <li><a href="main.php">Home</a></li>
    <li><a href="cat.php">Edit category items</a></li>
    <li><a href="../index.php">Return to web</a></li>
</center>