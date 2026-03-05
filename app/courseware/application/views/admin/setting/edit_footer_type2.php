

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
      <li class="active">Footer</li>
    </ol>
  </div><br>


  <div class="panel panel-default">
    <div class="panel-heading"><i class="fa fa-ellipsis-h"></i> แก้ไขหน่วยงานที่เกี่ยวข้อง
   </div> 


   <?php echo form_open_multipart('admin/setting/insert_footer_type2'); ?> 
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
      <label>ชื่อหน่วยงานที่เกี่ยวข้อง</label><span style="color: red;">&nbsp;*</span><?php echo form_error('name'); ?>
      <input class="form-control" id="post_name" name="name" value="<?php echo $footer_type1->name_footer ; ?>">
    </div>

    <div class="form-group">
      <label>URL</label><span style="color: red;">&nbsp;*</span><?php echo form_error('url'); ?>
      <input class="form-control" id="post_name" name="url" value="<?php echo $footer_type1->url_footer ; ?>">
    </div>

  <?php $this->load->view('admin/setting/pug_in_status'); ?>
    <div class="form-group">
      <label>เผยแพร่</label>
      <label class="switch">
        <input type="checkbox"  value="1" name="status" ><span class="slider"></span>
      </label>
    </div>
    <br>

<script type="text/javascript">
 $(document).ready(function(){
  if (<?php echo $footer_type1->status_footer; ?>==1) {
   document.getElementById("on").checked = true;
 }
});
</script>


    <div class="pull-right">
      <input type="hidden" readonly="" required="" name="id" value="<?php echo $footer_type1->id_footer ;  ?>">
      <a href="<?php echo site_url('admin/setting/footer'); ?>" type="button" class="btn btn-md btn-warning">ยกเลิก</a>
      <button type="submit" class="btn btn-md btn-success" >บันทึก</button>
    </div><br><br><br>
    <?php echo form_close();?>
  </div>
  <div class="col-md-1"></div>
</div>


</div><br>
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
          window.location.replace("<?php echo site_url('admin/setting/footer'); ?>");
        });
  });
  setInterval(function () {
    window.location.replace("<?php echo site_url('admin/setting/footer'); ?>");
  }, 3000);
</script>
<?php
} 

} 
?>



