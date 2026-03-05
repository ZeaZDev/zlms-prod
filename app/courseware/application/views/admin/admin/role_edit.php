
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
      <li class="active">Slideshow</li>
    </ol>
  </div><br>


  <div class="panel panel-default">
    <div class="panel-heading"><i class="fa fa-handshake-o"></i> สิทธิผู้ใช้งาน
     <!-- <a type="button" class="btn btn-md btn-warning pull-right" href="<?php echo site_url('admin/news'); ?>">
      <i class="fa fa-reply"></i> กลับ</a> -->
    </div> 


    <?php echo form_open_multipart('admin/admin/role_insert'); ?> 
    <div class="panel-body">
      <div class="row">
        <div class="col-md-1">
         <div class="form-group">
         </span>
       </div>
     </div>
     <div class="col-md-10">
      <input type="hidden" readonly="" name="id" value="<?php echo $role->id_role; ?>"  >

      <div class="form-group">
        <label>ชื่อสิทธิผู้ใช้งาน</label><span style="color: red;">&nbsp;*</span><?php echo form_error('name'); ?>
        <input class="form-control"  name="name" value="<?php echo $role->name_role ; ?>">
      </div>

      <div class="form-check">
        <input type="checkbox"  value="1" id="news" name="news" >
        <span>จัดการเมนูข่าวสาร</span> 
      </div>

      <div class="form-check">
        <input type="checkbox"  value="1" id="cal" name="calendar" >
        <span>ปฎิทินกิจกรรม</span>
      </div>

      <div class="form-check">
        <input type="checkbox"  value="1" id="personnel" name="personnel" >
        <span>บุคลากร</span>
      </div>

      <div class="form-check">
        <input type="checkbox"  value="1" id="setting" name="setting" >
        <span>จัดการเมนูตั่งค่า</span>
      </div>


      <hr>
      <div class="form-group">
        <label>สถานะ</label>
        <label class="switch">
          <input type="checkbox" id="status"  value="1" name="status" ><span class="slider"></span>
        </label>
      </div>

      <div class="pull-right">
        <a href="<?php echo site_url('admin/admin/role'); ?>" type="button" class="btn btn-md btn-warning">ยกเลิก</a>
        <button type="submit" class="btn btn-md btn-success" >บันทึก</button>
      </div><br><br><br>
      <?php echo form_close();?>
    </div>
    <div class="col-md-1"></div>
  </div>


</div><br><br><br>
</div><!-- /.panel-->
</div>  


<script type="text/javascript">
 $(document).ready(function(){
  if (<?php echo $role->status_role; ?>==1) {
   document.getElementById("status").checked = true;
 }
 if (<?php echo $role->setting_role; ?>==1) {
   document.getElementById("setting").checked = true;
 }
 if (<?php echo $role->news_role; ?>==1) {
  document.getElementById("news").checked = true;
 }
 if (<?php echo $role->personnel_role; ?>==1) {
   document.getElementById("personnel").checked = true;
 }
 if (<?php echo $role->calendar_role; ?>==1) {
   document.getElementById("cal").checked = true;
 }
});
</script>










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
          window.location.replace("<?php echo site_url('admin/admin/role'); ?>");
        });
  });
  setInterval(function () {
    window.location.replace("<?php echo site_url('admin/admin/role'); ?>");
  }, 3000);
</script>
<?php
} 

} 
?>



