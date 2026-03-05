<%@ Page Language="C#"   AutoEventWireup="true" CodeBehind="SARForm.aspx.cs" Inherits="newweb.USER_QA.SARForm" %>




<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
    <!--<![endif]-->
    <!-- BEGIN HEAD -->

    <head>
        <meta charset="utf-8" />
        <title>(LMS) Police Learning Management System </title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <meta content="Preview page of Metronic Admin Theme #1 for statistics, charts, recent events and reports" name="description" />
        <meta content="" name="author" />
        <!-- BEGIN GLOBAL MANDATORY STYLES -->
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" />
        <link href="<%= ResolveUrl("~/assets/global/plugins/font-awesome/css/font-awesome.min.css") %>" rel="stylesheet" type="text/css" />
        <link href="<%= ResolveUrl("~/assets/global/plugins/simple-line-icons/simple-line-icons.min.css") %>" rel="stylesheet" type="text/css" />
        <link href="<%= ResolveUrl("~/assets/global/plugins/bootstrap/css/bootstrap.min.css") %>" rel="stylesheet" type="text/css" />
        <link href="<%= ResolveUrl("~/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css") %>" rel="stylesheet" type="text/css" />
        <!-- END GLOBAL MANDATORY STYLES -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <link href="<%= ResolveUrl("~/assets/global/plugins/bootstrap-daterangepicker/daterangepicker.min.css") %>" rel="stylesheet" type="text/css" />
        <link href="<%= ResolveUrl("~/assets/global/plugins/morris/morris.css") %>" rel="stylesheet" type="text/css" />
        <link href="<%= ResolveUrl("~/assets/global/plugins/fullcalendar/fullcalendar.min.css") %>" rel="stylesheet" type="text/css" />
        <link href="<%= ResolveUrl("~/assets/global/plugins/jqvmap/jqvmap/jqvmap.css") %>" rel="stylesheet" type="text/css" />

        <link href="<%= ResolveUrl("~/assets/global/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css") %>" rel="stylesheet" type="text/css" />



        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN THEME GLOBAL STYLES -->
        <link href="<%= ResolveUrl("~/assets/global/css/components.min.css") %>" rel="stylesheet" id="style_components" type="text/css" />
        <link href="<%= ResolveUrl("~/assets/global/css/plugins.min.css") %>" rel="stylesheet" type="text/css" />
        <!-- END THEME GLOBAL STYLES -->
        <!-- BEGIN THEME LAYOUT STYLES -->
        <link href="<%= ResolveUrl("~/assets/layouts/layout/css/cdas.css") %>" rel="stylesheet" type="text/css" />
        <link href="<%= ResolveUrl("~/assets/layouts/layout/css/layout.min.css") %>" rel="stylesheet" type="text/css" />
        <link href="<%= ResolveUrl("~/assets/layouts/layout/css/themes/darkblue.min.css") %>" rel="stylesheet" type="text/css" id="style_color" />
        <link href="<%= ResolveUrl("~/assets/layouts/layout/css/custom.min.css") %>" rel="stylesheet" type="text/css" />
        <!-- END THEME LAYOUT STYLES -->
        <link rel="shortcut icon" href="<%= ResolveUrl("~/favicon.ico") %>" />
          <style type="text/css">
              @media screen and (max-width:768px){
th,td { display:block; width:100%; }
  }
        td { white-space: pre-line;}
        </style>
    </head>
    <!-- END HEAD -->

    <body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white">
         <!-- BEGIN CORE PLUGINS -->
        <script src="<%= ResolveUrl("~/assets/layouts/layout/scripts/cdas.js") %>" type="text/javascript"></script>
        <script src="<%= ResolveUrl("~/assets/global/plugins/jquery.min.js") %>"  type="text/javascript"></script>
        <script src="<%= ResolveUrl("~/assets/global/plugins/bootstrap/js/bootstrap.min.js") %>"  type="text/javascript"></script>
        <script src="<%= ResolveUrl("~/assets/global/plugins/js.cookie.min.js") %>"  type="text/javascript"></script>
        <script src="<%= ResolveUrl("~/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js") %>"  type="text/javascript"></script>
        <script src="<%= ResolveUrl("~/assets/global/plugins/jquery.blockui.min.js") %>"  type="text/javascript"></script>
        <script src="<%= ResolveUrl("~/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js") %>"  type="text/javascript"></script>
       


        <form id="Form1" runat="server">
        <div class="page-wrapper">
                  <div class="page-bar"> 
   
      <ul class="page-breadcrumb">
        <li>
           <a href="<%= ResolveUrl("~/default.aspx") %>">Home</a>
           <i class="fa fa-circle"></i>
       </li>
       <li>
           <asp:HyperLink id="hyperlink1" 
                  NavigateUrl="#"
                  Text="QA Fill"
                  runat="server"/>   
           <i class="fa fa-circle"></i>
       </li> 
     </ul>
         </div>
     <br />
    <div class="row">
                            <div class="col-md-12">
                                <!-- BEGIN SAMPLE TABLE PORTLET-->
                                <div class="portlet box green">
                                    <div class="portlet-title">
                                        <div class="caption">
                                            <i class="fa fa-cogs"></i>ตัวบ่งชี้ที่ <asp:Label ID="Label3" runat="server" Text=""></asp:Label> </div>
                                        <div class="tools">
      
                                        </div>
                                    </div>
                                    <div class="portlet-body flip-scroll">
                                        <table class="table table-bordered table-striped table-condensed flip-content">
                                            <thead class="flip-content">
                                                <tr>
                                                    <th width="90%">ผลการดำเนินงาน</th>
                                                    <th width="10%"> ผล SAR</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                 <% 
                                                    string tempLibary =renderdata();
                                                    Response.Write(tempLibary);
                                                %>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                            </div>
                        </div>

        </div>
        </form>

       
        <!-- END CORE PLUGINS -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script src="<%= ResolveUrl("~/assets/global/plugins/moment.min.js") %>"  type="text/javascript"></script>
        <script src="<%= ResolveUrl("~/assets/global/plugins/bootstrap-daterangepicker/daterangepicker.min.js") %>"  type="text/javascript"></script>
        <script src="<%= ResolveUrl("~/assets/global/plugins/morris/morris.min.js") %>"  type="text/javascript"></script>
        
        <script src="<%= ResolveUrl("~/assets/global/plugins/counterup/jquery.waypoints.min.js") %>"  type="text/javascript"></script>
        <script src="<%= ResolveUrl("~/assets/global/plugins/counterup/jquery.counterup.min.js") %>"  type="text/javascript"></script>
       
        <script src="<%= ResolveUrl("~/assets/global/plugins/fullcalendar/fullcalendar.min.js") %>"  type="text/javascript"></script>
        <script src="<%= ResolveUrl("~/assets/global/plugins/horizontal-timeline/horizontal-timeline.js") %>"  type="text/javascript"></script>
     
       
       
        <!-- END PAGE LEVEL PLUGINS -->

        <script src="<%= ResolveUrl("~/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js") %>" type="text/javascript"></script>


        <!-- BEGIN THEME GLOBAL SCRIPTS -->
        <script src="<%= ResolveUrl("~/assets/global/scripts/app.min.js") %>"  type="text/javascript"></script>
        <!-- END THEME GLOBAL SCRIPTS -->
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
         <script src="<%= ResolveUrl("~/assets/pages/scripts/components-date-time-pickers.min.js") %>" type="text/javascript"></script>
        <script src="<%= ResolveUrl("~/assets/pages/scripts/dashboard.min.js") %>"  type="text/javascript"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <!-- BEGIN THEME LAYOUT SCRIPTS -->
        <script src="<%= ResolveUrl("~/assets/layouts/layout/scripts/layout.min.js") %>"  type="text/javascript"></script>
        <script src="<%= ResolveUrl("~/assets/layouts/layout/scripts/demo.min.js") %>"  type="text/javascript"></script>
        <script src="<%= ResolveUrl("~/assets/layouts/global/scripts/quick-sidebar.min.js") %>"  type="text/javascript"></script>
        <script src="<%= ResolveUrl("~/assets/layouts/global/scripts/quick-nav.min.js") %>"  type="text/javascript"></script>



       

        
        <!-- END THEME LAYOUT SCRIPTS -->
    </body>

</html>

