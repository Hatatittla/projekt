<?php
include_once "class/db.php";

use portalove\DB; /*pou�i� dal�iu triedu pre �al�ie fungovanie*/

$db = new DB("localhost","portalove-riesenia","root","");
global $categoryItems;
$categoryItems=$db->getCategory();



?>