<%@ Page Language="C#" MasterPageFile="~/Police.Master" AutoEventWireup="true" CodeBehind="asset.aspx.cs" Inherits="newweb.USER_QA.asset" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <link href="Content/mydatagrid.css" rel="stylesheet" />
    <div class="panel panel-info" style="max-width: 1200px; margin-left: auto; margin-right: auto;">
        <nav class="navbar navbar-default">

            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <a class="navbar-brand" href="#">QA Report</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                    </li>
                </ul>
            </div>
        </nav>
        <div id="rpBody" class="panel-body" runat="server">
                <asp:GridView ID="gvDP" runat="server" class="table table-striped" AutoGenerateColumns="False" DataSourceID="sqlDP"  ShowFooter="true" OnPreRender="gv1_PreRender" >
                    <Columns>
                        
                        
                        <asp:BoundField DataField="indicator" HeaderText="กลุ่มตัวบ่งชี้" />  
                        <asp:BoundField DataField="qa_standard" HeaderText="ด้าน" />  
                        <asp:TemplateField HeaderText="ตัวบ่งชี้" >
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Standard_detail") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>    
                        <asp:TemplateField HeaderText="Activities detail" >
                            <ItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Score") %>'></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>   
                         <asp:TemplateField HeaderText="" visible="false">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>                                     
                    </Columns>
                </asp:GridView>
            </div>
            <div id="rpFooter" class="panel-footer" style="text-align: center" runat="server">
              
                <asp:SqlDataSource ID="sqlDP" runat="server" ConnectionString="<%$ ConnectionStrings:cdas_conn %>"
                    SelectCommand="SELECT  qd.id,qi.projectid,qi.indicator,qsd.qa_standard,qd.Standard_detail,qd.Weight,qr.Score,qd.Weight*qr.Score as multiple FROM QA_standard_detail qd  left join [QA_result1] qr on qr.standard_detail_id=qd.id 
left join QA_standard qsd on qsd.id=qd.Standardid left join QA_Indicator qi on qi.id=qsd.qaindicator left join QA_project qp on qp.id=qr.projectid where qi.projectid=@projectid"  >
                   <SelectParameters>
                         <asp:QueryStringParameter Name="projectid" QueryStringField="projectid" />
                   </SelectParameters>
                </asp:SqlDataSource>
                <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
            </div>
    </div>  
</asp:Content>