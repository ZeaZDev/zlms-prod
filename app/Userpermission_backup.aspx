<%@ Page Language="C#" MasterPageFile="~/Police.Master" AutoEventWireup="true" CodeBehind="Userpermission.aspx.cs" Inherits="newweb.Userpermission" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="body" runat="server">

    <script type="text/javascript">
        function forEdit(id) {
            $('#txtUser').html(id);
            setSession("mnUser", id);
        }


        function setSession(ss, v) {
            var args = {
                ssname: ss, val: v
            }
            $.ajax({
                type: "POST",
                url: "Userpermission.aspx/SetSession",
                data: JSON.stringify(args),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function () {
                    //   alert('Success.');
                },
                error: function () {
                    alert("Fail");
                }
            })
        };
    </script>
        <div class="messagealert" id="alert_container">
    </div>
    <link href="Content/mydatagrid.css" rel="stylesheet" />
    <div class="panel panel-default" style="margin-left: auto; margin-right: auto;">
        <!-- Default panel contents -->
        <div class="panel-heading">
        <a role="button" class="btn btn-default btn-lg show-modal" data-controls-modal="mdAdd" data-toggle="modal"   href="#mdAdd" >
      <%--  <button class="btn btn-primary btn-lg" data-backdrop="static" data-keyboard="false" data-target="#mdAdd" data-toggle="modal">--%>

          <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Add
        </a>
        </div>
        <div class="panel-body">
            <table id="tbOperator" style="text-align: center">
                <tr>
                    <td style="vertical-align: top; margin: 20px">
                        <asp:GridView ID="gvUser" runat="server" AutoGenerateColumns="False" Font-Size="Medium"
                            class="table table-striped table-hover " Width="550px" AllowPaging="True" AllowSorting="True" DataKeyNames="username" OnRowDataBound="OnRowDataBound" OnSelectedIndexChanged="gvUser_SelectedIndexChanged" DataSourceID="sqlUser" PageSize="20" BackColor="White" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" CellPadding="3">
                            <Columns>

                                <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" />
                                <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
                                <asp:BoundField DataField="Rank" HeaderText="Rank" SortExpression="Rank" />
                                <asp:TemplateField HeaderText="Account Disable">
                                    <ItemTemplate>
                                   <asp:Label ID="LblID" runat="server" Text='<%# Eval("Active")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Action" HeaderStyle-ForeColor="White">
                                    <ItemTemplate>

                                        <asp:LinkButton runat="server" ID="EditButton" class="btn btn-warning btn-circle btn-sm"  CommandArgument='<%# Eval("ID") %>' OnClick="Button1_Click">
                                            <i class="fa fa-pencil" aria-hidden="true"></i>
                                        </asp:LinkButton>


                                    </ItemTemplate>

                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Password">
                                    <ItemTemplate>
                                   <%--   <a role="button" data-toggle="modal" href="#mdChangepass" onclick="$('#txtUser').html('<%# Eval("NAME")  %>');return false;" aria-expanded="false" aria-controls="collapseExample">change--%>
                                    <a role="button" data-toggle="modal" href="#mdChangepass" onclick="forEdit('<%# Eval("username") %>')" aria-expanded="false" aria-controls="collapseExample">change</a>
                                           </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Authority" ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" Text="Edit"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>

                            <FooterStyle BackColor="White" ForeColor="#000066" />
                            <HeaderStyle Font-Size="Small" BackColor="#006699" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                            <RowStyle Font-Size="Small" ForeColor="#000066" />


                        </asp:GridView>

                       <asp:SqlDataSource ID="sqlUser" runat="server" ConnectionString="<%$ ConnectionStrings:cdas_conn %>" SelectCommand="SELECT ID,username,NAME,Rank,Active FROM [Member]"></asp:SqlDataSource>

                    </td>
                    <td style="vertical-align: top; margin-left: 30px">
                        <asp:SqlDataSource ID="sqlDetail" runat="server" ConnectionString="<%$ ConnectionStrings:cdas_conn %>"
                            SelectCommand="SELECT * FROM [Member] WHERE ([username] = @username)"
                            UpdateCommand="UPDATE [Member] SET EMAIL=@EMAIL,Active=@Active WHERE ([username] = @username)" DeleteCommand="Delete [Member] WHERE ([username] = @username)" >
                            <SelectParameters>
                                <asp:ControlParameter ControlID="gvUser" Name="username" PropertyName="SelectedValue"
                                    Type="String" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="username" />
                                <asp:Parameter Name="NAME" />
                                <asp:Parameter Name="Rank" />
                                <asp:Parameter Name="Active" />
                            </UpdateParameters>
                            <DeleteParameters>
                                 <asp:Parameter Name="username" />
                                <asp:Parameter Name="NAME" />
                            </DeleteParameters>
                        </asp:SqlDataSource>
                        <asp:DetailsView ID="dtvUser" runat="server" Height="50px" Width="250px" class="table table-striped table-hover" OnItemUpdated="dtvUser_ItemUpdated"  OnItemDeleted="dtvUser_ItemUpdated1"  DataSourceID="sqlDetail" AutoGenerateRows="False" DataKeyNames="username" CellPadding="4" ForeColor="#333333" GridLines="None" CellSpacing="5" BorderStyle="Ridge" BorderWidth="1px">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                            <EditRowStyle BackColor="#999999" />
                            <FieldHeaderStyle Font-Size="Small" BackColor="#E9ECF1" Font-Bold="True" />
                            <Fields>
                                <asp:CommandField ShowEditButton="True" />
                                 <asp:CommandField ShowDeleteButton="True" />
                                <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" />
                                <asp:BoundField DataField="NAME" HeaderText="NAME" ReadOnly="True" SortExpression="NAME" />
                                <asp:CheckBoxField DataField="Active" HeaderText="ACC Enable" SortExpression="Active" />
                                <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
                            </Fields>
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        </asp:DetailsView>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class="modal fade" id="mdChangepass" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">แก้ไขรหัสผ่าน</h4>
                    <h2 id="txtUser">
                    </h2>
                </div>
                <div class="modal-body">
                    <p>
                        <input type="password" class="form-control" id="txtNewPass" placeholder="Password" runat="server">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">ยกเลิก</button>
                    <asp:Button ID="bnSave" class="btn btn-primary" runat="server" Text="บันทึก" OnClick="bnSave_Click" />
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->




</asp:Content>
