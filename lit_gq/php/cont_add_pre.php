<?php
@session_start();
@include '../init.php';
define('UPLOAD_PATH', dirname(dirname(__FILE__))."/upload/content/");

$aid = $_POST['aid'];
if (!isset($_POST['caption'])) {
	echo "请为主题添加一条图文";
}else{
	$cap = $_POST['caption'];
	$uid = $_SESSION['userId'];
	$bro = $_SESSION['uname'];
	$img = $_FILES['img'];

	$type = $img["type"];
	$size = $img["size"];
	$error = $img["error"];
	$tmp = $img["tmp_name"];
	$ori_name = $img["name"];
	if ($error > 0) {
		echo "请为主题添加一条图文：".$error."<br>";
	}else{
		$nameArray = explode('.', $ori_name);
		$ext = array_pop($nameArray);
		$time = date("YmdHis");
		$name = 'content'.$time.'.'.$ext;
		// $name = $n.'_'.$time.'.'.$ext;
		// $name_iconv = iconv("UTF-8","GB2312//IGNORE",$name);
		//判断图片上传前是否需要旋转 Android拍照orientation属性都为1
		$timg = imagecreatefromstring(file_get_contents($tmp));
		// echo $tmp.'</br>';
		$exif = exif_read_data($tmp);
		// var_dump($exif).'</br>';
		if (!empty($exif['Orientation'])) {
			// echo '<br>'.$exif['Orientation'].'<br>';
			switch ($exif['Orientation']) {
				case 8:
					$timg = imagerotate($timg, 90, 0);
					$ok = imagejpeg($timg,UPLOAD_PATH.$name);
					imagedestroy($timg);
					break;
				case 6:
					$timg = imagerotate($timg, -90, 0);
					$ok = imagejpeg($timg,UPLOAD_PATH.$name);
					imagedestroy($timg);
					break;
				case 3:
					$timg = imagerotate($timg, 180, 0);
					$ok = imagejpeg($timg,UPLOAD_PATH.$name);
					imagedestroy($timg);
					break;
				default:
					$ok = move_uploaded_file($img['tmp_name'], UPLOAD_PATH.$name);
					break;
			}
		}else{
			$ok = move_uploaded_file($img['tmp_name'], UPLOAD_PATH.$name);
		}
		// echo $ok.'</br>';
		$sql = "SELECT title FROM activity WHERE activityId='$aid'";
		$rst = $dbh->query($sql);
		if (is_bool($rst)) {
			echo "选择的直播不存在";
		}else{
			$row = $rst->fetch();
			$tit = $row[0];
			// array_push($imgs, var)
			$sql = "INSERT INTO CONTENT (toLiveID,caption,imgSrc) VALUES ('$aid','$cap','$name')";
			$rst = $dbh->query($sql);
			if ($rst->rowCount()>0) {
				// echo "图文添加成功";
				// echo "<script>window.location = 'index.php?i=".$uid."';</script>";
				echo "<script>alert('图文添加成功');
				window.history.go(-1);</script>";
				// echo "<a href=javascript:window.location.reload()";
				// echo "<a href=javascript:window.history.go(-1)></a>";
				// $arr=array('status'=>'200','detail'=>'创建直播成功');
				$sql = "INSERT INTO log (content,user) VALUES ('向(".$tit.")添加图文成功','$bro')";
				$dbh->query($sql);
			}else{
				// echo "不能执行插入操作。";
				// $arr=array('status'=>'0','detail'=>'直播创建失败');
				$sql = "INSERT INTO log (content,user) VALUES ('向(".$tit.")添加图文失败','$bro')";
				$dbh->query($sql);
				echo "图片插入失败<br>";
				echo "<a href=javascript:window.history.go(-1)>返回</a>";
				exit(); // 下面的操作将不会进行;
			}
		}
	}
}

function filterEmoji($str)
{
 $str = preg_replace_callback(
   '/./u',
   function (array $match) {
    return strlen($match[0]) >= 4 ? '' : $match[0];
   },
   $str);
 
  return $str;
}

$dbh = NULL;
?>