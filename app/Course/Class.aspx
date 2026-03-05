<%@ Page Language="C#" MasterPageFile="~/Police.Master" AutoEventWireup="true" CodeBehind="Class.aspx.cs" Inherits="newweb.Course.Class" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">

         function openModal() {
             $('#mdAdd').modal({ show: true });
         };
    </script>
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="body" runat="server">
     <div class="page-bar">

      <ul class="page-breadcrumb">
        <li>
           <a href="<%= ResolveUrl("~/default.aspx") %>">หน้าหลัก</a>
           <i class="fa fa-circle"></i>
       </li>
         <li>
           <a href="<%= ResolveUrl("~/Course/") %>">หลักสูตร</a>
           <i class="fa fa-circle"></i>
       </li>
         <li>
           <asp:HyperLink id="hyperlink1"
                  NavigateUrl="#"
                  Text="หมวดวิชา"
                  runat="server"/>
           <i class="fa fa-circle"></i>
       </li>


       <li>
           <span>รายละเอียด</span>
       </li>
     </ul>
         </div>
     <br />
   <div class="row">
       <div class="col-md-12">
           <div class="portlet box green">
           <div class="portlet-title">
               <div class="caption">
                    <i class="fa fa-cogs"></i>หมวดวิชา
               </div>
               <div class="tools">

                </div>
           </div>
           <div class="portlet-body">
               <div class="row">
                    <div class="col-md-8 ">
                        <div class="col-sm-2"><span class="pull-right">ชื่อ</span></div>
                        <div class="col-sm-6">
                            <span class="pull-left">
                                <asp:Label ID="Name" runat="server" Text="Label"></asp:Label>
                            </span>
                        </div>
                        <div class="col-sm-4"></div>
                    </div>
                   <div class="col-md-4">
                    </div>
                   <div class="col-md-8 ">
                          <div class="col-sm-2"><span class="pull-right">รายละเอียด</span></div>
                        <div class="col-sm-6">
                            <span class="pull-left">
                                <asp:Label ID="Desp" runat="server" Text="Label"></asp:Label>
                            </span>
                        </div>
                        <div class="col-sm-4"></div>
                    </div>
                   <div class="col-md-4">

                    </div>
                   <div class="col-md-8 ">
                        <div class="col-sm-2"><span class="pull-right">หลักสูตร</span></div>
                        <div class="col-sm-6">
                            <span class="pull-left">
                                <asp:Label ID="Course_name" runat="server" Text="Label"></asp:Label>
                            </span>
                        </div>
                        <div class="col-sm-4"></div>
                    </div>
                   <div class="col-md-4">
                    </div>
               </div>
            </div>
        </div>
        </div>
       <div class="col-md-12">
       <!-- BEGIN SAMPLE TABLE PORTLET-->
       <div class="portlet box green">
           <div class="portlet-title">
               <div class="caption">
                    <i class="fa fa-cogs"></i>รายวิชา ของ <asp:Label ID="Coursename" runat="server" Text="Label"></asp:Label>
               </div>
               <div class="tools">
                    <a  class="" data-controls-modal="mdAdd" data-toggle="modal"   href="#mdAdd" >
                        <i class="fa fa-plus"> </i> <span>เพิ่มรายวิชา</span>
                     </a>
                </div>
           </div>
           <div class="portlet-body">
             <div class="table-responsive">
              <asp:GridView ID="gvDP" runat="server" class="table table-striped" AutoGenerateColumns="False" DataSourceID="sqlDP"  AllowPaging="True" AllowSorting="True" ShowFooter="false" PageSize="20" BackColor="White" BorderColor="White" BorderStyle="None" BorderWidth="0px" CellPadding="3" HeaderStyle-BackColor="#006699">
                    <Columns>
                        <asp:TemplateField HeaderText="รหัสวิชา : ชื่อวิชา" HeaderStyle-ForeColor="White">
                            <ItemTemplate>
                                 <asp:HyperLink ID="lnk" runat="server" Target="_self" Text='<%# Eval("PeriodName") %>'
                                            NavigateUrl='<%# "period.aspx?ID=" +Eval("ID") %>'></asp:HyperLink>
                                            &nbsp;:&nbsp;
                                            <asp:HyperLink ID="lnk2" runat="server" Target="_self" Text='<%# Eval("PeriodDesp") %>'
                                                       NavigateUrl='<%# "period.aspx?ID=" +Eval("ID") %>'></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Name" HeaderText="ผู้สอน" SortExpression="UserID" HeaderStyle-ForeColor="White"/>
                        <asp:BoundField DataField="UserID" HeaderText="ผู้เรียน" HeaderStyle-ForeColor="White"/>
                        <asp:TemplateField HeaderText="จัดการ" HeaderStyle-ForeColor="White">
                            <ItemTemplate>

                                <asp:LinkButton runat="server" ID="EditButton" class="btn btn-warning btn-circle btn-sm"  CommandArgument='<%# Eval("ID") %>' OnClick="Button1_Click">
                                    <i class="fa fa-pencil" aria-hidden="true"></i>
                                </asp:LinkButton>

                                <asp:LinkButton runat="server"  ID="DeclineButton" class="btn btn-danger btn-circle btn-sm"  OnClientClick="return confirm('Are you sure you want to delete this period?');" CommandArgument='<%# Eval("ID") %>' OnClick="Button2_Click">
                                    <i class="fa fa-trash" aria-hidden="true"></i>
                                </asp:LinkButton>

                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
              </div>
           </div>
           <asp:SqlDataSource ID="sqlDP" runat="server" ConnectionString="<%$ ConnectionStrings:cdas_conn %>"
                    SelectCommand="SELECT c.ID,[PeriodName],[PeriodDesp],[userid],m.Name FROM [Period] c inner join  Member m on m.id=c.userid where C.ClassID=@ClassID and c.active='1' "  >
                <SelectParameters>
                         <asp:QueryStringParameter Name="ClassID" QueryStringField="ClassID" />
                   </SelectParameters>
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
                    <h4 class="modal-title">เพิ่มรายวิชา</h4>
                     <h2 id="txtFname">
                        <label for="fullname">รหัส</label>
                        <input type="text" class="form-control" id="txtNName" name ="txtNName" placeholder="" runat="server">
                    </h2>
                     <h2 id="H3">
                        <label for="newuser">ชื่อ</label>
                        <input type="text" class="form-control" id="txtFullname" name="txtFullname"  runat="server">
                    </h2>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <asp:Button ID="bnAdduser" class="btn btn-primary"   runat="server" Text="Add" OnClick="bnAdduser_Click" />

                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
</asp:Content>
