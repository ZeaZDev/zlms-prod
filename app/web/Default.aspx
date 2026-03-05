<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="lms.web.Default" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>กองบัญชาการศึกษา สํานักงานตํารวจแห่งชาติ</title>
    <link rel="icon" href="img/logo/logo.gif">

    <!-- web-fonts -->
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <!-- Mobile Menu Style -->
    <link href="css/mobile-menu.css" rel="stylesheet">
    <link href="css/owl.carousel.css" rel="stylesheet">
    <link href="css/owl.theme.default.min.css" rel="stylesheet">
    <link href="css/style_f.css" rel="stylesheet">


    <script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/mobile-menu.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/script.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<script type="text/javascript">
  setInterval(function () {
   var date = new Date();
   var dayNames = ['อาทิตย์', 'จันทร์ ', 'อังคาร ', 'พุธ', 'พฤหัสบดี ', 'ศุกร์ ', 'เสาร์ '];
   var monthNames = ['มกราคม', 'กุมภาพันธ์', 'มีนาคม', 'เมษายน', 'พฤษภาคม', 'มิถุนายน', 'กรกฎาคม', 'สิงหาคม', 'กันยายน', 'ตุลาคม', 'พฤศจิกายน', 'ธันวาคม'];
   var d1 = dayNames[date.getDay()];
   var d = date.getDate();
   var m = monthNames[date.getMonth()];
   var y = date.getFullYear();
   if (d < 10) d = "0" + d;
   var today = d1+d+' '+m+'  '+y;
   document.getElementById("demo").innerHTML = today;
}, 1000);
</script>



