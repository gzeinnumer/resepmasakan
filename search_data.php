<style>
#result-count{
  position: absolute;
  top: 7px;
  margin-left: 110px;
  text-align: center;
}
#result-count-number{
  font-size: 27px;
  padding: 0;
}
#result-count-text{
  font-size: 12px;
}
.result{
  transition: 0.3s background;
  margin : 10px 3px;
  padding: 8px 5px;
  overflow: hidden;
}
.result:hover{
  transition: 0.3s background;
  background: rgba(184,184,184,0.3);
  cursor: pointer;
}
.no-image{
  margin-top: 20px;
}
.result-image{
  width: 100px;
  height: 100px;
  border-radius: 50%;
  overflow: hidden;
  float: left;
  margin-right: 25px;
  margin-left: 10px;
  text-align: center;
}
.result-image-img{
  width: 170px;
}
.result-title{
  float: left;
  font-size: 25px;
  overflow: hidden;
  max-width: 280px;
  font-family: Levenim MT;
  text-align: justify;
  vertical-align: middle;
}

</style>
<?php
include "database.php";
$data = new database();

$key = $_GET['search-key'];
$result = $data->getData($key);
if($result == 0){
  echo "<b>".$key."</b> Not Found!";
}else {
  $i = 0;
  echo "<div id='result-count'>";
  echo "<div id='result-count-number'>";
  if(count($result) > 99){
    echo "99+";
  }else {
    echo count($result);
  }
  echo "</div>";
  echo "<div id='result-count-text'>Found</div>";
  echo "</div>";
  foreach ($result as $dataresult) {
    $i++;
    ?>
    <div class="result" onclick="detail('<?php echo $dataresult['kode_resep']; ?>')">
    <?php
    echo "<div class='result-image'>";
    if($dataresult['foto_resep']){
      echo "<img class='result-image-img' src='image/".$dataresult['foto_resep']."'>";
    }else{
      echo "<div class='no-image'>No Image</div>";
    }
    echo "</div>";

    echo "<div class='result-title'>";
    echo $dataresult['nama_resep'];
    echo "</div>";
    echo "</div>";
    echo "<div style='clear:both'></div>";
  }
}
?>
