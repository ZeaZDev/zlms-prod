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
   <div class="panel-heading"><i class="fa fa-picture-o"></i> ภาพสไลด์
     <a type="button" class="btn btn-md btn-primary pull-right" href="<?php echo site_url('admin/slideshow/add'); ?>"><i class="fa fa-plus-circle"></i> เพิ่มภาพสไลด์</a>
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
            <th width="10"> ภาพสไลด์</th>
            <th ></th>
            <th >สถานะ</th>
            <th >จัดการ</th>
          </tr>
        </thead>
        <tbody>
         <?php if ($slideshow != null) { ?>
           <?php foreach($slideshow as $c) { ?>
             <tr>
               <td hidden=""></td>
               <td scope="row">
                <img style="height: 10em; width: auto;" src="<?php echo base_url();?>assets/img/slideshow/<?php echo $c->img_slideshow ; ?> "
                 >
              </td>
              <td >
                <b><?php echo $c->name_slideshow ; ?></b> <br> <?php echo $c->url_slideshow ; ?>
              </td>
              <td> 
                <?php if ($c->status_slideshow=="1") { ?>
                  <img src="<?php echo base_url();?>assets/img/icon/y.png"class="icon" >
                <?php } else { ?>
                  <p style="color: red;">ฉบับร่าง</p>
                <?php }?>
              </td>
              <td>
                <a href="<?php echo site_url('admin/slideshow/edit/'.$c->id_slideshow); ?>">
                  <img class="icon" src="<?php echo base_url('assets/img/icon/icon_seting.png'); ?>"
                  title="แก้ไขข้อมูล"  />
                </a>

                <a href="<?php echo site_url(''); ?>" target="_blank">
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










