<?php

// if($_SESSION['news_role'] != "1" )
// {
//   redirect('admin/operation/logout');
// }

?>

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
  <div class="row">
    <ol class="breadcrumb">
      <li><a href="#">
        <em class="fa fa-home"></em>
      </a></li>
      <li class="active">สื่อการสอน</li>
    </ol>
  </div><br>


  <div class="panel panel-default">
    <div class="panel-heading"><i class="fa fa-book"></i> สร้างสื่อการสอน
     <!-- <a type="button" class="btn btn-md btn-warning pull-right" href="<?php echo site_url('admin/news'); ?>">
      <i class="fa fa-reply"></i> กลับ</a> -->
    </div>


    <?php echo form_open_multipart('admin/news/insert'); ?>
    <div class="panel-body">
      <div class="row">
        <div class="col-md-1">
         <div class="form-group">
         </span>
       </div>
     </div>
     <div class="col-md-10">
      <br><br>
      <div class="form-group">
        <label>ชื่อเรื่อง</label><span style="color: red;">&nbsp;*</span><?php echo form_error('name'); ?>
        <input class="form-control" id="post_name" name="name" value="<?php echo set_value('name'); ?>">
      </div>

      <div class="form-group">
        <label>รายละอียด</label><span style="color: red;">&nbsp;*</span><?php echo form_error('detail'); ?>
        <textarea  class="form-control summernote" rows="500" name="detail">
          <?php echo set_value('detail'); ?>
        </textarea >
      </div>
     <!--  <div class="form-group">
       <label>tag</label><span style="color: red;">&nbsp;*</span><?php echo form_error('tag'); ?>
       <input type="text" class="form-control"  name="tag" value="<?php echo set_value('tag'); ?>" data-role="tagsinput"/>
     </div> -->


     <div class="form-group"><br>
       <label>ภาพปก</label><span style="color: red;">&nbsp; jpg/png</span>
       <div>
         <img src="<?php echo base_url();?>assets/img/news/news.png" id='img-upload'><br><br>
       </div>
       <div>
        <span class="btn btn-info btn-file">เพิ่มภาพปก
         <input type="file" id="imgInp" name="img" >
       </span>
     </div>
     <!-- <div class="form-group">
      <label>อัลบั้มภาพ</label><span style="color: red;">&nbsp; png / jpg</span>
      <input id="file-input" type="file" multiple name="album_img[]">
    </div>
    <div id="preview"></div> -->

    <hr>
    <div class="form-group">
      <label>เผยแพร่</label>
      <label class="switch">
        <input type="checkbox"  value="1" name="status" ><span class="slider"></span>
      </label>
    </div>
  </div>

  <div class="pull-right">
    <a href="<?php echo site_url('admin/news'); ?>" type="button" class="btn btn-md btn-warning">ยกเลิก</a>
    <button type="submit" class="btn btn-md btn-success" >บันทึก</button>
  </div><br><br><br>
  <?php echo form_close();?>
</div>
<div class="col-md-1"></div>
</div>


</div><br><br><br>
</div><!-- /.panel-->
</div>


<?php include 'pug_in.php'; ?>



<?php
if (isset($insert)) {

if ($insert=="f") { ?>
 <script type="text/javascript">
  $(document).ready(function() {
    $("#alert_adderror").modal("show");
  });
</script>

<?php }

if ($insert=="t") { ?>
 <script type="text/javascript">
  $(document).ready(function() {
    $("#alert_addsuccess").modal("show");
    $('#ok').click(function(){
          //alert('123');
          window.location.replace("<?php echo site_url('admin/news'); ?>");
        });
  });
  setInterval(function () {
    window.location.replace("<?php echo site_url('admin/news'); ?>");
  }, 3000);
</script>
<?php
}

}
?>
