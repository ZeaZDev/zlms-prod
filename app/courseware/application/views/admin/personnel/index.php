

<?php

if($_SESSION['personnel_role'] != "1" )
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
      <li class="active">Personnel</li>
    </ol>
  </div><br>

  <div class="panel panel-default">
   <div class="panel-heading"><i class="fa fa-user-o"></i> บุคลากร
     <a type="button" class="btn btn-md btn-primary pull-right" href="<?php echo site_url('admin/personnel/add'); ?>"><i class="fa fa-plus-circle"></i> เพิ่มบุคลากร</a>
   </div> 
   <div class="panel-body">


    <div class="col-md-12"><br>
     <div class="col-md-1">
     </div>
     <div class="col-md-10">
      <table class="table table-hover datatb2 " id="" >
        <thead>
          <tr class="bg-color">  
            <th hidden=""></th>
            <th >ชื่อ</th>
            <th >สังกัด</th>
            <th >อีเมล</th>
            <th >เบอร์โทรศัพท์</th>
            <th >จัดการ</th>
          </tr>
        </thead>
        <tbody>
         <?php if ($personnel != null) { ?>
           <?php foreach($personnel as $c) { ?> 
             <tr>
               <td hidden=""></td>
               <td ><b><?php echo $c->fname_personnel ; ?> <?php echo $c->lname_personnel ; ?></b></td>
               <td> <?php echo $c->name_faculty ; ?></td>
               <td> <?php echo $c->mail_personnel ; ?></td>
               <td> <?php echo $c->tel_personnel ; ?></td>
               <td>
                    <a href="<?php echo site_url('admin/personnel/edit/'.$c->id_personnel); ?>">
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










