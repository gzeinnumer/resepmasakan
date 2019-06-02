<?php
include "database.php";
$kode = $_GET['id'];
$data = new database();
$result = $data->getDataDetail($kode);

$nama = $result['nama_resep'];
$alat = $result['alat_resep'];
$bahan = $result['bahan_resep'];
$caraolah = $result['cara_olah_resep'];
$caraolah = str_ireplace(";","</p><p>",$caraolah);
$foto = $result['foto_resep'];
?>
<style>
  #resep-nama{
    text-align: center;
    font-size: 30px;
    margin: 35px 5px;
  }

  #resep-foto{
    text-align: center;
  }
  #resep-img{
    margin: 0 auto;
    max-width: 350px;
    max-height: 350px;
    box-shadow: 0px 0px 6px rgba(255, 255, 255, 0.4);
  }

  #resep-alat{
    margin-top: 20px;
    margin-left: 10px;
    font-size: 20px;
  }
  .li-alat{
    margin : 15px 45px;
    list-style: circle;
  }

  #resep-bahan{
    margin-left: 10px;
    font-size: 20px;
  }
  .li-bahan{
    margin: 15px 45px;
    list-style: square;
  }

  #resep-cara-olah{
    margin: 30px 10px;
    text-align: justify;
    font-size: 20px;
  }
  p{
    text-indent: 25px;
  }
</style>

<div id="resep-nama">
  <?php echo $nama; ?>
</div>

<div id="resep-foto">
  <?php
  if($foto){
    echo "<img src='image/".$foto."' id='resep-img'>";
  }else{
    echo "No Image!";
  }
  ?>
</div>

<div id="resep-alat">
  Alat : <br>
  <ul>
  <?php
  $alatalat = explode("|",$alat);
  $jumlahalat = count($alatalat);
  for($i = 0;$i < $jumlahalat;$i++){
    echo "<li class='li-alat'>".$alatalat[$i]."</li>";
  }
  ?>
  </ul>
</div>

<div id="resep-bahan">
  Bahan : <br>
  <ul>
  <?php
  $bahanbahan = explode("|",$bahan);
  $jumlahbahan = count($bahanbahan);
  for($i = 0;$i < $jumlahbahan;$i++){
    echo "<li class='li-bahan'>".$bahanbahan[$i]."</li>";
  }
  ?>
  </ul>
</div>

<div id="resep-cara-olah">
  Cara olah : <br>
  <p><?php echo $caraolah; ?></p>
</div>
