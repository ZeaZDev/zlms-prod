<%@ Page Language="C#" MasterPageFile="~/Police.Master" AutoEventWireup="true" CodeBehind="ViewCertificate.aspx.cs" Inherits="newweb.Certificate.ViewCertificate" %>

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
           <a href="<%= ResolveUrl("~/Certificate/") %>">Certificate</a>
           <i class="fa fa-circle"></i>
       </li>
       <li>
           <span>User Certificate</span>
       </li>
     </ul>
         </div>
     <br />
   <div class="row">
       <div class="col-md-12"> 
           <div class="portlet box green">
           <div class="portlet-title">
               <div class="caption">
                    <i class="fa fa-cogs"></i>รายละเอียดหลักสูตร
               </div>
               <div class="tools">
                    
                </div>
           </div>
           <div class="portlet-body">
               <div class="row">
                    <div class="col-md-12">       
                     <div class="col-md-8">               
                        <div class="col-sm-2"><span class="pull-right">Name</span></div>
                        <div class="col-sm-6">
                            <span class="pull-left">
                                <asp:Label ID="Name" runat="server" Text="Label"></asp:Label>
                            </span>
                        </div>
                        <div class="col-sm-4"></div>
                      </div>
                      <div class="col-md-4"> </div>   
                   </div>
                   <div class="col-md-12"> 
                      <div class="col-md-8">       
                          <div class="col-sm-2"><span class="pull-right">Description</span></div>
                        <div class="col-sm-6">
                            <span class="pull-left">
                                <asp:Label ID="Desp" runat="server" Text="Label"></asp:Label>
                            </span>
                        </div>
                        <div class="col-sm-4"></div>                      
                        </div>
                      <div class="col-md-4"> </div>   
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
                    <i class="fa fa-cogs"></i>รายละเอียดของผู้ใช้หลักสูตรที่ผ่าน
               </div>
               <div class="tools">
                 
                </div>
           </div>
           <div class="portlet-body">
             <div class="table-responsive">
              <asp:GridView ID="gvDP" runat="server" class="table table-striped" AutoGenerateColumns="False" DataSourceID="sqlDP"  AllowPaging="True" AllowSorting="True" ShowFooter="false" PageSize="20" BackColor="White" BorderColor="White" BorderStyle="None" BorderWidth="0px" CellPadding="3" HeaderStyle-BackColor="#006699">
                    <Columns>         
                             
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="UserID" HeaderStyle-ForeColor="White"/>
                        <asp:TemplateField HeaderText="Action" HeaderStyle-ForeColor="White">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="EditButton" class="btn btn-success btn-circle btn-sm"  CommandArgument='<%# Eval("userid") %>' OnClick="Button1_Click">
                                    <i class="fa fa-search" aria-hidden="true"></i>
                                </asp:LinkButton>

                            </ItemTemplate>
                        </asp:TemplateField> 
                         <asp:BoundField DataField="Ispass" HeaderText="Pass Course"  HeaderStyle-ForeColor="White"/>  
                         <asp:BoundField DataField="Score" HeaderText="Score" HeaderStyle-ForeColor="White"/>  
                        <asp:BoundField DataField="vavg" HeaderText="Mean"  HeaderStyle-ForeColor="White"/>  
                         <asp:BoundField DataField="CourseName" HeaderText="Course Name" SortExpression="CourseName" HeaderStyle-ForeColor="White"/>    
                        <asp:BoundField DataField="Createdate" HeaderText="Date Attend" HeaderStyle-ForeColor="White"/>                                       
                    </Columns>
                </asp:GridView>      
              </div>                    
           </div>
           <asp:SqlDataSource ID="sqlDP" runat="server" ConnectionString="<%$ ConnectionStrings:cdas_conn %>"
                    SelectCommand="SELECT mc.userid,m.Name,c.CourseName,mc.Createdate,mc.[Ispass],mc.[Score],vavg  = AVG(Score) OVER (PARTITION BY [courseid])   FROM [POLICE_LMS].[dbo].[Member_course] mc   inner join Member m on m.id=mc.userid   inner join Course c on c.id=mc.courseid and  c.active='1' where mc.courseid=@CourseID order by mc.score DESC"  >
                <SelectParameters>
                         <asp:QueryStringParameter Name="CourseID" QueryStringField="CourseID" />                      
                   </SelectParameters>
                </asp:SqlDataSource>
       </div>                             
        <!-- END SAMPLE TABLE PORTLET-->                      
        </div>
</asp:Content>