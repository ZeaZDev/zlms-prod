<?php
date_default_timezone_set("Asia/Bangkok");
if ($_FILES['file']['name']) {
	if (!$_FILES['file']['error']) {
		
		$storeFolder = $_SERVER["DOCUMENT_ROOT"]."/uploads/images/";
		
		$name = date('YmdHis').md5(rand(100, 200));
		$ext = explode('.', $_FILES['file']['name']);
		$ext = end($ext);
		$filename = $name . '.' . $ext;
		$destination = $storeFolder . $filename; //change this directory
		$location = $_FILES["file"]["tmp_name"];
		move_uploaded_file($location, $destination);
		echo '/uploads/images/' . $filename;//change this URL
		
	}else{
		
	  echo  $message = 'Ooops!  Your upload triggered the following error:  '.$_FILES['file']['error'];
	  
	}
}
?>