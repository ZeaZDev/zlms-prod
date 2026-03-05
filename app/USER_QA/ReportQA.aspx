<%@ Page Language="C#" MasterPageFile="~/Police.Master"  AutoEventWireup="true" CodeBehind="ReportQA.aspx.cs" Inherits="newweb.USER_QA.ReportQA" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="body" runat="server"> 

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
                <asp:GridView ID="gvDP" runat="server" class="table table-striped" AutoGenerateColumns="False" DataSourceID="sqlDP" OnRowDataBound="GridView1_RowDataBound"  >
                    <Columns>
                        
                        <asp:BoundField DataField="Standard_detail" HeaderText="ตัวบ่งชี้" />
                        <asp:BoundField DataField="Standard_detail1" HeaderText="หัวข้อการประเมิณ" />  
                        <asp:BoundField DataField="process" HeaderText="สำเร็จ" SortExpression="process" />  
                        <asp:BoundField DataField="process2" HeaderText="สำเร็จ" SortExpression="process" />  
                        <asp:BoundField DataField="result" HeaderText="สำเร็จ" SortExpression="result" />                                                      
                    </Columns>
                </asp:GridView>
            </div>
            <div id="rpFooter" class="panel-footer" style="text-align: center" runat="server">
              
                <asp:SqlDataSource ID="sqlDP" runat="server" ConnectionString="<%$ ConnectionStrings:cdas_conn %>"
                    SelectCommand="SELECT qsd.Standard_detail,qsdd.Standard_detail as Standard_detail1, CASE   WHEN qmr.id is null THEN  'ไม่พบข้อมูล'  else 'สำเร็จ' END as process,CASE   WHEN qmr1.id is null THEN  'ไม่พบข้อมูล'  else 'สำเร็จ' END as process2, CASE  WHEN  qms.id is null THEN  'ไม่พบข้อมูล'  else 'สำเร็จ' END as result    FROM [QA_standard_detail]qsd 
  inner join  QA_standard_detail_add qsdd on qsdd.Standardid=qsd.id   inner join QA_standard qs on qs.id=qsd.Standardid
  inner join QA_Indicator qi on qs.qaindicator=qi.id  inner join QA_project qp on qp.id=qi.projectid
  left join QA_main_result qmr on qmr.Standardid=qsdd.id  left join QA_main_Second qms on qms.Standardid=qsdd.id   left join QA_main_result1 qmr1 on qmr1.Standardid=qsdd.id where qp.id=@projectid"  >
                   <SelectParameters>
                         <asp:QueryStringParameter Name="projectid" QueryStringField="projectid" />
                   </SelectParameters>
                </asp:SqlDataSource>
               
            </div>
    </div>  
</asp:Content>