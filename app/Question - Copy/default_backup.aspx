<%@ Page Language="C#" MasterPageFile="~/Police.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="newweb.Question._default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../assets/global/plugins/datatables/datatables.min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css" />

</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="body" runat="server">
     <div class="page-bar">

      <ul class="page-breadcrumb">
        <li>
           <a href="<%= ResolveUrl("~/default.aspx") %>">หน้าหลัก</a>
           <i class="fa fa-circle"></i>
       </li>
       <li>
           <span>ข้อสอบ</span>
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
                    <i class="fa fa-cogs"></i>จัดการข้อสอบ
               </div>
                <div class="tools">
                    <a  class="" data-controls-modal="mdAdd" data-toggle="modal"   href="#mdAdd" >
                        <i class="fa fa-plus"> </i> <span>สร้างใหม่</span>
                     </a>
                </div>
           </div>
           <div class="portlet-body">
             <div class="table-toolbar">
              <asp:GridView ID="gvDP" runat="server" class="table table-striped table-bordered table-hover table-checkable order-column" OnRowDataBound="GridView1_RowDataBound" AutoGenerateColumns="False" DataSourceID="sqlDP"  AllowPaging="True" AllowSorting="True" ShowFooter="false" PageSize="20" BackColor="White" BorderColor="White" BorderStyle="None" BorderWidth="0px" CellPadding="3" HeaderStyle-BackColor="#006699">
                    <Columns>
                         <asp:TemplateField HeaderText="หลักสูตร" ItemStyle-Width="20%">
                            <ItemTemplate>
                                 <asp:HyperLink ID="lnk" runat="server" Target="_self" Text='<%# Eval("CourseName") %>'
                                            NavigateUrl='<%# "Questiondetail.aspx?ID=" +Eval("ID") %>'></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Question_name" HeaderText="ชื่อข้อสอบ" HeaderStyle-ForeColor="White" ItemStyle-Width="20%"/>
                        <asp:BoundField DataField="ClassItemType" HeaderText="รูปแบบ" HeaderStyle-ForeColor="White" ItemStyle-Width="20%"/>
                        <asp:BoundField DataField="questiontypename" HeaderText="ชนิด" HeaderStyle-ForeColor="White" ItemStyle-Width="20%"/>
                        <asp:TemplateField HeaderText="จัดการ" HeaderStyle-ForeColor="White" ItemStyle-Width="20%">
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
                    SelectCommand="SELECT q.ID,c.CourseName,q.Question_name,cty.ClassItemType,qt.questiontypename FROM [Question] q inner join  Course c on c.id=q.Courseid  inner join QuestionType qt on qt.id=q.Question_type inner join ClassItemType cty on cty.id=q.Periodtype where q.active='1'"  >
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
                    <h4 class="modal-title">เพิ่มข้อสอบ </h4>
                     <h2 id="txtFname">
                        <label for="fullname">หัวข้อ</label>
                        <input type="text" class="form-control" id="txtNName" name ="txtNName" placeholder="" runat="server">
                    </h2>
                     <h2 id="H3">
                        <label for="newuser">หลักสูตร</label>
                         <asp:DropDownList class="form-control"  ID="DropDownList4" runat="server"></asp:DropDownList>
                    </h2>
                       <h2 id="H2">
                        <label for="newuser">รูปแบบ</label>
                           <asp:DropDownList class="form-control"  ID="DropDownList3" runat="server"></asp:DropDownList>
                    </h2>
                       <h2 id="H4">
                        <label for="newuser">ชนิด</label>
                           <asp:DropDownList class="form-control"  ID="DropDownList2" runat="server"></asp:DropDownList>
                    </h2>
                     <h2 id="H5">
                        <label for="newuser">เกณฑ์%</label>
                         <asp:DropDownList class="form-control"  ID="DropDownList1" runat="server"></asp:DropDownList>
                    </h2>
                      <h2 id="H1">
                        <label for="newuser">สุ่ม</label>
                          <asp:CheckBox ID="CheckBox1" runat="server" />
                    </h2>
                     <h2 id="H6">
                        <label for="newuser">แสดง</label>
                          <asp:CheckBox ID="CheckBox2" runat="server" />
                    </h2>
                      <h2 id="H7">
                        <label for="newuser">รายงาน</label>
                          <asp:CheckBox ID="CheckBox3" runat="server" />
                    </h2>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">ปิด</button>
                    <asp:Button ID="bnAdduser" class="btn btn-primary"   runat="server" Text="เพิ่ม" OnClick="bnAdduser_Click" />

                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>

        <script src="../assets/global/plugins/datatables/datatables.min.js" type="text/javascript"></script>
        <script src="../assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN THEME GLOBAL SCRIPTS -->
        <script src="../assets/global/scripts/app.min.js" type="text/javascript"></script>
        <!-- END THEME GLOBAL SCRIPTS -->
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script src="../assets/pages/scripts/table-datatables-managed.js" type="text/javascript"></script>
</asp:Content>