<body id="page-top" data-spy="scroll" data-target=".navbar">
        <form id="form1" runat="server">
        <div>
        </div>
    </form>
    <div id="main-wrapper">
        <!-- Page Preloader -->
        <div id="preloader">
            <div id="status">
                <div class="status-mes"></div>
            </div>
        </div>
        <!-- preloader -->

        <div class="uc-mobile-menu-pusher">
            <div class="content-wrapper">

                <section id="header_section_wrapper" class="header_section_wrapper">
                    <div class="container">
                        <div class="header-section">
                            <div class="row">
                                <div class="col-md-4"><br><br>
                                    <div class="left_section">
                                     <span class="time">
                                      <span id="demo"></span>
                                  </span>
                                  <!-- Time -->
                                  <div class="social">
                                    <a class="icons-sm fb-ic"><i class="fa fa-facebook"></i></a>
                                    <!--Twitter-->
                                    <a class="icons-sm tw-ic"><i class="fa fa-twitter"></i></a>
                                    <!--Google +-->
                                    <a class="icons-sm inst-ic"><i class="fa fa-instagram"> </i></a>
                                    <!--Linkedin-->
                                    <a class="icons-sm tmb-ic"><i class="fa fa-tumblr"> </i></a>
                                    <!--Pinterest-->
                                    <a class="icons-sm rss-ic"><i class="fa fa-rss"> </i></a>
                                </div>
                                <!-- Top Social Section -->
                            </div>
                            <!-- Left Header Section -->
                        </div>
                        <div class="col-md-4">
                            <div class="logo">
                                <a href="home.html"><img style="width: 30em;" src="img/logo/logo_font.png" alt="Tech NewsLogo"></a>
                            </div>
                            <!-- Logo Section -->
                        </div>
                        <div class="col-md-4"><br><br>
                            <div class="right_section">
                                <ul class="nav navbar-nav">
                                    <li><a href="/login.aspx">เข้าสู่ระบบ</a></li>
                                    <li><a href="/Register.aspx">ลงทะเบียน</a></li>
                                </ul>
                                <!-- Language Section -->

                                <ul class="nav-cta hidden-xs">
                                    <li class="dropdown"><a href="#" data-toggle="dropdown" class="dropdown-toggle"><i
                                        class="fa fa-search"></i></a>
                                        <ul class="dropdown-menu">
                                            <li>
                                                <div class="head-search">
                                                    <form role="form">
                                                        <!-- Input Group -->
                                                        <div class="input-group">
                                                            <input type="text" class="form-control"
                                                            placeholder="ค้นหา"> <span class="input-group-btn">
                                                                <button type="submit"
                                                                class="btn btn-primary">ค้นหา
                                                            </button>
                                                        </span>
                                                    </div>
                                                </form>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                            <!-- Search Section -->
                        </div>
                        <!-- Right Header Section -->
                    </div>
                </div>
            </div>
            <!-- Header Section -->

            <div class="navigation-section">
                <nav class="navbar m-menu navbar-default">
                    <div class="container">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                            data-target="#navbar-collapse-1"><span class="sr-only">Toggle navigation</span> <span
                            class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
                        </button>
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="#navbar-collapse-1">
                        <ul class="nav navbar-nav main-nav">
                            <li class="active"><a href="home.html"></a></li>
                            <li><a href="#"></a></li>
                            <li><a href="#"></a></li>
                            <li><a href="#"></a></li>
                            <li><a href="#"></a></li>
                            <li class="dropdown m-menu-fw"><a href="#" data-toggle="dropdown" class="dropdown-toggle">
                                ระบบการให้บริการหนังสืออิเล็กทรอนิกส์และสื่อภาพเคลื่อนไหว
                                <span><i class="fa fa-angle-down"></i></span></a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <div class="m-menu-content">
                                            <ul class="col-sm-3">
                                                <li><b><h2>คู่มือสอบตำรวจ</h2></b></li>
                                                <li><a href="#">1</a></li>
                                                <li><a href="#">2</a></li>
                                            </ul>
                                            <ul class="col-sm-3">
                                                <li><b><h2>กฎหมาย</h2></b></li>
                                                <li><a href="#">1</a></li>
                                                <li><a href="#">2</a></li>
                                                <li><a href="#">3</a></li>
                                            </ul>
                                            <ul class="col-sm-3">
                                                <li><b><h2>ความรู้ทั่วไป</h2></b></li>
                                                <li><a href="#">1</a></li>
                                                <li><a href="#">2</a></li>
                                                <li><a href="#">3</a></li>
                                                <li><a href="#">4</a></li>
                                            </ul>
                                            <ul class="col-sm-3">
                                                <li><b><h2>สื่อภาพเคลื่อนไหว</h2></b></li>
                                                <li><a href="#">1</a></li>
                                                <li><a href="#">2</a></li>
                                                <li><a href="#">3</a></li>
                                                <li><a href="#">4</a></li>
                                            </ul>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <!-- .navbar-collapse -->
                </div>
                <!-- .container -->
            </nav>
            <!-- .nav -->
        </div>
        <!-- .navigation-section -->
    </div>
    <!-- .container -->
</section>
<!-- header_section_wrapper -->


<section id="category_section" class="category_section">
    <div class="container">
        <div class="row">

            <div class="col-md-12">
                <div class="category_section mobile">
                    <div class="article_title header_purple">
                        <h2><a href="" target="_self">eBook คู่มือสอบตำรวจ</a></h2>
                    </div><br>

                    <div class="category_article_wrapper">
                        <br>
                      <!--  เว็บไซต์นี้อยู่ระหว่างปรับปรุงเนื้อหา, ขออภัยที่ไม่ได้รับความสะดวกในการใช้งานครับ -->
<!--                    <p class="divider"><a href="#">More eBook&nbsp;&raquo;</a></p> -->

                <asp:SqlDataSource ID="sqlDP" runat="server" ConnectionString="<%$ ConnectionStrings:cdas_conn %>"
                    SelectCommand="SELECT file_id,[title],[author],[isbn],[thumbnail],[filename] FROM [ebook]"  >
                </asp:SqlDataSource>
                </div>
            </div>

        </div>
        <!-- Row -->

    </div>
    <!-- Container -->

