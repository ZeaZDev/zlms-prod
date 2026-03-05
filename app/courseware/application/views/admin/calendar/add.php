<?php

if($_SESSION['calendar_role'] != "1" )
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
      <li class="active">Calendar</li>
    </ol>
  </div><br>


  <div class="panel panel-default">
    <div class="panel-heading"><i class="fa fa-calendar-o"></i> ปฎิทินกิจกรรม
    </div> 


    <?php echo form_open_multipart('admin/calendar/insert'); ?> 
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
        <label>เรื่อง</label><span style="color: red;">&nbsp;*</span><?php echo form_error('name'); ?>
        <input class="form-control" id="" name="name" value="<?php echo set_value('name'); ?>">
      </div>

      <div class="form-group">
        <label>รายละอียด</label><span style="color: red;">&nbsp;*</span><?php echo form_error('detail'); ?>
        <textarea  class="form-control summernote" rows="500" name="detail">
          <?php echo set_value('detail'); ?> 
        </textarea >
      </div> 

      <div class="form-group">
        <label>วันที่</label><span style="color: red;">&nbsp;*</span><?php echo form_error('date'); ?>
        <input class="form-control " type="date" name="date" value="<?php echo set_value('date'); ?>">
      </div>

      <div class="form-group">
        <label>ถึงวันที่</label><?php echo form_error('date'); ?>
        <input class="form-control " type="date" name="date2" value="<?php echo set_value('date2'); ?>">
      </div>

      <div class="form-group">
        <label>เผยแพร่</label>
        <label class="switch">
          <input type="checkbox"  value="1" name="status" ><span class="slider"></span>
        </label>
      </div>

      <hr>

      <div class="pull-right">
        <a href="<?php echo site_url('admin/calendar'); ?>" type="button" class="btn btn-md btn-warning">ยกเลิก</a>
        <button type="submit" class="btn btn-md btn-success" >บันทึก</button>
      </div>
      <br><br><br>
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
      $("#alert_ioginerror").modal("show");
    });
  </script>

<?php } 

if ($insert=="t") { ?>
 <script type="text/javascript">
  $(document).ready(function() {
    $("#alert_addsuccess").modal("show");
    $('#ok').click(function(){
          //alert('123');
          window.location.replace("<?php echo site_url('admin/calendar'); ?>");
        });
  });
  setInterval(function () {
    window.location.replace("<?php echo site_url('admin/calendar'); ?>");
  }, 3000);
</script>
<?php
} 

} 
?>



