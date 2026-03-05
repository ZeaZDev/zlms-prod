<%@ Page Language="C#" MasterPageFile="~/Police.Master"  AutoEventWireup="true" CodeBehind="user_report.aspx.cs" Inherits="newweb.USERREPORT.user_report" %>

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
                    <i class="fa fa-cogs"></i>User Report
               </div>
               <div class="tools">
                    
                </div>
           </div>
           <div class="portlet-body">
             <div class="table-responsive">
              <asp:GridView ID="gvDP" runat="server" class="table table-striped" AutoGenerateColumns="False" DataSourceID="sqlDP"  ShowFooter="false" >
                    <Columns>
                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                 <asp:HyperLink ID="lnk" runat="server" Target="_self" Text='<%# Eval("Name") %>'
                                            NavigateUrl='<%# "View_userreport.aspx?ID=" +Eval("ID") %>'></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>                        
                        
                        <asp:BoundField DataField="Createdate" HeaderText="Date" />  
                                           
                    </Columns>
                   <HeaderStyle Font-Size="Small" BackColor="#006699" Font-Bold="True" ForeColor="White" />
                </asp:GridView>      
              </div>                    
           </div>
           <asp:SqlDataSource ID="sqlDP" runat="server" ConnectionString="<%$ ConnectionStrings:cdas_conn %>"
                    SelectCommand="SELECT ID,[Name],Createdate FROM [Member] where Active='1'"  >
                </asp:SqlDataSource>
       </div>                             
        <!-- END SAMPLE TABLE PORTLET-->                      
        </div>
    </div>

</asp:Content>