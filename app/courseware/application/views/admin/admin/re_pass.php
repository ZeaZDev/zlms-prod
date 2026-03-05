

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
  <div class="row">
    <ol class="breadcrumb">
      <li><a href="#">
        <em class="fa fa-home"></em>
      </a></li>
      <li class="active">Password</li>
    </ol>
  </div><br>


  <div class="panel panel-default">
    <div class="panel-heading"><i class="fa fa-key"></i> ตั่งค่ารหัสผ่าน
     <!-- <a type="button" class="btn btn-md btn-warning pull-right" href="<?php echo site_url('admin/news'); ?>">
      <i class="fa fa-reply"></i> กลับ</a> -->
    </div> 


    <?php echo form_open_multipart('admin/operation/repass_user'); ?> 

    <div class="panel-body">
      <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10"><br>

         <div class="row">
          <div class="col-md-2"></div>
          <div class="col-md-8"><br><br>

            <div class="form-group">
              <label>รหัสผ่านเดิม</label><span style="color: red;">&nbsp;*</span><?php echo form_error('p1'); ?>
              <input type="Password" class="form-control"  name="p1" >
            </div>
            <br>

            <div class="form-group">
              <label>รหัสผ่านใหม่</label><span style="color: red;">&nbsp;*</span><?php echo form_error('p2'); ?>
              <input type="Password" class="form-control"  name="p2">
            </div>
            <div class="form-group">
              <label>ยืนยันรหัสผ่านใหม่</label><span style="color: red;">&nbsp;*</span><?php echo form_error('p3'); ?>
              <input type="Password" class="form-control"  name="p3" >
            </div>

          </div>
        </div><br><br>
        <p class="pull-right" style="color: red;">*** กรุณาระบุรหัสให้มีความยาวอย่างน้อย 8 หลัก</p><br>
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

if (isset($error)) {

  if ($error=="1") { ?>
   <script type="text/javascript">
    $(document).ready(function() {
      $("#alert_adderror1").modal("show");
    });
  </script>

<?php } 
 
} 


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
          window.location.replace("<?php echo site_url('admin/home'); ?>");
        });
  });
  setInterval(function () {
    window.location.replace("<?php echo site_url('admin/home'); ?>");
  }, 3000);
</script>
<?php
} 

} 

?>




<div class="modal fade" id="alert_adderror1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title"></h5>
        <!-- <img src="<?php echo base_url();?>assets/img/logo/logoTOP.png" alt="" width="30"> -->
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="" >
        <center>
          <h3 style="color: red">Error!</h3>
          <p>รหัสผ่านเดิมไม่ถูกต้อง</p>
          <p>กรุณาตรวจสอบข้อมูลให้ถูกต้อง</p>
        </center>
      </div>
      <div class="modal-footer" id="" >
        <button type="button" class="btn btn-primary" data-dismiss="modal" id="error" >ตกลง</button>
      </div>
    </div>
  </div>
</div>


