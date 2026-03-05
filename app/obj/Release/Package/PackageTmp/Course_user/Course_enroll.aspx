<%@ Page Language="C#" MasterPageFile="~/Police_user.Master"  AutoEventWireup="true" CodeBehind="Course_enroll.aspx.cs" Inherits="newweb.Course_user.Course_enroll" %>

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
                    <i class="fa fa-cogs"></i>List of courses
               </div>
               <div class="tools">
                    <a  class="" data-controls-modal="mdAdd" data-toggle="modal"   href="#mdAdd" >
                        <i class="fa fa-plus"> </i> <span>Create New</span>
                     </a>
                </div>
           </div>
           <div class="portlet-body">
             <div class="table-responsive">
              <asp:GridView ID="gvDP" runat="server" class="table table-striped" AutoGenerateColumns="False" DataSourceID="sqlDP"  ShowFooter="false" >
                    <Columns>
                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                 <asp:HyperLink ID="lnk" runat="server" Target="_self" Text='<%# Eval("CourseName") %>'
                                            NavigateUrl='<%# "Coursedetail.aspx?ID=" +Eval("ID") %>'></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>                        
                        <asp:BoundField DataField="Name" HeaderText="Instructor" SortExpression="UserID" />
                        <asp:BoundField DataField="UserID" HeaderText="Student" />  
                                                    
                    </Columns>
                   <HeaderStyle Font-Size="Small" BackColor="#006699" Font-Bold="True" ForeColor="White" />
                </asp:GridView>      
              </div>                    
           </div>
           <asp:SqlDataSource ID="sqlDP" runat="server" ConnectionString="<%$ ConnectionStrings:cdas_conn %>"
                    SelectCommand="SELECT c.ID,c.[CourseName],c.[CourseDesp],mm2.Name as UserID,mm.Name  FROM [Member_course] m inner join Course c on c.id=m.courseid and m.Active='1' 
inner join  Member mm on mm.id=c.userid inner join  Member mm2 on mm2.id=m.userid where m.userid=@userid"  >
                <SelectParameters>
                         <asp:QueryStringParameter Name="userid" QueryStringField="userid" />                      
                   </SelectParameters>
                </asp:SqlDataSource>
       </div>                             
        <!-- END SAMPLE TABLE PORTLET-->                      
        </div>
    </div>
   
</asp:Content>
