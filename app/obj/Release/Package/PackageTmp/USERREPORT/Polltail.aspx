<%@ Page Language="C#" MasterPageFile="~/Police.Master"  AutoEventWireup="true" CodeBehind="Polltail.aspx.cs" Inherits="newweb.USERREPORT.Polltail" %>

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
                    <i class="fa fa-cogs"></i>Detail of class poll
               </div>
               <div class="tools">                     
                </div>
           </div>
           <div class="portlet-body">
             <div class="table-responsive">
              <asp:GridView ID="gvDP" runat="server" class="table table-striped" AutoGenerateColumns="False" DataSourceID="sqlDP"  AllowPaging="True" AllowSorting="True" ShowFooter="false" PageSize="20" BackColor="White" BorderColor="White" BorderStyle="None" BorderWidth="0px" CellPadding="3" HeaderStyle-BackColor="#006699">
                    <Columns>    
                         <asp:BoundField DataField="CourseName" HeaderText="Course Name" HeaderStyle-ForeColor="White"/>  
                         <asp:BoundField DataField="ClassName" HeaderText="Class Name"  HeaderStyle-ForeColor="White"/>  
                         <asp:BoundField DataField="PeriodName" HeaderText="Period Name"  HeaderStyle-ForeColor="White"/>    
                         <asp:BoundField DataField="avgerage" HeaderText="Poll result" HeaderStyle-ForeColor="White"/>         
                                                      
                    </Columns>
                </asp:GridView>      
              </div>                    
           </div>
           <asp:SqlDataSource ID="sqlDP" runat="server" ConnectionString="<%$ ConnectionStrings:cdas_conn %>"
                    SelectCommand="SELECT  c.CourseName,cls.ClassName,p.PeriodName,avg(pp.scorex) as avgerage FROM [POLICE_LMS].[dbo].[Period_poll] pp  inner join [Period] p on p.id=pp.classid 
 inner join Class cls on p.ClassID=cls.id  inner join Course c on c.id=cls.CourseID   where cls.id=@classid group by c.CourseName,cls.ClassName,p.PeriodName order by avgerage desc"  >
                <SelectParameters>
                         <asp:QueryStringParameter Name="classid" QueryStringField="classid" />                      
                   </SelectParameters>
                </asp:SqlDataSource>
       </div>                             
        <!-- END SAMPLE TABLE PORTLET-->                      
        </div>
    </div>
</asp:Content>
