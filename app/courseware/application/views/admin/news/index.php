
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
        <em class="fa fa-book"></em>
      </a></li>
      <li class="active">สื่อการสอน</li>
    </ol>
  </div><br>

  <div class="panel panel-default">
   <div class="panel-heading"><i class="fa fa-book"></i> สื่อการสอน
     <a type="button" class="btn btn-md btn-primary pull-right" href="<?php echo site_url('admin/news/add'); ?>"><i class="fa fa-plus-circle"></i> สร้างสื่อการสอน</a>
   </div>
   <div class="panel-body">


    <div class="col-md-12"><br>
     <div class="col-md-1">
     </div>
     <div class="col-md-10">
      <table class="table table-hover " id="" >
        <thead>
          <tr class="bg-color">
            <th hidden=""></th>
            <th >รหัส</th>
            <th >ชื่อเรื่อง</th>
            <th >วันที่</th>
            <th >สร้างโดย</th>
            <th >สถานะ</th>
            <th >จัดการ</th>
          </tr>
        </thead>
        <tbody>
         <?php if ($news_list != null) { ?>
           <?php foreach($news_list as $c) { ?>
             <tr>
               <td hidden=""></td>
               <td scope="row"><?php echo $c->id_news ; ?></td>
               <td scope="row"><b><?php echo $c->name_news ; ?></b></td>
               <td scope="row"><?php echo $c->date_news ; ?></td>
               <td scope="row"><?php echo $c->fname_user ; ?> <?php echo $c->lname_user ; ?></td>
               <td>
                  <?php if ($c->status_news=="1") { ?>
                  <img src="<?php echo base_url();?>assets/img/icon/y.png"class="icon" >
                  <?php } else { ?>
                  <p style="color: red;">ฉบับร่าง</p>
                  <?php }?>
               </td>
               <td>
                    <a href="<?php echo site_url('admin/news/edit/'.$c->id_news); ?>">
                      <img class="icon" src="<?php echo base_url('assets/img/icon/icon_seting.png'); ?>"
                      title="แก้ไขข้อมูล"  />
                    </a>

                    <a href="<?php echo site_url('news/view/'.$c->id_news); ?>" target="_blank">
                  <img class="icon" src="<?php echo base_url('assets/img/icon/monitor.png'); ?>"
                  title="แสดงผลลัพธ์"  />
                </a>

                   <!--  <a data-toggle="modal" data-target="#alert_yn"
                    data-id_dell="<?php echo $c->id_news; ?>"
                    class="btn_dell" href="">
                    <img class="shake icon" src="<?php echo base_url('assets/img/icon/trash-flat.png');?>"
                    title="ลบข้อมูล" />
                  </a> -->
                </td>

              </tr>
            <?php } ?>
          <?php } ?>
        </tbody>
      </table>



    </div>
  </div>






</div><br><br><br><br><br><br><br><br>
</div><!-- /.panel-->


</div>
