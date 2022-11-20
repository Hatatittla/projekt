<?php
include_once "class/db.php";

use portalove\DB; /*použi dalšiu triedu pre ïalšie fungovanie*/

$db = new DB("localhost","portalove-riesenia","root","");
global $categoryItems;
$categoryItems=$db->getCategory();



?>