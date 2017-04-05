<?php
@session_start();
@include '../init.php';
@include 'img_compress.php';
define('UPLOAD_PATH', dirname(dirname(__FILE__))."/upload/content/");

$aid = $_POST['aid'];
if (!isset($_POST['text'])) {
	echo "请为主题添加一条图文";
}else{
	$tex = $_POST['text'];
	$tex = nl2br($tex);
	$uid = $_SESSION['uid'];
	$bro = $_SESSION['uname'];
	$img = $_FILES['img'];
	// var_dump($img);
	$count = count($img["name"]);

	$sql = "SELECT title FROM activity WHERE activity_id='$aid'";
	$rst = $dbh->query($sql);
	$row = $rst->fetch();
	if (empty($row[0])) {
		echo "选择的直播不存在";
	}else{
		$tit = $row[0];
		// echo $aid."</br>";
		// 先将文字添加到content，再添加图片到image
		$sql = "INSERT INTO content (user_id,activity_id,description) VALUES ('$uid','$aid','$tex')";
		$rst = $dbh->query($sql);
		if ($rst->rowCount()>0) {
			$cid = $dbh->lastInsertId();
			$sql = "INSERT INTO cont_log (content_id,user_id,detail) VALUES ('$cid','$uid','向(".$aid.")添加图文成功')";
			$dbh->query($sql);
			for ($i=0; $i < $count; $i++) { 
				$type = $img["type"][$i];
				$size = $img["size"][$i];
				$error = $img["error"][$i];
				$tmp = $img["tmp_name"][$i];
				$ori_name = $img["name"][$i];
				if ($error > 0) {
					echo "图片上传错误：".$error."<br>";
				}else{
					// $nameArray = explode('.', $ori_name);
					// $ext = array_pop($nameArray);
					$ext = end(explode('.', $ori_name));
					$imgName = 'content_'.date("ymdHis").mt_rand(10,99).'.'.$ext;
					move_uploaded_file($tmp, UPLOAD_PATH.$imgName);
					// $src = UPLOAD_PATH.$imgName;  
			  //       $image = new Image($src);  
			  //       $image->percent = 0.2;  
			  //       $image->openImage();  
			  //       $image->thumpImage();  
			  //       $image->showImage();  
			  //       $image->saveImage(md5("aa123"));
					$sql = "INSERT INTO cont_img (content_id,user_id,img_name) VALUES ('$cid','$uid','$imgName')";
					$rst = $dbh->query($sql);
					if ($rst->rowCount()>0) {
						$imgid = $dbh->lastInsertId();
						// array_push($imgid, $dbh->lastInsertId());
						// echo "<script>alert('图片添加成功');</script>";
						$sql = "INSERT INTO cont_log (content_id,user_id,detail) VALUES ('$cid','$uid','添加图片(".$imgid.")成功')";
						$dbh->query($sql);
					}
				}
			}
			echo "<script>alert('图文添加成功');location.replace(document.referrer);</script>";
		}
	}
}

$dbh = NULL;
?>