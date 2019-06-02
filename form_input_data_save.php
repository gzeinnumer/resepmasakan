<?php
$fileTemp = $_FILES["datafile"]["tmp_name"];
$fileType = $_FILES["datafile"]["type"];
$fileSize = $_FILES["datafile"]["size"];
$foto   = $_FILES["datafile"]["name"];
$nama   = $_POST['nama_resep'];
$jenis  = $_POST['jenis_resep'];
$alat   = $_POST['alat_resep'];
$bahan  = $_POST['bahan_resep'];
$cara   = $_POST['cara_olah_resep'];

include "database.php";
$data = new database();
$dataexist = $data->checkData($nama);
if($dataexist == true){
  echo "<div style='color:#e32a2e'>Data already exist!</div>";
}else{
  $kode = $data->getCode();
  $alat   = str_ireplace(";","|",$alat);
  $bahan  = str_ireplace(";","|",$bahan);
  $saved = $data->saveData($kode,$nama,$jenis,$alat,$bahan,$cara,$foto);

  if ($saved == true){
    move_uploaded_file($fileTemp, 'image/'.$foto);
    echo "Saving data done!";
  }else{
    echo "<div style='color:#e32a2e'>Failed to save data!</div>";
  }
}
?>
