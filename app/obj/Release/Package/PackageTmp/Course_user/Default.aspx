<%@ Page Language="C#" MasterPageFile="~/Police_user.Master"  AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="newweb.Course_user.Default" %>

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
           <span>Course</span>
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
                    <i class="fa fa-cogs"></i>List of Open courses
               </div>
               <div class="tools">
                  
                </div>
           </div>
           <div class="portlet-body">
             <div class="table-responsive">
              <asp:GridView ID="gvDP" runat="server" class="table table-striped" AutoGenerateColumns="False" DataSourceID="sqlDP"  ShowFooter="false" >
                    <Columns>
           
                        <asp:BoundField DataField="CourseName" HeaderText="Course Name" SortExpression="CourseName" />        
                        <asp:BoundField DataField="Name" HeaderText="Instructor" SortExpression="UserID" />
                        <asp:BoundField DataField="UserID" HeaderText="Student" />  
                        <asp:TemplateField HeaderText="Enroll">
                            <ItemTemplate>
                                 <asp:LinkButton runat="server" ID="LinkButton1" class="btn btn-info btn-circle btn-sm"  CommandArgument='<%# Eval("ID") %>' OnClick="Button3_Click">
                                    <i class="fa fa-calendar" aria-hidden="true"></i>
                                </asp:LinkButton>
                                <asp:LinkButton runat="server" ID="EditButton" class="btn btn-warning btn-circle btn-sm"  CommandArgument='<%# Eval("ID") %>' OnClick="Button1_Click">
                                    <i class="fa fa-exchange" aria-hidden="true"></i>
                                </asp:LinkButton>
                            
                            </ItemTemplate>
                        </asp:TemplateField>                                      
                    </Columns>
                   <HeaderStyle Font-Size="Small" BackColor="#006699" Font-Bold="True" ForeColor="White" />
                </asp:GridView>      
              </div>                    
           </div>
           <asp:SqlDataSource ID="sqlDP" runat="server" ConnectionString="<%$ ConnectionStrings:cdas_conn %>"
                    SelectCommand="SELECT c.ID,[CourseName],[CourseDesp],c.[UserID],m.Name FROM [useringroup] u 
inner join Coursepermission cp on cp.usergroupID=u.usergroupid  inner join Course c on c.id=cp.CourseID and c.Active='1'  inner join  Member m on m.id=c.userid where u.userid=@userid"  >
                <SelectParameters>
                         <asp:QueryStringParameter Name="userid" QueryStringField="userid" />                      
                   </SelectParameters>
                </asp:SqlDataSource>
       </div>                             
        <!-- END SAMPLE TABLE PORTLET-->                      
        </div>
    </div>
   
</asp:Content>