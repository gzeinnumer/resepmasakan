<?php
class database{
  public $host   = "localhost";
  public $user   = "root";
  public $pass   = "";
  public $dbase  = "resepmasakan";

  function __construct(){
    mysql_connect($this->host,$this->user,$this->pass) or die("Couldn't connect to database sever!");
    mysql_select_db($this->dbase) or die("Couldn't connet to database!");
  }

  function getData($key){
    $result = array();
    $key = str_ireplace(" ","%",$key);
    $key = str_ireplace(",","%",$key);
    $query = mysql_query("select * from resep where nama_resep like '%".$key."%' or bahan_resep like '%".$key."%'");
    if(mysql_num_rows($query) > 0){
      while($data = mysql_fetch_array($query)){
        $result[] = $data;
      }
      return $result;
    }else{
      return 0;
    }
  }

  function getDataDetail($id){
    $query = mysql_query("select * from resep where kode_resep='".$id."'");
    $data = mysql_fetch_array($query);
    if(mysql_num_rows($query) > 0){
      return $data;
    }else{
      return 0;
    }
  }

  function getCategory(){
    $result = array();
    $query = mysql_query("select * from jenis_resep");
    if(mysql_num_rows($query) > 0){
      while($data=mysql_fetch_array($query)){
        $result[]=$data;
      }
      return $result;
    }else{
      return 0;
    }
  }

  function getCategoryData($kode){
    $query = mysql_query("select * from jenis_resep where kode_jenis_resep='".$kode."'");
    $kind = mysql_fetch_array($query);
    return $kind['jenis_resep'];
  }

  function getCode(){
    $query	= mysql_query("select kode_resep from resep order by kode_resep");
		$max    = 0;
		while($datacode		= mysql_fetch_row($query)){
			$codesplit		= explode("r",$datacode[0]);
			if($codesplit[1] > $max){
				$max 	= $codesplit[1];
			}
		}
		$code				= "r".($max+1);
		return $code;
  }

  function checkData($nama){
    $query = mysql_query("select * from resep where nama_resep='".$nama."'");
    if(mysql_num_rows($query) > 0){
      return true;
    }else{
      return false;
    }
  }

  function saveData($kode,$nama,$jenis,$alat,$bahan,$cara,$foto){
    $query = mysql_query("insert into resep set kode_resep='".$kode."',
    nama_resep='".$nama."', kode_jenis_resep='".$jenis."', alat_resep='".$alat."',
    bahan_resep='".$bahan."', cara_olah_resep='".$cara."', foto_resep='".$foto."'");
    if($query){
      return true;
    }else {
      return false;
    }
  }

  function getAllData(){
    $result = array();
    $query = mysql_query("select * from resep order by id asc");
    if(mysql_num_rows($query) > 0){
      while($data = mysql_fetch_array($query)){
        $result[] = $data;
      }
      return $result;
    }else{
      return 0;
    }
  }

  function deleteData($kode){
    $query = mysql_query("delete from resep where kode_resep='".$kode."'");
    if($query){
      return true;
    }else{
      return false;
    }
  }

  function readData($id){
    $query = mysql_query("select * from resep where kode_resep='".$id."'");
    return mysql_fetch_array($query);
  }
}

class database2 extends database{
  function count(){
    $query = mysql_query("select * from resep");
    return mysql_num_rows($query);
  }
}
?>
