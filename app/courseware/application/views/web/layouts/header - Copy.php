<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Societal Engagement CMU</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  <!-- Favicons -->
  <link rel="icon" href="<?php echo base_url();?>assets/web/img/logo/cmu_logo.png">
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="<?php echo base_url('assets/web/lib/bootstrap/css/bootstrap.min.css'); ?>" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="<?php echo base_url('assets/web/lib/font-awesome/css/font-awesome.min.css'); ?>" rel="stylesheet">
  <link href="<?php echo base_url('assets/web/lib/animate/animate.min.css'); ?>" rel="stylesheet">
  <link href="<?php echo base_url('assets/web/lib/ionicons/css/ionicons.min.css'); ?>" rel="stylesheet">
  <link href="<?php echo base_url('assets/web/lib/owlcarousel/assets/owl.carousel.min.css'); ?>" rel="stylesheet">

  <!-- Main Stylesheet File -->
  <link href="<?php echo base_url('assets/web/css/style.css'); ?>" rel="stylesheet">


  <!-- JavaScript Libraries -->


  <script src="<?php echo base_url('assets/web/lib/jquery/jquery.min.js'); ?>"></script>
  <script src="<?php echo base_url('assets/web/lib/jquery/jquery-migrate.min.js'); ?>"></script>
  <script src="<?php echo base_url('assets/web/lib/popper/popper.min.js'); ?>"></script>
  <script src="<?php echo base_url('assets/web/lib/bootstrap/js/bootstrap.min.js'); ?>"></script>
  <script src="<?php echo base_url('assets/web/lib/easing/easing.min.js'); ?>"></script>
  <script src="<?php echo base_url('assets/web/lib/owlcarousel/owl.carousel.min.js'); ?>"></script>
  <script src="<?php echo base_url('assets/web/lib/scrollreveal/scrollreveal.min.js'); ?>"></script>

  <!-- Contact Form JavaScript File -->
  <script src="<?php echo base_url('assets/web/contactform/contactform.js'); ?>"></script>


  <!-- =======================================================
    Theme Name: EstateAgency
    Theme URL: https://bootstrapmade.com/real-estate-agency-bootstrap-template/
    Author: BootstrapMade.com
    License: https://bootstrapmade.com/license/
    ======================================================= -->
  </head>

  <body>


    <div class="click-closed"></div>
    <!--/ Form Search Star /-->
    <div class="box-collapse">
      <div class="title-box-d">
        <h3 class="title-d">เข้าสู่ระบบ</h3>
      </div>
      <span class="close-box-collapse right-boxed ion-ios-close"></span>
      <div class="box-collapse-wrap form">
        <form  method="post" action="<?php echo site_url('admin/operation/user_login'); ?>" class="form-a">
          <div class="row">
            <div class="col-md-12 mb-2">
              <div class="form-group">
                <label for="Type">Username</label>
                <input type="text" class="form-control form-control-lg form-control-a" placeholder="Username" name="login">
                <label for="Type">Password</label>
                <input type="Password" class="form-control form-control-lg form-control-a" placeholder="Password" name="pass">
              </div>
            </div>

            <div class="col-md-12">
              <input type="submit" value="LOGIN" class="btn btn-b">
            </div>
          </div>
        </form>
      </div>
    </div>
    <!--/ Form Search End /-->

    <!--/ Nav Star /-->
    <nav class="navbar navbar-default navbar-trans navbar-expand-lg fixed-top">
      <div class="container">


        <img src="<?php echo base_url();?>assets/web/img/logo/logo.png " style="width: 17em;">

        <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarDefault"
        aria-controls="navbarDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span></span>
        <span></span>
        <span></span>
      </button>


      <!-- <a class="navbar-brand text-brand" href="index.html">SE<span class="color-b"> .CMU</span></a> --> 

      
      <?php $this->load->view('web/layouts/menubar'); ?>

     


      <button type="button" class="btn btn-b-n navbar-toggle-box-collapse d-none d-md-block" data-toggle="collapse"
      data-target="#navbarTogglerDemo01" aria-expanded="false">
      <span class="fa fa-user-circle-o" aria-hidden="true"></span>
    </button>

     <ul class="navbar-nav">
        <li class="nav-item dropdown ">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" >
            Th
          </a>
          <div class="dropdown-menu " aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="#">English</a>
            <a class="dropdown-item" href="#">Thai</a>
          </div>
        </li>
      </ul>


  </div>
</nav>
<!--/ Nav End /-->


<?php
if (isset($login)) {

  if ($login=="no") { ?>
   <script type="text/javascript">
    $(document).ready(function() {
      $("#alert_loginerror").modal("show");
    });
  </script>

<?php } 
} 
?>






<div class="modal fade" id="alert_loginerror" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title"></h5>
        <!-- <img src="<?php echo base_url();?>assets/img/logo/logoTOP.png" alt="" width="30"> -->
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="" >
        <center>
          <h3 style="color: red">Error!</h3>
          <p>ไม่สามารถเข้าสู่ระบบได้ กรุณาตรวจสอบข้อมูลให้ถูกต้อง</p><br>
        </center>
      </div><!-- 
      <div class="modal-footer" id="" >
        <button type="button" class="btn btn-primary" data-dismiss="modal" id="error" >ตกลง</button>
      </div> -->
    </div>
  </div>
</div>
