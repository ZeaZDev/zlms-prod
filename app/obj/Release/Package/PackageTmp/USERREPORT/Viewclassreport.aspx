<%@ Page Language="C#" MasterPageFile="~/Police.Master"  AutoEventWireup="true" CodeBehind="Viewclassreport.aspx.cs" Inherits="newweb.USERREPORT.Viewclassreport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="body" runat="server">    
         <div class="page-bar"> 
   
      <ul class="page-breadcrumb">
        <li>
           <a href="<%= ResolveUrl("~/default.aspx") %>">Home</a>
           <i class="fa fa-circle"></i>
       </li>
         <li>
           <a href="<%= ResolveUrl("~/Course/") %>">Course</a>
           <i class="fa fa-circle"></i>
       </li>
       <li>
           <span>Class</span>
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
                    <i class="fa fa-cogs"></i>Detail of user report class
               </div>
               <div class="tools">
                      <asp:Button type="button" class="btn navbar-btn btn btn-success" ID="bnExport" runat="server" Text="Exp Excel" UseSubmitBehavior="False"  OnClick="bnExport_Click1">
                        </asp:Button>
                </div>
           </div>
           <div class="portlet-body">
             <div class="table-responsive">
              <asp:GridView ID="gvDP" runat="server" class="table table-striped" AutoGenerateColumns="False" DataSourceID="sqlDP"  AllowPaging="True" AllowSorting="True" ShowFooter="false" PageSize="20" BackColor="White" BorderColor="White" BorderStyle="None" BorderWidth="0px" CellPadding="3" HeaderStyle-BackColor="#006699">
                    <Columns>    
                         <asp:BoundField DataField="name" HeaderText="Name"  HeaderStyle-ForeColor="White"/>  
                         <asp:BoundField DataField="ClassItemName" HeaderText="Test Name" HeaderStyle-ForeColor="White"/>  
                        <asp:BoundField DataField="ClassItemType" HeaderText="Type"  HeaderStyle-ForeColor="White"/>  
                         <asp:BoundField DataField="Score" HeaderText="Score" SortExpression="CourseName" HeaderStyle-ForeColor="White"/>    
                        <asp:BoundField DataField="TotalScore" HeaderText="ALLScore" HeaderStyle-ForeColor="White"/>         
                        <asp:BoundField DataField="qper" HeaderText="Score %" HeaderStyle-ForeColor="White"/>         
                        <asp:BoundField DataField="QuestionPass" HeaderText="Question Pass" HeaderStyle-ForeColor="White"/>          
                        <asp:BoundField DataField="Createdate" HeaderText="Date" HeaderStyle-ForeColor="White"/>                                 
                    </Columns>
                </asp:GridView>      
              </div>                    
           </div>
           <asp:SqlDataSource ID="sqlDP" runat="server" ConnectionString="<%$ ConnectionStrings:cdas_conn %>"
                    SelectCommand="SELECT m.name,cit.ClassItemName,mq.Score,mq.TotalScore,(mq.Score/mq.TotalScore)*100 as qper,cty.ClassItemType,q.QuestionPass,mq.Createdate  FROM [POLICE_LMS].[dbo].[Class] cls
inner join [Period] p on p.ClassID=cls.id inner join ClassItem cit on cit.PeriodID=p.id inner join Member_Question mq on mq.Questionid=cit.QuestionID
inner join ClassItemType cty on cty.id=cit.ClassitemtypeID inner join member m on m.id=mq.userid inner join Question q on q.id=cit.QuestionID where cls.id=@CourseID order by cty.ClassItemType,mq.Score desc"  >
                <SelectParameters>
                         <asp:QueryStringParameter Name="CourseID" QueryStringField="CourseID" />                      
                   </SelectParameters>
                </asp:SqlDataSource>
       </div>                             
        <!-- END SAMPLE TABLE PORTLET-->                      
        </div>
    </div>
</asp:Content>