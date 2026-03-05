
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
      <li class="active">Role</li>
    </ol>
  </div><br>

  <div class="panel panel-default">
   <div class="panel-heading"><i class="fa fa-handshake-o"></i> สิทธิผู้ใช้งาน
     <a type="button" class="btn btn-md btn-primary pull-right" href="<?php echo site_url('admin/admin/addrole'); ?>"><i class="fa fa-plus-circle"></i> เพิ่มสิทธิผู้ใช้งาน</a>
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
            <th >สิทธิผู้ใช้งาน</th>
            <th >จัดการข่าวสาร</th>
            <th >ปฎิทินกิจกรรม</th>
            <th >บุคลากร</th>
            <th >จัดการตั่งค่า</th>
            <th >สถานะ</th>
            <th >จัดการ</th>
          </tr>
        </thead>
        <tbody>
         <?php if ($role != null) { ?>
           <?php foreach($role as $c) { ?>
             <tr>
               <td hidden=""></td>
               <td scope="row"><b><?php echo $c->name_role ; ?></b></td>
               <td> 
                <?php if ($c->news_role=="1") { ?>
                  <p style="">อนุญาต</p>
                <?php } else { ?>
                  <p style="color: red;">ไม่อนุญาต</p>
                <?php }?>
              </td>
              <td> 
                <?php if ($c->calendar_role=="1") { ?>
                  <p style="">อนุญาต</p>
                <?php } else { ?>
                  <p style="color: red;">ไม่อนุญาต</p>
                <?php }?>
              </td>
              <td> 
                <?php if ($c->personnel_role=="1") { ?>
                  <p style="">อนุญาต</p>
                <?php } else { ?>
                  <p style="color: red;">ไม่อนุญาต</p>
                <?php }?>
              </td>
              <td> 
                <?php if ($c->setting_role=="1") { ?>
                  <p style="">อนุญาต</p>
                <?php } else { ?>
                  <p style="color: red;">ไม่อนุญาต</p>
                <?php }?>
              </td>
              <td> 

                <?php if($c->status_role == "2" ) { ?>
                 <img src="<?php echo base_url();?>assets/img/icon/y.png"class="icon" >
                <?php } elseif ($c->status_role=="1") { ?>
                  <img src="<?php echo base_url();?>assets/img/icon/y.png"class="icon" >
                <?php } else { ?>
                  <img src="<?php echo base_url();?>assets/img/icon/n.png"class="icon" >
                <?php }?>

              </td>

              <td>

                <?php if($c->status_role != "2" ) { ?>
                  <a href="<?php echo site_url('admin/admin/editrole/'.$c->id_role); ?>">
                    <img class="icon" src="<?php echo base_url('assets/img/icon/icon_seting.png'); ?>"
                    title="แก้ไขข้อมูล"  />
                  </a>
                <?php }  ?>
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






</div><br><br><br>
</div><!-- /.panel-->


</div>  










