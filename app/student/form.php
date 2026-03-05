<?php
   if(isset($_FILES['image'])){
      $errors= array();
      $file_name = $_FILES['image']['name'];
      $file_size = $_FILES['image']['size'];
      $file_tmp = $_FILES['image']['tmp_name'];
      $file_type = $_FILES['image']['type'];
      $file_ext=strtolower(end(explode('.',$_FILES['image']['name'])));

      $extensions= array("jpeg","jpg","png","xls","xlsx");

      if(in_array($file_ext,$extensions)=== false){
         $errors[]="extension not allowed, please choose a JPEG or PNG file.";
      }

      if($file_size > 2097152) {
         $errors[]='File size must be excately 2 MB';
      }

      if(empty($errors)==true) {
        $fd = date("YmdHis");
         move_uploaded_file($file_tmp,"C:\\inetpub\\wwwroot\\ebook_assets\\".$fd.$file_name);
         //echo "Success";
      }else{
         //print_r($errors);
      }
      //header("Location:index2.php?f=".$fd.$file_name);
      header("Location:http://edupol.thaidevelopers.cloud/Userpermission.aspx");
   }
?>
<html>
   <body>

      <form action = "" method = "POST" enctype = "multipart/form-data">
         <input type = "file" name = "image" />
         <input type = "submit" value="import รายชื่อ"/>

<!--
         <ul>
            <li>Sent file: <?php echo $_FILES['image']['name'];  ?>
            <li>File size: <?php echo $_FILES['image']['size'];  ?>
            <li>File type: <?php echo $_FILES['image']['type'] ?>
         </ul>
-->
      </form>

   </body>
</html>
