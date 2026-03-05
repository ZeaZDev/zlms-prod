<?php

if($_SESSION['personnel_role'] != "1" )
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
      <li class="active">Personnel</li>
    </ol>
  </div><br>


  <div class="panel panel-default">
    <div class="panel-heading"><i class="fa fa-user-o"></i> บุคลากร
     <!-- <a type="button" class="btn btn-md btn-warning pull-right" href="<?php echo site_url('admin/news'); ?>">
      <i class="fa fa-reply"></i> กลับ</a> -->
    </div> 


    <?php echo form_open_multipart('admin/personnel/insert'); ?> 
    <div class="panel-body">
      <div class="row">
        <div class="col-md-1">
         <div class="form-group">
         </span>
       </div>
     </div>
     <div class="col-md-10">
      <br><br>

      <div class="row">
        <div class="col-md-6">

          <div class="form-group">
            <label>ชื่อ</label><span style="color: red;">&nbsp;*</span><?php echo form_error('fname'); ?>
            <input class="form-control" id="" name="fname" value="<?php echo set_value('fname'); ?>">
          </div>

        </div>
        <div class="col-md-6">

          <div class="form-group">
            <label>นามสกุล</label><span style="color: red;">&nbsp;*</span><?php echo form_error('lname'); ?>
            <input class="form-control" id="" name="lname" value="<?php echo set_value('lname'); ?>">
          </div>

        </div>
      </div>

      <div class="form-group">
        <label>สังกัด</label><span style="color: red;">&nbsp;*</span><?php echo form_error('faculty'); ?>
        <select class="form-control chosen" name="faculty" >
          <option value=""> == เลือก == </option>
          <?php
          for($i=0;$i<sizeof($faculty);$i++){
            echo '<option value="'.$faculty[$i]->id_faculty.'">'.$faculty[$i]->name_faculty.'</option>';
          } ?>
        </select>
      </div>

      <div class="form-group">
        <label>เบอร์โทรศัพท์</label><span style="color: red;">&nbsp;*</span><?php echo form_error('tel'); ?>
        <input class="form-control" id="" name="tel" value="<?php echo set_value('tel'); ?>">
      </div>
      <div class="form-group">
        <label>อีเมล</label><span style="color: red;">&nbsp;</span><?php echo form_error('email'); ?>
        <input class="form-control" id="" name="email" value="<?php echo set_value('email'); ?>">
      </div>

      <div class="pull-right">
        <a href="<?php echo site_url('admin/personnel'); ?>" type="button" class="btn btn-md btn-warning">ยกเลิก</a>
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
          window.location.replace("<?php echo site_url('admin/personnel'); ?>");
        });
  });
  setInterval(function () {
    window.location.replace("<?php echo site_url('admin/personnel'); ?>");
  }, 3000);
</script>
<?php
} 

} 
?>



