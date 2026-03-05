
<?php

if($_SESSION['setting_role'] != "1" )
{
  redirect('admin/operation/logout');
}

?>

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
  <div class="row">
    <ol class="breadcrumb">
      <li><a href="#">
        <em class="fa fa-home"></em>
      </a></li>
      <li class="active">Contact</li>
    </ol>
  </div><br>


  <div class="panel panel-default">
    <div class="panel-heading"><i class="fa fa-address-book"></i> เกี่ยวกับเรา
      <a href="<?php echo site_url('about'); ?>" target="_blank" >
      <img class="icon pull-right" src="<?php echo base_url('assets/img/icon/monitor.png'); ?>"
      title="แสดงผลลัพธ์"  />
    </a>
  </div> 


  <?php echo form_open_multipart('admin/setting/update_about'); ?> 
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
      <label>ชื่อ</label><span style="color: red;">&nbsp;*</span><?php echo form_error('name1'); ?><br>
      <input class="form-control" name="name1" value="<?php echo $about->name1_about ; ?>" >
    </div>

    <div class="form-group">
      <?php echo form_error('name2'); ?>
      <input class="form-control" name="name2" value="<?php echo $about->name2_about ; ?>" >
      <?php echo form_error('name3'); ?>
      <input class="form-control" name="name3" value="<?php echo $about->name3_about ; ?>" >
    </div>

    <div class="form-group">
      <label>รายละอียด</label><span style="color: red;">&nbsp;*</span><?php echo form_error('detail'); ?>
      <textarea  class="form-control summernote" name="detail">
       <?php echo $about->detail_about ; ?>
      </textarea >
    </div>

      <div class="form-group"><br>
       <label>ภาพ</label><span style="color: red;">&nbsp; jpg/png</span>
       <div>
        <?php
        if ($about->img_about!='') { ?>
         <img src="<?php echo base_url();?>assets/img/tem/<?= $about->img_about?>" id='img-upload'><br><br>
       <?php } else {  ?>
         <img src="<?php echo base_url();?>assets/img/news/news.png" id='img-upload'><br><br>
       <?php } ?>
     </div>
     <div>
      <span class="btn btn-info btn-file">แก้ไขภาพ
       <input type="file" id="imgInp" name="img" >
     </span>
   </div>
 </div>


    <br><hr>
    <div class="pull-right">
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
          window.location.replace("<?php echo site_url('admin/setting/about'); ?>");
        });
  });
  setInterval(function () {
    window.location.replace("<?php echo site_url('admin/setting/about'); ?>");
  }, 3000);
</script>
<?php
} 

} 
?>



