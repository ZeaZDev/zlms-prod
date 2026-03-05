
<?php

if($_SESSION['status_role'] != "2" )
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
      <li class="active">User</li>
    </ol>
  </div><br>


  <div class="panel panel-default">
    <div class="panel-heading"><i class="fa fa-user"></i> ผู้ใช้งานระบบ
     <!-- <a type="button" class="btn btn-md btn-warning pull-right" href="<?php echo site_url('admin/news'); ?>">
      <i class="fa fa-reply"></i> กลับ</a> -->
    </div> 


    <?php echo form_open_multipart('admin/admin/user_insert'); ?> 

    <div class="panel-body">
      <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10"><br>

         <div class="row">
          <div class="col-md-2"></div>
          <div class="col-md-8">
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label>ชื่อ</label><span style="color: red;">&nbsp;*</span><?php echo form_error('fname'); ?>
                  <input class="form-control"  name="fname" value="<?php echo set_value('fname'); ?>">
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label>นามสกุล</label><span style="color: red;">&nbsp;*</span><?php echo form_error('lname'); ?>
                  <input class="form-control"  name="lname" value="<?php echo set_value('lname'); ?>">
                </div>
              </div>
            </div>

            <div class="form-group">
              <label>อีเมล</label><span style="color: red;">&nbsp;*</span><?php echo form_error('mail'); ?>
              <input class="form-control"  name="mail" value="<?php echo set_value('mail'); ?>">
            </div>

            <div class="form-group">
              <label>เบอร์โทรศัพท์</label><span style="color: red;">&nbsp;*</span><?php echo form_error('tell'); ?>
              <input class="form-control" placeholder="ตัวเลข เรียงติดกัน 0899999999"  name="tall" value="<?php echo set_value('tell'); ?>">
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
              <label>สิทธิผู้ใช้งาน</label><span style="color: red;">&nbsp;*</span><?php echo form_error('role'); ?>
              <select class="form-control " name="role" >
                <option value=""> == เลือก ==</option>
                <?php
                for($i=0;$i<sizeof($role);$i++){
                  echo '<option value="'.$role[$i]->id_role.'">'.$role[$i]->name_role.'</option>';
                } ?>
              </select>
            </div>

            <div class="form-group">
              <label>สถานะ</label>
              <label class="switch">
                <input type="checkbox"  value="1" name="status" ><span class="slider"></span>
              </label>
            </div>

          </div>
        </div>

        <hr>

        <div class="pull-right">
          <a href="<?php echo site_url('admin/admin/admin'); ?>" type="button" class="btn btn-md btn-warning">ยกเลิก</a>
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
          window.location.replace("<?php echo site_url('admin/admin/user'); ?>");
        });
  });
  setInterval(function () {
    window.location.replace("<?php echo site_url('admin/admin/user'); ?>");
  }, 3000);
</script>
<?php
} 

} 
?>



