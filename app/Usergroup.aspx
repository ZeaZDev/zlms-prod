<%@ Page Language="C#" MasterPageFile="~/Police.Master" AutoEventWireup="true" CodeBehind="Usergroup.aspx.cs" Inherits="newweb.Usergroup" %>

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
    <script>
        function setModalUpdate(id,parentid,userGN) {
            //alert(id);
            $("#body_txtEdName").val(userGN);
            $("#body_EdDropDownList1").val(parentid);
            $("#body_idUserGroup").val(id);

            return false;
        }
    </script>
   <div class="row">
       <div class="col-md-12">
       <!-- BEGIN SAMPLE TABLE PORTLET-->
       <div class="portlet box green">
           <div class="portlet-title">
               <div class="caption">
                    <i class="fa fa-cogs"></i>กลุ่มผู้ใช้
               </div>
               <div class="tools">
                    <asp:LinkButton runat="server" class="" data-controls-modal="mdAdd" data-toggle="modal"   href="#mdAdd" >
                        <i class="fa fa-plus"> </i> <span>เพิ่มกลุ่มผู้ใช้</span>
                     </asp:LinkButton>
                </div>
           </div>
           <div class="portlet-body">
             <div class="table-responsive">
              <asp:GridView ID="gvDP" runat="server" class="table table-striped" AutoGenerateColumns="False" DataSourceID="sqlDP"  ShowFooter="false" >
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
                        <asp:BoundField DataField="UserGroupname" HeaderText="User Groupname" SortExpression="User Groupname" />
                        <asp:BoundField DataField="Parent" HeaderText="Parent" />
                        <asp:BoundField DataField="Active" HeaderText="Active" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <%--<asp:LinkButton data-controls-modal="mdAdd" data-toggle="modal"  href="#mdUpdate" runat="server"  ID="LinkButton2" class="btn btn-success btn-circle btn-sm"  OnClientClick='<%#String.Format("setModalUpdate({0},{1},{2})", DataBinder.Eval(Container.DataItem, "ID"), DataBinder.Eval(Container.DataItem, "UserGroupname"), DataBinder.Eval(Container.DataItem, "ParentId")) %>' >--%>
                                <asp:LinkButton data-controls-modal="mdAdd" data-toggle="modal"  href="#mdUpdate" runat="server"  ID="LinkButton1" class="btn btn-success btn-circle btn-sm"  OnClientClick=<%#String.Format("setModalUpdate({0},'{2}','{1}')", DataBinder.Eval(Container.DataItem, "ID"), DataBinder.Eval(Container.DataItem, "UserGroupname"), DataBinder.Eval(Container.DataItem, "ParentId")) %> >
                                    <i class="fa fa-edit" aria-hidden="true"></i>
                                </asp:LinkButton>

                                <asp:LinkButton runat="server"  ID="DeclineButton" class="btn btn-danger btn-circle btn-sm"  OnClientClick="return confirm('Are you sure you want to delete this user group?');" CommandArgument='<%# Eval("ID") %>' OnClick="Button2_Click">
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
                    SelectCommand="SELECT c.ID,[UserGroupname],[UserID],(Select d.UserGroupname FROM usergroup d where d.id = c.ParentId and d.Active = 1) AS Parent,[ParentId],C.Active,m.Name FROM [usergroup] c inner join  Member m on m.id=c.userid where c.Active='1'"  >
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
                    <h4 class="modal-title">เพิ่มกลุ่มผู้ใช้</h4>
                     <h2 id="txtFname">
                        <label for="fullname">กลุ่มผู้ใช้</label>
                        <input type="text" class="form-control" id="txtNName" name ="txtNName" placeholder="" runat="server">
                    </h2>
                    <h5 class="modal-title">สังกัด</h5>
                    <%--<asp:DropDownList ID="DropDownList1" runat="server"  ></asp:DropDownList> --%>
                    <asp:DropDownList ID="ParentDDL" runat="server" DataSourceID="ParenDataSource" AppendDataBoundItems="True"
                        DataTextField="UserGroupname" DataValueField="id">
                            <asp:ListItem Text="เลือกสังกัดหลัก" Value="NULL"></asp:ListItem>
                   </asp:DropDownList>

                   <asp:SqlDataSource ID="ParenDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:cdas_conn %>"
                        SelectCommand="SELECT [id], [UserGroupname] FROM [usergroup] WHERE [Active] =1 ORDER BY [id]">
                   </asp:SqlDataSource>
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

    <div id="mdUpdate" class="modal fade in" tabindex="-1" role="dialog" >
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">แก้ไขกลุ่มผู้ใช้</h4>
                     <h2 id="txtEdFname">
                        <label for="fullname">กลุ่มผู้ใช้</label>
                        <input type="text" class="form-control" id="txtEdName" name ="txtEdName" placeholder="Full name" runat="server">
                    </h2>
                    <h5 class="modal-title">สังกัด</h5>
                    <%--<asp:DropDownList ID="DropDownList1" runat="server"  ></asp:DropDownList> --%>
                    <asp:DropDownList ID="EdDropDownList1" Font-Names="EdDropDownList1" runat="server" DataSourceID="ParenDataSourceED" AppendDataBoundItems="True"
                        DataTextField="UserGroupname" DataValueField="id">
                            <asp:ListItem Text="เลือกสังกัดหลัก" Value="NULL"></asp:ListItem>
                   </asp:DropDownList>

                   <asp:SqlDataSource ID="ParenDataSourceED" runat="server" ConnectionString="<%$ ConnectionStrings:cdas_conn %>"
                        SelectCommand="SELECT [id], [UserGroupname] FROM [usergroup] WHERE [Active] =1 ORDER BY [id]">
                   </asp:SqlDataSource>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">ยกเลิก</button>
                    <input runat="server" type="hidden" id="idUserGroup" name="idUserGroup" value="0">
                    <asp:Button ID="ButtonEd" class="btn btn-primary"   runat="server" Text="บันทึก" OnClick="bnEdituser_Click" />

                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
</asp:Content>