</section>
<!-- Category News Section -->

<section id="footer_section" class="footer_section">
    <div class="footer_bottom_Section">
        <div class="container">
            <div class="row">
                <div class="footer">
                    <div class="col-sm-3">
                        <div class="social">
                            <a class="icons-sm fb-ic"><i class="fa fa-facebook"></i></a>
                            <!--Twitter-->
                            <a class="icons-sm tw-ic"><i class="fa fa-twitter"></i></a>
                            <!--Google +-->
                            <a class="icons-sm inst-ic"><i class="fa fa-instagram"> </i></a>
                            <!--Linkedin-->
                            <a class="icons-sm tmb-ic"><i class="fa fa-tumblr"> </i></a>
                            <!--Pinterest-->
                            <a class="icons-sm rss-ic"><i class="fa fa-rss"> </i></a>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <p>&copy; Copyright : <a href="#">LMS POLICE</a> </p>
                    </div>
                    <div class="col-sm-3">
                        <p>กองบัญชาการศึกษาสํานักงานตํารวจแห่งชาติ</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</div>
<!-- #content-wrapper -->

</div>
<!-- .offcanvas-pusher -->

<a href="#" class="crunchify-top"><i class="fa fa-angle-up" aria-hidden="true"></i></a>

<div class="uc-mobile-menu uc-mobile-menu-effect">
    <button type="button" class="close" aria-hidden="true" data-toggle="offcanvas"
    id="uc-mobile-menu-close-btn">&times;</button>
    <div>
        <div>
            <ul id="menu">
                <li class="active"><a href="blog.html">News</a></li>
                <li><a href="category.html">Mobile</a></li>
                <li><a href="blog.html">Tablet</a></li>
                <li><a href="category.html">Gadgets</a></li>
                <li><a href="blog.html">Camera</a></li>
                <li><a href="category.html">Design</a></li>
                <li class="dropdown m-menu-fw"><a href="#" data-toggle="dropdown" class="dropdown-toggle">More
                    <span><i class="fa fa-angle-down"></i></span></a>
                    <ul class="dropdown-menu">
                        <li>
                            <div class="m-menu-content">
                                <ul class="col-sm-3">
                                    <li class="dropdown-header">Widget Haeder</li>
                                    <li><a href="#">Awesome Features</a></li>
                                    <li><a href="#">Clean Interface</a></li>
                                    <li><a href="#">Available Possibilities</a></li>
                                    <li><a href="#">Responsive Design</a></li>
                                    <li><a href="#">Pixel Perfect Graphics</a></li>
                                </ul>
                                <ul class="col-sm-3">
                                    <li class="dropdown-header">Widget Haeder</li>
                                    <li><a href="#">Awesome Features</a></li>
                                    <li><a href="#">Clean Interface</a></li>
                                    <li><a href="#">Available Possibilities</a></li>
                                    <li><a href="#">Responsive Design</a></li>
                                    <li><a href="#">Pixel Perfect Graphics</a></li>
                                </ul>
                                <ul class="col-sm-3">
                                    <li class="dropdown-header">Widget Haeder</li>
                                    <li><a href="#">Awesome Features</a></li>
                                    <li><a href="#">Clean Interface</a></li>
                                    <li><a href="#">Available Possibilities</a></li>
                                    <li><a href="#">Responsive Design</a></li>
                                    <li><a href="#">Pixel Perfect Graphics</a></li>
                                </ul>
                                <ul class="col-sm-3">
                                    <li class="dropdown-header">Widget Haeder</li>
                                    <li><a href="#">Awesome Features</a></li>
                                    <li><a href="#">Clean Interface</a></li>
                                    <li><a href="#">Available Possibilities</a></li>
                                    <li><a href="#">Responsive Design</a></li>
                                    <li><a href="#">Pixel Perfect Graphics</a></li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>
<!-- .uc-mobile-menu -->

</div>
<!-- #main-wrapper -->


</body>
</html>
