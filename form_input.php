<script>
function saveData() {
  var file = document.getElementById("fileku").files[0];
  var nama = document.getElementById("nama_resep").value;
  var jenis = document.getElementById("jenis_resep").value;
  var alat = document.getElementById("alat_resep").value;
  var bahan = document.getElementById("bahan_resep").value;
  var cara = document.getElementById("cara_olah_resep").value;
  if(file == "" || nama == "" || jenis == "#" || alat == "" || bahan == "" || cara == ""){
    alert("Please complete the form!");
  }else{
    var formdata = new FormData();
    formdata.append("datafile", file);
    formdata.append("nama_resep",nama);
    formdata.append("jenis_resep",jenis);
    formdata.append("alat_resep",alat);
    formdata.append("bahan_resep",bahan);
    formdata.append("cara_olah_resep",cara);
    var ajax = new XMLHttpRequest();
    ajax.upload.addEventListener("progress", progressHandler, false);
    ajax.onreadystatechange = function(){
      if(ajax.readyState < 4){
        document.getElementById('loading').style.display = "block";
      }else{
        if(ajax.status == 200){
          document.getElementById('loading').style.display = "none";
          document.getElementById('response').innerHTML = ajax.responseText;
        }
      }
    };
    ajax.open("POST", "form_input_data_save.php", true);
    ajax.send(formdata);
  }
}

function progressHandler(event){
  var percent = (event.loaded / event.total) * 100;
  document.getElementById("progressBar").value = Math.round(percent);
  //document.getElementById("status").innerHTML = Math.round(percent)+"% telah terupload";
}

function reset(){
  document.getElementById("fileku").value = "";
  document.getElementById("nama_resep").value = "";
  document.getElementById("jenis_resep").value = "";
  document.getElementById("alat_resep").value = "";
  document.getElementById("bahan_resep").value = "";
  document.getElementById("cara_olah_resep").value = "";
  document.getElementById("progressBar").value = "";
  document.getElementById('response').style.display = "none";
}
</script>
<?php
include "database.php";
$data = new database();
$jenis = $data->getCategory();
?>
<style>
body,div{
  padding: 0;
  margin: 0;
}
#table-input{
  width: 100%;
  background: #fcfcfc;
  overflow: hidden;
  margin-bottom: 20px;
}
#table-input input, #table-input textarea{
  transition: 0.25s box-shadow;
  font-family: gisha;
}
#table-input input:focus, #table-input textarea:focus{
  transition: 0.2s box-shadow;
  box-shadow: 0 0 3px #ce2a2e;
}

#table-input-title{
  margin: 30px 10px;
  font-family: century gothic;
  font-size: 30px;
  text-align: center;
}

#table-input-wrap{
  margin: 0 auto;
  padding : 10px 10px;
  min-width: 450px;
  width: 400px;
  background: #9fdc97;
}
#table-input-table{
  margin: 0 auto;
  padding : 5px 5px;
}
#table-input-table td{
  padding : 5px 5px;
  font-family: candara;
  color: #393939;
}
.form-input-text{
  width: 300px;
  padding : 5px 5px;
  border-radius: 7px;
  border: 1px solid #cdcfd0;
  font-size: 17px;
}
.form-input-textarea{
  min-width: 300px;
  min-height: 150px;
  padding : 5px 5px;
  border-radius: 7px;
  border: 1px solid #cdcfd0;
}

#loading{
  text-align: center;
}
#response{
  text-align: center;
}

#menu-2{
  background: linear-gradient(to top,#0a0a0d 0%,#191c25 10%,#212534 50%,#191c25 70%,#0a0a0d 100%);
  border-top: 1px solid #0a0a0d;
  border-right: 1px solid #0a0a0d;
  border-left: none;
}
#menu-list{
  border: 1px solid #000;
  border-radius: 6px;
}
</style>

<title>Tambah Resep</title>
<div id="table-input">

<?php include "menu.php"; ?>

  <div id="table-input-title">Tambah Resep</div>

<div id="table-input-wrap">
<table id="table-input-table">
<form id="upload_form" enctype="multipart/form-data">
  <tr>
    <td>Nama Resep</td>
    <td><input class="form-input-text" type="text" autocomplete="off" name="nama_resep" id="nama_resep" placeholder="Nama Resep"></td>
  </tr>
  <tr>
    <td>Jenis Resep</td>
    <td>
      <select name="jenis_resep" id="jenis_resep">
        <option value="#" selected="">Choose</option>
        <?php
        if($jenis == 0){
          echo "<option value='#'>Please add a category!</option>";
        }else {
          foreach($jenis as $jenisjenis){
            echo "<option value='".$jenisjenis['kode_jenis_resep']."'>".$jenisjenis['jenis_resep']."</option>";
          }
        }
        ?>
      </select>
    </td>
  </tr>
  <tr>
    <td style="vertical-align:top;padding-top:10px;">Alat Resep</td>
    <td>
      <textarea class="form-input-textarea" name="alat_resep" id="alat_resep" placeholder="Pisahkan dengan titik koma (;) tiap alat kecuali yang terakhir"></textarea>
    </td>
  </tr>
  <tr>
    <td style="vertical-align:top;padding-top:10px;">Bahan Resep</td>
    <td>
      <textarea class="form-input-textarea" name="bahan_resep" id="bahan_resep" placeholder="Pisahkan dengan titik koma (;) untuk tiap bahan kecuali yang terakhir"></textarea>
    </td>
  </tr>
  <tr>
    <td style="vertical-align:top;padding-top:10px;">Cara Olah Resep</td>
    <td>
      <textarea class="form-input-textarea" name="cara_olah_resep" id="cara_olah_resep" placeholder="Pisahkan dengan titik koma (;) untuk tiap paragraf kecuali yang terakhir"></textarea>
    </td>
  </tr>
  <tr>
    <td>Foto Resep</td>
    <td>
      <input type="file" name="datafile" id="fileku">
    </td>
  </tr>
  <tr>
    <td></td>
    <td>
      <input type="button" value="Save" onclick="saveData()">
      <input type="button" value="Reset" onclick="reset()">
    </td>
  </tr>
  <tr>
    <td><h4 id="status"></h4></td>
    <td>
      <progress id="progressBar" value="0" max="100" style="width:200px;"></progress>
    </td>
  </tr>
</form>
</table>
<div id="loading" style="display:none">Saving ...</div>
<div id="response"></div>
</div>

</div>
