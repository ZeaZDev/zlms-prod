


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
    <div class="panel-heading"><i class="fa fa-map-marker"></i> ติดต่อเรา
      <a href="<?php echo site_url('contact'); ?>" target="_blank" >
      <img class="icon pull-right" src="<?php echo base_url('assets/img/icon/monitor.png'); ?>"
      title="แสดงผลลัพธ์"  />
    </a>
  </div> 


  <?php echo form_open_multipart('admin/setting/update_contact'); ?> 
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
      <label>ชื่อ</label><span style="color: red;">&nbsp;*</span><?php echo form_error('name'); ?>
      <input class="form-control" name="name" value="<?php echo $contact->name_contact ; ?>" >
    </div>

    <div class="form-group">
      <label>รายละอียด</label><span style="color: red;">&nbsp;*</span><?php echo form_error('detail'); ?>
      <textarea  class="form-control summernote" name="detail">
        <?php echo $contact->detail_contact ; ?>
      </textarea >
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
          window.location.replace("<?php echo site_url('admin/setting/contact'); ?>");
        });
  });
  setInterval(function () {
    window.location.replace("<?php echo site_url('admin/setting/contact'); ?>");
  }, 3000);
</script>
<?php
} 

} 
?>



