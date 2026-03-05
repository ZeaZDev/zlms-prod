<%@ Page Language="C#" MasterPageFile="~/Police.Master" AutoEventWireup="true" CodeBehind="Viewuserreport.aspx.cs" Inherits="newweb.USERREPORT.Viewuserreport" %>

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
           <a href="<%= ResolveUrl("~/USERREPORT/") %>">Course</a>
           <i class="fa fa-circle"></i>
       </li>
       <li>
           <span>User Report</span>
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
                    <i class="fa fa-cogs"></i>Detail of user attend this course
               </div>
               <div class="tools">
                    
                </div>
           </div>
           <div class="portlet-body">
             <div class="table-responsive">
              <asp:GridView ID="gvDP" runat="server" class="table table-striped" AutoGenerateColumns="False" DataSourceID="sqlDP"  AllowPaging="True" AllowSorting="True" ShowFooter="false" PageSize="20" BackColor="White" BorderColor="White" BorderStyle="None" BorderWidth="0px" CellPadding="3" HeaderStyle-BackColor="#006699">
                    <Columns>         
                             
                       
                         <asp:BoundField DataField="Ispass" HeaderText="Pass Course"  HeaderStyle-ForeColor="White"/>  
                         <asp:BoundField DataField="Score" HeaderText="Score" HeaderStyle-ForeColor="White"/>  
                        <asp:BoundField DataField="Score" HeaderText="Percentile"  HeaderStyle-ForeColor="White"/>  
                         <asp:BoundField DataField="CourseName" HeaderText="Course Name" SortExpression="CourseName" HeaderStyle-ForeColor="White"/>    
                        <asp:BoundField DataField="Createdate" HeaderText="Date Attend" HeaderStyle-ForeColor="White"/>                                       
                    </Columns>
                </asp:GridView>      
              </div>                    
           </div>
           <asp:SqlDataSource ID="sqlDP" runat="server" ConnectionString="<%$ ConnectionStrings:cdas_conn %>"
                    SelectCommand="SELECT mc.userid,m.Name,c.CourseName,mc.Createdate,mc.[Ispass],mc.[Score]  FROM [POLICE_LMS].[dbo].[Member_course] mc   inner join Member m on m.id=mc.userid   inner join Course c on c.id=mc.courseid and  c.active='1' where mc.courseid=@CourseID"  >
                <SelectParameters>
                       <asp:QueryStringParameter Name="userid" QueryStringField="userid" />    
                         <asp:QueryStringParameter Name="CourseID" QueryStringField="CourseID" />                      
                   </SelectParameters>
                </asp:SqlDataSource>
       </div>                             
        <!-- END SAMPLE TABLE PORTLET-->                      
        </div>
    </div>
</asp:Content>