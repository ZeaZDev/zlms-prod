
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
    <div class="panel-heading"><i class="fa fa-book"></i> แก้ไขสื่อการสอน
     <a type="button" class="btn btn-md btn-warning pull-right" href="<?php echo site_url('admin/news'); ?>">
      <i class="fa fa-reply"></i> ยกเลิก</a>
    </div>


    <?php echo form_open_multipart('admin/news/edit_news'); ?>
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
        <input class="form-control" id="post_name" name="name" value="<?php echo $news->name_news ; ?>">
      </div>

      <div class="form-group">
        <label>รายละอียด</label><span style="color: red;">&nbsp;*</span><?php echo form_error('detail'); ?>
        <textarea  class="form-control summernote" rows="500" name="detail">
          <?php echo $news->detail_news ; ?>
        </textarea >
      </div>
      <!-- <div class="form-group">
       <label>tag</label><span style="color: red;">&nbsp;*</span><?php echo form_error('tag'); ?>
       <input type="text" class="form-control"  name="tag" value="<?php echo $news->tag_news ; ?>" data-role="tagsinput"/>
     </div> -->



     <div class="form-group"><br>
       <label>ภาพปก</label><span style="color: red;">&nbsp; jpg/png</span>
       <div>
        <?php
        if ($news->img_news!='') { ?>
         <img src="<?php echo base_url();?>assets/img/news/<?= $news->img_news?>" id='img-upload'><br><br>
       <?php } else {  ?>
         <img src="<?php echo base_url();?>assets/img/news/news.png" id='img-upload'><br><br>
       <?php } ?>
     </div>
     <div>
      <span class="btn btn-info btn-file">แก้ไขภาพปก
       <input type="file" id="imgInp" name="img" >
     </span>
   </div>
 </div>

 <div class="form-group">
  <label>เผยแพร่</label>
  <label class="switch">
    <input type="checkbox" id="on"  value="1" name="status" ><span class="slider"></span>
  </label>
</div>
<div class="pull-right">
  <input type="hidden" name="id" required="" readonly="" value="<?php echo $news->id_news ; ?>">
  <input type="hidden" name="img_db" required="" readonly="" value="<?php echo $news->img_news ; ?>">
  <!-- <a href="<?php echo site_url('admin/news'); ?>" type="button" class="btn btn-md btn-warning">ยกเลิก</a> -->
  <button type="submit" class="btn  btn-success" >บันทึกการแก้ไข</button>
</div>
<?php echo form_close();?>
<br><hr>

</div>


</div>
<div class="col-md-1"></div>
</div>

<br><br><br>
</div><!-- /.panel-->


<!-- 
<div class="panel panel-default">
  <div class="panel-heading"><i class="fa fa-newspaper-o"></i> อัลบั้มภาพ
  </div>
  <div class="panel-body">
    <div class="row">
      <div class="col-md-1">
      </div>
      <div class="col-md-10">
        <br><br>
        <hr>
        <?php echo form_open_multipart('admin/news/album_news_news'); ?>
        <input type="hidden" name="id_news" required="" readonly="" value="<?php echo $news->id_news ; ?>">
        <div class="form-group">
          <label>เพิ่มภาพรถ</label><span style="color: red;">&nbsp;* png / jpg</span>
          <input id="file-input" type="file" multiple name="img[]" required="">
        </div>
        <div id="preview"></div>
        <div class="modal-footer" id="" >
          <button type="submit" class="btn btn-md btn-info" >เพิ่มภาพ</button>
        </div>
        <?php echo form_close();?>
        <?php include 'pug_imgcheckbox.php'; ?>
        <div class="row"><br><br><br>
         <ul class="liimg">
          <?php if ($album_news != null) { ?>
            <?php foreach($album_news as $cc) { ?>
              <li class="liimg">
                <input type="checkbox" name="album_news" id="cb<?php echo $cc->id_album_news ; ?>"
                data-id_album_news="<?php echo $cc->id_album_news ; ?>"/>
                <label class="labelimg" for="cb<?php echo $cc->id_album_news ; ?>">
                  <img src="<?php echo base_url();?>assets/img/news/<?php echo $cc->name_album_news ; ?> " />
                </label>
              </li>
            <?php } ?>
          <?php } ?>
        </ul>
      </div>
      <div class="modal-footer" id="" >
        <button type="submit" class="btn btn-md btn-danger pull-right" id="del_img" >ลบภาพที่เลือก</button>
      </div>
    </div>
    <div class="col-md-1"></div>
  </div>
  <br><br><br>
</div>
</div> -->


<script type="text/javascript">
  $('#del_img').click(function(){
    $("#form_del").html("");
    var sum=0;
    $("input:checkbox[name=album_news]:checked").each(function(){
     $("#form_del").append('<input type="" name="delimg[]" value="'+$(this).data('id_album_news')+'" >');
     sum++;
     console.log($(this).val());
   });
    if (sum!=0) {
     // alert('1');
       $("#form_del").submit();
    }
    else{
      //alert('0');
      $("#alert_delimg_error").modal("show");
    }
  });
</script>
<div >
  <?php echo form_open_multipart('admin/news/del_img_new/'.$news->id_news, array('id' =>'form_del')); ?>
  <?php echo form_close();?>
</div>






<?php include 'pug_in.php'; ?>

<script type="text/javascript">
 $(document).ready(function(){
  if (<?php echo $news->status_news; ?>==1) {
   document.getElementById("on").checked = true;
 }
});
</script>


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
