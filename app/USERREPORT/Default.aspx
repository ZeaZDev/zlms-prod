<%@ Page Language="C#" MasterPageFile="~/Police.Master"  AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="newweb.USERREPORT.Default" %>

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
                    <i class="fa fa-cogs"></i>รายงานหลักสูตร
               </div>
               <div class="tools">
                    
                </div>
           </div>
           <div class="portlet-body">
             <div class="table-responsive">
              <asp:GridView ID="gvDP" runat="server" class="table table-striped" AutoGenerateColumns="False" DataSourceID="sqlDP"  ShowFooter="false" >
                    <Columns>
                        <asp:TemplateField HeaderText="หลักสูตร">
                            <ItemTemplate>
                                 <asp:HyperLink ID="lnk" runat="server" Target="_self" Text='<%# Eval("CourseName") %>'
                                            NavigateUrl='<%# "Reportdetail.aspx?ID=" +Eval("ID") %>'></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>                        
                        <asp:BoundField DataField="Name" HeaderText="ผู้สอน" SortExpression="UserID" />
                        <asp:BoundField DataField="UserID" HeaderText="ผู้เรียน" />  
                          <asp:TemplateField>
                            <ItemTemplate>
                                  <asp:LinkButton runat="server" ID="LinkButton2" class="btn btn-success btn-circle btn-sm"  CommandArgument='<%# Eval("ID") %>' OnClick="Button1_Click">
                                    <i class="fa fa-search" aria-hidden="true"></i>
                                </asp:LinkButton>
 
                            
                            </ItemTemplate>
                        </asp:TemplateField>                       
                    </Columns>
                   <HeaderStyle Font-Size="Small" BackColor="#006699" Font-Bold="True" ForeColor="White" />
                </asp:GridView>      
              </div>                    
           </div>
           <asp:SqlDataSource ID="sqlDP" runat="server" ConnectionString="<%$ ConnectionStrings:cdas_conn %>"
                    SelectCommand="SELECT c.ID,[CourseName],[CourseDesp],[UserID],m.Name FROM [Course] c inner join  Member m on m.id=c.userid where c.Active='1'"  >
                </asp:SqlDataSource>
       </div>                             
        <!-- END SAMPLE TABLE PORTLET-->                      
        </div>
    </div>

</asp:Content>