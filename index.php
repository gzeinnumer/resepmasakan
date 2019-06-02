<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="style.css">
  <title>Database Resep</title>
  <script type="text/javascript" src="jquery.js"></script>
  <script type="text/javascript" src="jquery.ui.effect.js"></script>
  <script type="text/javascript" src="jquery.ui.effect-blind.js"></script>
  <script type="text/javascript" src="jquery.ui.effect-fold.js"></script>
  <script>
  function detail(id){
    $("#content-result").animate({left: "-215px",opacity: '0.3'});
    $("#content-result-detail").hide("blind");
    $("#content-result-detail").show("blind");
    $.get("data_detail.php?id="+id,function(data,status){
      if(status != "success"){
        $("#content-result-detail-data").text("Loading ...");
      }else {
        $("#content-result-detail-data").html(data);
      }
    });
  }

    $(document).ready(function(){
      var top = (($(window).height() - $('.overlayBox').height() )/2 -130);
      var left = (( $(window).width() - $('.overlayBox').width() )/4+100);
      var height = $(window).height();
      $("#content").css({"top": top+"px","left": left+"px"});
      $("#content-result").css({"max-height":height+"px","overflow":"auto"});
      $("#content-result-detail").css({"height":height+"px","overflow":"auto"});
      $(window).resize(function(){
        height = $(window).height();
        top = (($(window).height() - $('.overlayBox').height() )/2 -130);
        left = (( $(window).width() - $('.overlayBox').width() )/4+100);
        $("#content").css({"top": top+"px","left": left+"px"});
        $("#content-result").css({"max-height":height+"px","overflow":"auto"});
        $("#content-result-detail").css({"height":height+"px","overflow":"auto"});
      });

      $("#search-key").focus(function(){
        $("#content-search").css({"transition":"0.1s box-shadow","box-shadow": "0px 0px 3px #066fb2"});
      });
      $("#search-key").focusout(function(){
        $("#content-search").css("box-shadow","none");
      });

      $("#search-key").keyup(function(){
        var key = $("#search-key").val();
        $("#content-result").animate({left: "0px",opacity: '1'});
        $("#content-result-detail").fadeOut();
        if(key == ""){
          $("#content-result").slideUp();
          $("#content-result-detail").fadeOut();
          $("#content-result-data").text("");
          $("#content-result").animate({left: "0px"});
          $("#content").animate({left: left+"px"});
        }else{
          $("#content").animate({left: "0px"});
          $("#content-result").slideDown();
          $.get("search_data.php?search-key="+key,function(data,status){
            if(status != "success"){
              $("#content-result-data").text("Loading ...");
            }else {
              $("#content-result-data").html(data);
            }
          });
        }
      });

    });
  </script>
</head>
<body>
  <div id="main-wrap">
    <div id="second-wrap">

      <style>
        #menu-1{
          background: linear-gradient(to top,#0a0a0d 0%,#191c25 10%,#212534 50%,#191c25 70%,#0a0a0d 100%);
          border-top: 1px solid #0a0a0d;
          border-right: 1px solid #0a0a0d;
        }
      </style>
      <?php include "menu.php"; ?>

      <div id="content">
        <div id="content-main">
          <div id="content-title">
            Cari Masakan
          </div>
          <div id="content-seperate"></div>
          <div id="content-search">
            <form action="search_data.php" enctype="multipart/form-data">
              <input type="text" autocomplete="off" name="search-key" id="search-key" placeholder="Ketik nama resep atau bahan resep">
              <input type="submit" id="search-button" value="Cari">
            </form>
          </div>
        </div>
      </div>


      <div id="content-result-detail">
        <div id="content-result-detail-data">
        </div>
      </div>

      <div id="content-result">
        <div id="content-result-main">
          <div id="content-result-title">
            Result
          </div>
          <div id="content-result-data">

          </div>
        </div>
      </div>

    </div>
  </div>
</body>
</html>
