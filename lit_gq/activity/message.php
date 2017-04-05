<!DOCTYPE html>
<html lang="zh-CN">

<!-- 连接数据库 -->
<?php
    @session_start();
    @include '../init.php';
    function isLogged(){
        return (isset($_SESSION['uid'])&&$_SESSION['uid']!="")?true:false;
    }
        //
    function fnShowCom($comid,$uimg,$usr,$say,$tim,$agrN){?>
        
<?php }?>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>评论</title>
    <meta name="Keywords" content="图文直播,校园活动,直播">  
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../css/index.css">
    <link rel="stylesheet" type="text/css" href="../css/message.css">
    <link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>
<?php ?>
<?php
$dbh = NULL;
?>
<input type="hidden" id="usr" value="<?php echo $uid?>">
<div class="separate_page" id="messagePage" style="display: block;">
        <!-- 图文Id -->
        <input type="hidden" value="">
        <div class="head">
            <i class="icon-navigate_before back"></i>
            我的提醒
            <div class="right">
                <i class="icon-redo refresh"></i>
            </div>
        </div>
        <div class="body">
  </div>
</div>
<script src="../js/jquery-3.1.1.min.js"></script>
<script src="../js/jquery.easing.1.3.js"></script>
<script src="../js/message.js"></script>
</body>
</html>