


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
   <div class="panel-heading"><i class="fa fa-ellipsis-h"></i> หน่วยงานที่เกี่ยวข้อง
     <a type="button" class="btn btn-md btn-primary pull-right" href="<?php echo site_url('admin/setting/add_footer_type1'); ?>"><i class="fa fa-plus-circle"></i> เพิ่มหน่วยงานที่เกี่ยวข้อง</a>
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
            <th >หน่วยงานที่เกี่ยวข้อง</th>
            <th >URL</th>
            <th >หน่วยงาน</th>
            <th >สถานะ</th>
            <th >จัดการ</th>
          </tr>
        </thead>
        <tbody>
         <?php if ($footer_type1 != null) { ?>
           <?php foreach($footer_type1 as $c) { ?>
             <tr>
               <td hidden=""></td>
               <td scope="row"><b><?php echo $c->name_footer ; ?></b></td>
               <td scope="row"><a href="<?php echo $c->url_footer ; ?>"><?php echo $c->url_footer ; ?></a></td>
                <td> 
                  <?php if ($c->type_footer=="1") { ?>
                  <p>หน่วยงานที่เกี่ยวข้อง</p>
                  <?php } else { ?>
                  <p>หน่วยงานนวัตกรรม</p>
                  <?php }?>
               </td>
               <td> 
                  <?php if ($c->status_footer=="1") { ?>
                  <img src="<?php echo base_url();?>assets/img/icon/y.png"class="icon" >
                  <?php } else { ?>
                  <p style="color: red;">ฉบับร่าง</p>
                  <?php }?>
               </td>
               <td>
                    <a href="<?php echo site_url('admin/setting/edit_footer_type1/'.$c->id_footer); ?>" >
                      <img class="icon" src="<?php echo base_url('assets/img/icon/icon_seting.png'); ?>"
                      title="แก้ไขข้อมูล"  />
                    </a>
                </td> 
              </tr>
            <?php } ?>
          <?php } ?>
        </tbody>
      </table>

    </div>
  </div>

</div><br>
</div><!-- /.panel-->

<!-- 

  <div class="panel panel-default">
   <div class="panel-heading"><i class="fa fa-ellipsis-h"></i> หน่วยงานนวัตกรรม
     <a type="button" class="btn btn-md btn-primary pull-right" href="<?php echo site_url('admin/setting/add_footer_type2'); ?>"><i class="fa fa-plus-circle"></i> เพิ่มหน่วยงานนวัตกรรม</a>
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
            <th >หน่วยงานที่เกี่ยวข้อง</th>
            <th >URL</th>
            <th >สถานะ</th>
            <th >จัดการ</th>
          </tr>
        </thead>
        <tbody>
         <?php if ($footer_type2 != null) { ?>
           <?php foreach($footer_type2 as $c) { ?>
             <tr>
               <td hidden=""></td>
               <td scope="row"><b><?php echo $c->name_footer ; ?></b></td>
               <td scope="row"><a href="<?php echo $c->url_footer ; ?>"><?php echo $c->url_footer ; ?></a></td>
               <td> 
                  <?php if ($c->status_footer=="1") { ?>
                  <img src="<?php echo base_url();?>assets/img/icon/y.png"class="icon" >
                  <?php } else { ?>
                  <p style="color: red;">ฉบับร่าง</p>
                  <?php }?>
               </td>
               <td>
                    <a href="<?php echo site_url('admin/setting/edit_footer_type2/'.$c->id_footer); ?>" >
                      <img class="icon" src="<?php echo base_url('assets/img/icon/icon_seting.png'); ?>"
                      title="แก้ไขข้อมูล"  />
                    </a>
                </td> 
              </tr>
            <?php } ?>
          <?php } ?>
        </tbody>
      </table>

    </div>
  </div>

</div><br>
</div><!-- /.panel-->




</div>  










