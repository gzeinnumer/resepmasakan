<style>
  ul{
    margin :0;
    padding: 0;
  }
  #menu{
    position: absolute;
    z-index: 9;
    width: 280px;
    overflow: hidden;
    padding: 5px 5px;
    font-family: euphemia;
  }
  #menu-wrap{
    overflow: hidden;
    padding: 3px 3px;
  }
  #menu-logo{
    padding: 4px 4px;
    float: left;
  }
  #menu-logo-img{
    width: 50px;
  }
  #menu-list{
    float: right;
    overflow: hidden;
    margin-top: 10px;
    padding: 5px 5px;
    background: #f2f1f1;
    color: #f0f1f3;
  }
  #menu-list ul{
    list-style: none;
  }
  .menu-a{
    color: #f1f1f1;
    text-decoration: none;
  }
  .menu-li{
    border: 1px solid #0a0a0a;
    padding: 4px 10px;
    float: left;
    background: #212534;
  }

  #ribbon-info{
    position: fixed;
    background: rgba(10,140,250,0.3);
    box-shadow: 0 0 10px #35a1fc;
    z-index: 8;
    top: 80px;
    left: 20px;
    height: 70px;
    width: 70px;
    padding: 10px 10px;
    border-radius: 50%;
    text-align: center;
  }
  #ribbon-info-wrap{
    background: #0c0f12;
    transition: 0.3s box-shadow;
    box-shadow: 0 0 5px #0c0f12;
    padding: 10px 10px;
    height: 50px;
    width: 50px;
    border-radius: 50%;
  }
  #ribbon-info-wrap:hover{
    transition: 0.3s box-shadow;
    box-shadow: 0 0 3px #f3f3f3;
  }
  #ribbon-info-number{
    color: #f3f4f4;
    text-shadow: 0 0 2px #f3f4f4;
    font-size: 20px;
    font-family: segoe ui;
  }
  #ribbon-info-text{
    color: #f3f4f4;
    text-shadow: 0 0 1px #f3f4f4;
    font-size: 10px;
    font-family: euphemia;
  }
</style>
<script>
  setTimeout(getCount,1000);
  function getCount(){
    setTimeout(getCount,1000);
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function(){
      if(xmlhttp.readyState == 4){
        document.getElementById('ribbon-info-number').innerHTML = xmlhttp.responseText;
      }
    };
    xmlhttp.open("GET","menu.php?halaman=count",true);
    xmlhttp.send();
  }
</script>
<?php

  if (class_exists('database2')) {
    $datac  = new database2();
  }else{
    include "database.php";
    $datac  = new database2();
  }
  $count  = $datac->count();
  if(isset($_GET['halaman'])){
    if($_GET['halaman'] == "count"){
      echo $count;
    }
  }else{
?>

<div id="menu">
  <div id="menu-wrap">
    <div id="menu-logo">
      <link rel="icon" href="logo.png">
      <img src="image/logo.png" id="menu-logo-img">
    </div>

    <div id="menu-list">
      <ul>
        <a href="index.php" class="menu-a"><li class="menu-li" id="menu-1">Home</li></a>
        <a href="form_input.php" class="menu-a"><li class="menu-li" id="menu-2">Add New Data</li></a>
      </ul>
    </div>
  </div>
</div>

<div id="ribbon-info">
  <div id="ribbon-info-wrap" onclick="window.location= 'data_list.php';">
    <div id="ribbon-info-number">Loading</div>
    <div id="ribbon-info-text">Resep</div>
  </div>
</div>

<?php } ?>
