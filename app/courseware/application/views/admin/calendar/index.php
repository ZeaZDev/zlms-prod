<?php

if($_SESSION['calendar_role'] != "1" )
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
      <li class="active">Calendar</li>
    </ol>
  </div><br>

  <div class="panel panel-default">
   <div class="panel-heading"><i class="fa fa-calendar-o"></i> ปฎิทินกิจกรรม
     <a type="button" class="btn btn-md btn-primary pull-right" href="<?php echo site_url('admin/calendar/add'); ?>"><i class="fa fa-plus-circle"></i> เพิ่มกิจกรรม</a>
   </div> 
   <div class="panel-body">


    <div class="col-md-12"><br>
     <div class="col-md-1">
     </div>
     <div class="col-md-10">
      <table class="table table-hover  " id="" >
        <thead>
          <tr class="bg-color">  
            <th hidden=""></th>
            <th >รหัส</th>
            <th >วันที่</th>
            <th >เรื่อง</th>
            <th> สถานะ</th>
            <th >จัดการ</th>
          </tr>
        </thead>
        <tbody>
         <?php if ($calendar != null) { ?>
           <?php foreach($calendar as $c) { ?> 
             <tr>
               <td hidden=""></td>
               <td> <?php echo $c->id_calendar ; ?></td>
               <td> <?php echo $c->date_calendar ; ?> </td>
               <td ><b><?php echo $c->name_calendar ; ?></b></td>
               <td> 
                <?php if ($c->status_calendar=='0') { ?>
                  <P style="color: red;" >ฉบับร่าง</P>
                <?php } else{ ?>
                  <img class="icon" src="<?php echo base_url('assets/img/icon/y.png'); ?>"  />
                <?php  } ?>
              </td>
              <td>
                  <a href="<?php echo site_url('admin/calendar/edit/'.$c->id_calendar); ?>">
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






  </div><br><br><br><br><br><br><br><br>
</div><!-- /.panel-->


</div>  










