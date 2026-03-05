<?php

// if($_SESSION['id_user'] == "" )
// {
//   redirect('home');
//   exit();
// }
//
// if($_SESSION['status_role'] == "0" )
// {
//   redirect('admin/operation/logout');
// }


?>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>เครื่องมือจัดการสื่อการสอน</title>
  <!-- <link rel="icon" href="<?php echo base_url();?>assets/web/img/logo/cmu_logo.png"> -->
  <link href="<?php echo base_url('assets/admin/css/bootstrap.min.css'); ?>" rel="stylesheet">
  <link href="<?php echo base_url('assets/admin/css/font-awesome.min.css'); ?>" rel="stylesheet">
  <link href="<?php echo base_url('assets/admin/css/datepicker3.css'); ?>" rel="stylesheet">
  <link href="<?php echo base_url('assets/admin/css/styles.css'); ?>" rel="stylesheet">



  <script src="<?php echo base_url('assets/admin/js/jquery-1.11.1.min.js'); ?>"></script>
  <script src="<?php echo base_url('assets/admin/js/bootstrap.min.js'); ?>"></script>
  <script src="<?php echo base_url('assets/admin/js/chart.min.js'); ?>"></script>
  <script src="<?php echo base_url('assets/admin/js/chart-data.js'); ?>"></script>
  <script src="<?php echo base_url('assets/admin/js/easypiechart.js'); ?>"></script>
  <script src="<?php echo base_url('assets/admin/js/easypiechart-data.js'); ?>"></script>
  <script src="<?php echo base_url('assets/admin/js/bootstrap-datepicker.js'); ?>"></script>
  <script src="<?php echo base_url('assets/admin/js/custom.js'); ?>"></script>


  <!--Custom Font-->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
  <!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
<![endif]-->
<link href="<?php echo base_url('assets/admin/plugins/summernote/dist/summernote.css')?>" rel="stylesheet"/>
<script src="<?php echo base_url('assets/admin/plugins/summernote/dist/summernote.js'); ?>"></script>


<link href="<?php echo base_url('assets/admin/plugins/datatable/dataTables.min.css'); ?>" rel="stylesheet">
<script src="<?php echo base_url('assets/admin/plugins/datatable/dataTables.min.js'); ?>"></script>

<link href="<?php echo base_url('assets/admin/plugins/chosen/chosen.min.css'); ?>" rel="stylesheet">
<script src="<?php echo base_url('assets/admin/plugins/chosen/chosen.jquery.min.js'); ?>"></script>
<script src="<?=base_url()?>assets/admin/plugins/summernote/dist/summernote.js"></script>


<link href="<?php echo base_url('assets/plugins/tagsinput/bootstrap-tagsinput.css'); ?>" rel="stylesheet">
<script src="<?php echo base_url('assets/plugins/tagsinput/bootstrap-tagsinput.min.js'); ?>"></script>


<style type="text/css">
  ::-webkit-scrollbar {
    display: none;
  }
</style>

</head>
<body >
  <nav class="navbar navbar-custom navbar-fixed-top " role="navigation">
    <div class="container-fluid" >
      <div class="navbar-header ">
        <button type="button" class="navbar-toggle collapsed " data-toggle="collapse" data-target="#sidebar-collapse "><span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span></button>
          <a class="navbar-brand" >PEB-LMS</span></a>
         <!--  <ul class="nav navbar-top-links navbar-right">
            <li class="dropdown"><a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
              <em class="fa fa-user-circle-o"></em> <?php //echo $_SESSION['fname_user'].'  '.$_SESSION['lname_user'] ;?><span class="label label-info"></span>
            </a>
            <ul class="dropdown-menu dropdown-alerts">
            </ul>
          </li>
        </ul> -->
      </div>
    </div><!-- /.container-fluid -->
  </nav>

  <?php include 'menubar.php'; ?>




  <script type="text/javascript">

    $(document).ready(function(){
      $(".chosen").chosen({width: "inherit"}) ;
      $(".ch").chosen();
      $('.summernote').summernote({
        height: 400,
      });
      $('.datatb').DataTable();
      $('.datatb2').DataTable({
        paging: false,
        bInfo: false
      });
    });
  </script>



<?php
if("1" == "0"  )
{
 ?>
   <script type="text/javascript">
    $(document).ready(function() {
      $("#repass").modal("show");
    });
  </script>

<?php } ?>

<?php
      if (isset($re)) {
       if ($re="1") { ?>
        <script type="text/javascript">
         $(document).ready(function() {
           $("#repass").modal("hide");
         });
       </script>
<?php } } ?>
