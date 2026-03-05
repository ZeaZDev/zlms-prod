<%@ Page Language="C#"  MasterPageFile="~/Police.Master"  AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="newweb.Course.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">

         function openModal() {
             $('#mdAdd').modal({ show: true });
         };
    </script>
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="body" runat="server">
     <script type="text/javascript">

         $(function () {
             var dateFormat = "dd-mm-yy",
               from = $(".dtfrom")
                 .datepicker({
                     defaultDate: "+1w",
                     showOn: "button",
                     buttonImage: "Images/calendar.png",
                     buttonImageOnly: true,
                     buttonText: "Select date",
                     changeMonth: true,
                     changeYear: true,
                     dateFormat: "dd-mm-yy"
                 })
                 .on("change", function () {
                     to.datepicker("option", "minDate", getDate(this));
                 }),
               to = $(".dtto").datepicker({
                   defaultDate: "+1w",
                   showOn: "button",
                   buttonImage: "Images/calendar.png",
                   buttonImageOnly: true,
                   buttonText: "Select date",
                   changeMonth: true,
                   changeYear: true,
                   dateFormat: "dd-mm-yy"
               })
               .on("change", function () {
                   from.datepicker("option", "maxDate", getDate(this));
               });

             function getDate(element) {
                 var date;
                 try {
                     date = $.datepicker.parseDate(dateFormat, element.value);
                 } catch (error) {
                     date = null;
                 }

                 return date;
             }
         });
    </script>
     <div class="page-bar">

      <ul class="page-breadcrumb">
        <li>
           <a href="<%= ResolveUrl("~/default.aspx") %>">Home</a>
           <i class="fa fa-circle"></i>
       </li>
       <li>
           <span>Course</span>
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
                    <i class="fa fa-cogs"></i>รายชื่อหลักสูตร
               </div>
               <div class="tools">
                    <a  class="" data-controls-modal="mdAdd" data-toggle="modal"   href="#mdAdd" >
                        <i class="fa fa-plus"> </i> <span>สร้างหลักสูตร</span>
                     </a>
                </div>
           </div>
           <div class="portlet-body">
             <div class="table-responsive">
              <asp:GridView ID="gvDP" runat="server" class="table table-striped" AutoGenerateColumns="False" DataSourceID="sqlDP"  ShowFooter="false" >
                    <Columns>
                        <asp:TemplateField HeaderText="หลักสูตร">
                            <ItemTemplate>
                                 <asp:HyperLink ID="lnk" runat="server" Target="_self" Text='<%# Eval("CourseName") %>'
                                            NavigateUrl='<%# "Coursedetail.aspx?ID=" +Eval("ID") %>'></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Name" HeaderText="ผู้สอน" SortExpression="UserID" />
                        <asp:BoundField DataField="UserID" HeaderText="ผู้เรียน" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                  <asp:LinkButton runat="server" ID="LinkButton2" class="btn btn-success btn-circle btn-sm"  CommandArgument='<%# Eval("ID") %>' OnClick="Button4_Click">
                                    <i class="fa fa-user" aria-hidden="true"></i>
                                </asp:LinkButton>
                                 <asp:LinkButton runat="server" ID="LinkButton1" class="btn btn-info btn-circle btn-sm"  CommandArgument='<%# Eval("ID") %>' OnClick="Button3_Click">
                                    <i class="fa fa-calendar" aria-hidden="true"></i>
                                </asp:LinkButton>
                                <asp:LinkButton runat="server" ID="EditButton" class="btn btn-warning btn-circle btn-sm"  CommandArgument='<%# Eval("ID") %>' OnClick="Button1_Click">
                                    <i class="fa fa-pencil" aria-hidden="true"></i>
                                </asp:LinkButton>

                                <asp:LinkButton runat="server"  ID="DeclineButton" class="btn btn-danger btn-circle btn-sm"  OnClientClick="return confirm('Are you sure you want to delete this event?');" CommandArgument='<%# Eval("ID") %>' OnClick="Button2_Click">
                                    <i class="fa fa-trash" aria-hidden="true"></i>
                                </asp:LinkButton>

                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                   <HeaderStyle Font-Size="Small" BackColor="#006699" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
              </div>
           </div>
           <asp:SqlDataSource ID="sqlDP" runat="server" ConnectionString="<%$ ConnectionStrings:cdas_conn %>"
                    SelectCommand="SELECT c.ID,[CourseName],[CourseDesp],[UserID],m.Name FROM [Course] c inner join  Member m on m.id=c.userid where c.Active='1'"  >
                </asp:SqlDataSource>
       </div>
        <!-- END SAMPLE TABLE PORTLET-->
        </div>
    </div>
     <div id="mdAdd" class="modal fade in" tabindex="-1" role="dialog" >
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">สร้างหลักสูตร</h4>
                     <h2 id="txtFname">
                        <label for="fullname">ชื่อ</label>
                        <input type="text" class="form-control" id="txtNName" name ="txtNName" placeholder="" runat="server">
                    </h2>
                     <h2 id="H3">
                        <label for="newuser">คำอธิบาย</label>
                        <input type="text" class="form-control" id="txtFullname" name="txtFullname"  runat="server">
                    </h2>
                     <h2 id="H1">
                        <label for="newuser"> </label>
                         <div class="input-group input-large date-picker input-daterange" data-date="10/11/2012" data-date-format="mm/dd/yyyy">
                                          <input type="text" class="form-control" id="dtfrom" runat="server">
                                           <span class="input-group-addon"> ถึง </span>
                                           <input type="text" class="form-control" id="dtto" runat="server">

                                        </div>
                    </h2>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">ยกเลิก</button>
                    <asp:Button ID="bnAdduser" class="btn btn-primary"   runat="server" Text="เพิ่ม" OnClick="bnAdduser_Click" />

                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
</asp:Content>
