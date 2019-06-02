<?php
$kode = $_GET['id'];
include "database.php";
$data = new database();
$deleted = $data->deleteData($kode);
if($deleted == true){
  header("location: data_list.php");
}else{
  echo "Failed to delete data!";
}
?>
