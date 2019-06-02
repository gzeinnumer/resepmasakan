<title>Daftar Resep</title>
<?php
include "database.php";
$data = new database();
$result = $data->getAllData();
include "menu.php";
if($result == 0){
  echo "No data yet!";
}else{

?>
<style>
  body,div{
    margin: 0;
    padding: 0;
  }

  #data-list{
    padding-left: 150px;
    padding-top: 10px;
    background: #1a1a19;
  }
  #data-list-wrap{
    margin: 0 auto;
    width: 770px;
    min-height: 530px;
    padding: 20px 20px;
    background: #866c51;
    box-shadow: 5px 5px 8px #000 inset;
  }
  #data-list-wrap table{
    margin: 0 auto;
    border-collapse: collapse;
    max-width: 500px;
  }
  .data-list-tr-top{
    background: #161616;
    color: #f8f7f7;
  }
  .data-list-tr-top th{
    padding: 5px 10px;
    border: 1px solid #1c1611;
  }
  .data-list-tr-data{
    transition: 0.3s background;
    color: inherit;
  }
  .data-list-tr-data:hover{
    transition: 0.3s background;
    background: rgba(198,179,158,0.5);
  }
  .data-list-tr-data td{
    padding: 10px 10px;
    text-align: justify;
    border: 0.5px solid #1c1611;
  }
  .data-a{
    color: #112410;
    text-decoration: none;
  }
  .data-delete{
    text-decoration: none;
    color: #ff9c92;
    text-shadow: 1px 1px 3px #000;
  }

  #data-list-read{
    padding: 10px 20px;
    font-family: Blackadder ITC;
    color: #1b1610;
  }
  #data-list-read-title{
    text-align: center;
    font-size: 60px;
  }
  #data-list-read-image{
    margin: 25px 20px;
    text-align: center;
  }
  #data-list-read-img{
    box-shadow: 1px 1px 10px #000;
  }
  #data-list-read-alat{
    margin: 20px 90px;
    font-size: 30px;
    list-style: circle;
  }
  #data-list-read-alat li{
    margin: 9px 60px;
  }
  #data-list-read-bahan{
    margin: 20px 90px;
    font-size: 30px;
    list-style: circle;
  }
  #data-list-read-bahan li{
    margin: 9px 60px;
  }
  #data-list-read-cara-olah{
    font-size: 25px;
  }
  #data-list-read-cara-olah p{
    text-align: justify;
    text-indent: 30px;
    font-size: 25px;
  }
</style>
<div id="data-list">
<div id="data-list-wrap">
<?php
if(isset($_GET['read']) && isset($_GET['id'])){
  $datadetail = $data->readData($_GET['id']);
?>
  <div id="data-list-read">
    <div id="data-list-read-title">
      <?php echo $datadetail['nama_resep']; ?>
    </div>

    <div id="data-list-read-image">
      <?php
      if($datadetail['foto_resep']){
        echo "<img src='image/".$datadetail['foto_resep']."' id='data-list-read-img'>";
      } else{
        echo "No Image!";
      }
      ?>
    </div>

    <div id="data-list-read-alat">
      Alat : <br>
      <ul>
      <?php
      $alatalat = explode("|",$datadetail['alat_resep']);
      $jumlahalat = count($alatalat);
      for($i = 0;$i < $jumlahalat;$i++){
        echo "<li class='li-alat'>".$alatalat[$i]."</li>";
      }
      ?>
      </ul>
    </div>

    <div id="data-list-read-bahan">
      Bahan : <br>
      <ul>
      <?php
      $bahanbahan = explode("|",$datadetail['bahan_resep']);
      $jumlahbahan = count($bahanbahan);
      for($i = 0;$i < $jumlahbahan;$i++){
        echo "<li class='li-bahan'>".$bahanbahan[$i]."</li>";
      }
      ?>
      </ul>
    </div>

    <div id="data-list-read-cara-olah">
      <b>Cara olah :</b> <br>
      <p><?php echo $datadetail['cara_olah_resep']; ?></p>
    </div>

<?php
}else{

 ?>
<table>
  <tr class="data-list-tr-top">
    <th>No</th>
    <th>Nama Resep</th>
    <th>Jenis</th>
    <th>Alat</th>
    <th>Bahan</th>
    <th>Cara Olah</th>
    <th>Foto</th>
    <th><></th>
  </tr>
<?php
$no = 0;
foreach ($result as $dataresult) {
$no++;
?>

  <tr class="data-list-tr-data">
    <td style='text-align:center'> <?php echo $no; ?> </td>
    <td style='text-align:center'>
      <a class="data-a" href="data_list.php?read=true&id=<?php echo $dataresult['kode_resep']; ?>">
      <?php echo $dataresult['nama_resep']; ?>
      </a>
    </td>
    <td style='text-align:center'>
      <?php echo $data->getCategoryData($dataresult['kode_jenis_resep']); ?>
    </td>
    <td>
      <?php
      $alat = strtok($dataresult['alat_resep'],"|");
       for($i = 0;$i<2;$i++){
         echo $alat." - ";
         $alat = strtok("|");
       }
      ?> . . .
    </td>
    <td>
      <?php
      $bahan = strtok($dataresult['bahan_resep']," ");
      for($j = 0;$j<12;$j++){
        echo $bahan." ";
        $bahan = strtok(" ");
      }
      ?> . . .
    </td>
    <td>
      <?php
      $cara = strtok($dataresult['cara_olah_resep']," ");
       for($i = 0;$i<15;$i++){
         echo $cara." ";
         $cara = strtok(" ");
       }
      ?>. . .
    </td>
    <td style='text-align:center'>
    <?php
    if($dataresult['foto_resep']){
      echo "Yes";
    }else{
      echo "No";
    }
    ?>
    </td>
    <td style='text-align:center'>
    <a class="data-delete" href="data_delete.php?id=<?php echo $dataresult['kode_resep']; ?>">
      <div id="data-list-delete"> DELETE </div>
    </a>
    </td>
  </tr>

<?php
}
?>

</table>

</div>
</div>
<?php
}
}
 ?>
