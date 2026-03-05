
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
      <li class="active">User</li>
    </ol>
  </div><br>

  <div class="panel panel-default">
   <div class="panel-heading"><i class="fa fa-user"></i> ผู้ใช้งานระบบ
     <a type="button" class="btn btn-md btn-primary pull-right" href="<?php echo site_url('admin/admin/adduser'); ?>"><i class="fa fa-plus-circle"></i> เพิ่มผู้ใช้งานระบบ</a>
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
            <th>ชื่อ</th>
            <th>อีเมล</th>
            <th>สังกัด</th>
            <th>โทร</th>
            <th>สิทธิผู้ใช้งาน</th>
            <th>สถาณะ</th>
            <th>จัดการ</th>
          </tr>
        </thead>
        <tbody>
         <?php if ($user != null) { ?>
           <?php foreach($user as $c) { ?>
             <tr>
               <td hidden=""></td>
               <td><?php echo $c->fname_user ; ?>  <?php echo $c->lname_user ; ?></td>
               <td><?php echo $c->login_user ; ?></td>
               <td><?php echo $c->name_faculty ; ?></td>
               <td><?php echo $c->tall_user ; ?></td>
               <td scope="row"><?php echo $c->name_role ; ?></td>
               <td> 
                <?php if ($c->status_user=="1") { ?>
                  <img src="<?php echo base_url();?>assets/img/icon/y.png"class="icon" >
                <?php } else { ?>
                  <p style="color: red;">ปิดการใช้งาน</p>
                <?php }?>
              </td>
              <td>
                <a href="<?php echo site_url('admin/admin/edituser/'.$c->id_user); ?>">
                  <img class="icon" src="<?php echo base_url('assets/img/icon/icon_seting.png'); ?>"
                  title="แก้ไขข้อมูล"  />
                </a>

                <?php if ($c->repass_user=="0") { ?>

                  <a data-toggle="modal" data-target="#print" 
                  data-fname_user="<?php echo $c->fname_user ; ?>" 
                  data-lname_user="<?php echo $c->lname_user ; ?>"
                  data-name_faculty="<?php echo $c->name_faculty ; ?>"
                  data-login_user="<?php echo $c->login_user ; ?>"
                  data-tall_user="<?php echo $c->tall_user ; ?>"
                  class="btn_edit" href="">
                  <img class="icon" src="<?php echo base_url('assets/img/icon/print.png'); ?>"" title="พิมพ์"/></a>

                <?php }?>

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

<script type="text/javascript">
  $(document).ready(function() {
    $(".btn_edit").click(function() {

      document.getElementById("fname_user").innerHTML = $(this).data('fname_user');
      document.getElementById("lname_user").innerHTML = $(this).data('lname_user');
      document.getElementById("name_faculty").innerHTML = $(this).data('name_faculty');
      document.getElementById("login_user").innerHTML = $(this).data('login_user');
      document.getElementById("tall_user").innerHTML = $(this).data('tall_user');


     // alert('AAA');

     
   });

  });
</script>





<!-- Modal -->
<div class="modal fade" id="print" role="dialog">
  <div class="modal-dialog modal-lg">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">ข้อมูลเข้าสู่ระบบครั้งแรก</h4>
      </div>
      <div class="modal-body" id="print_btn">
        <div class="row">
          <div class="col-md-3"></div>
          <div class="col-md-6">
           <center>
            <h3><b>ข้อมูลเข้าสู่ระบบครั้งแรก</b></h3>
            <p>หน่วยสนับสนุนวิชาการรับใช้สังคมมหาวิทยาลัยเชียงใหม่</p><hr>
            <span>ผู้ใช้งาน : </span><b id="fname_user"></b> <b id="lname_user"></b><br>
            <span>สังกัด : </span><b id="name_faculty"></b> <br><br>
            <span>username : </span><b id="login_user"></b> <br>
            <span>password : </span><b id="tall_user"></b> <br>

          </center>
        </div>
        <div class="col-md-3"></div>
      </div>

    </div>
    <div class="modal-footer">
      <input type="button" onclick="myFunction()" class="btn btn-md btn-primary" value="พิมพ์เอกสาร"></input>
      <button type="button" class="btn btn-default" data-dismiss="modal">ปิด</button>
    </div>
  </div>

</div>
</div>



<script type="text/javascript">


  function myFunction() {
    var printContents = document.getElementById('print_btn').innerHTML;
    document.body.innerHTML = printContents;
    window.print();

    window.location.replace("<?php echo site_url('admin/admin/user'); ?>");


  }
</script>













