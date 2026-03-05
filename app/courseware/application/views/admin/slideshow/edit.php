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
    <div class="panel-heading"><i class="fa fa-picture-o"></i> แก้ไขภาพสไลด์
     <!-- <a type="button" class="btn btn-md btn-warning pull-right" href="<?php echo site_url('admin/news'); ?>">
      <i class="fa fa-reply"></i> กลับ</a> -->
    </div> 


    <?php echo form_open_multipart('admin/slideshow/edit_slideshow'); ?> 
    <div class="panel-body">
      <div class="row">
        <div class="col-md-1">
         <div class="form-group">
         </span>
       </div>
     </div>
     <div class="col-md-10">

      <div class="form-group">
        <label>ชื่อภาพ</label><span style="color: red;">&nbsp;*</span><?php echo form_error('name'); ?>
        <input class="form-control"  name="name" value="<?php echo $slideshow->name_slideshow ; ?>">
      </div>

      <div class="form-group">
        <label>Link URL</label>
        <input class="form-control"  name="url" value="<?php echo $slideshow->url_slideshow ; ?>" >
      </div>


      <div class="form-group"><br>
       <label>ภาพปก</label><span style="color: red;">&nbsp; jpg/png / ขนาดแนะนำ 1920*960 px</span>
       <?php echo form_error('img'); ?>
       <div>
        <?php
        if ($slideshow->img_slideshow!='') { ?>
          <img src="<?php echo base_url();?>assets/img/slideshow/<?php echo $slideshow->img_slideshow ; ?>" id='img-upload'> 
        <?php }else{ ?> 
         <img src="<?php echo base_url();?>assets/img/slideshow/1.jpg" id='img-upload'>
         <?php } ?><br><br>
       </div>
       <div>
        <span class="btn btn-info btn-file">เพิ่มภาพปก
         <input type="file" id="imgInp" name="img" >
       </span>
     </div>
   </div>

   <hr>
   <div class="form-group">
    <label>เผยแพร่</label>
    <label class="switch">
      <input type="checkbox" id="on" value="1" name="status" ><span class="slider"></span>
    </label>
  </div>

  <script type="text/javascript">
   $(document).ready(function(){
    if (<?php echo $slideshow->status_slideshow; ?>==1) {
     document.getElementById("on").checked = true;
   }
 });
</script>


<div class="pull-right">
  <input type="hidden" name="id" value="<?php echo $slideshow->id_slideshow ; ?>" required="" readonly="">
  <a href="<?php echo site_url('admin/slideshow'); ?>" type="button" class="btn btn-md btn-warning">ยกเลิก</a>
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
          window.location.replace("<?php echo site_url('admin/slideshow'); ?>");
        });
  });
  setInterval(function () {
    window.location.replace("<?php echo site_url('admin/slideshow'); ?>");
  }, 3000);
</script>
<?php
} 

} 
?>



