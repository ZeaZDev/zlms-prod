<%@ Page Language="C#"  MasterPageFile="~/Police.Master"  AutoEventWireup="true" CodeBehind="Reportdetail.aspx.cs" Inherits="newweb.USERREPORT.Reportdetail" %>

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
           <div class="portlet box green">
           <div class="portlet-title">
               <div class="caption">
                    <i class="fa fa-cogs"></i>Details Course
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
                    <i class="fa fa-cogs"></i>Classes of <asp:Label ID="Coursename" runat="server" Text="Label"></asp:Label>
               </div>
               <div class="tools">
                    
                </div>
           </div>
           <div class="portlet-body">
             <div class="table-responsive">
              <asp:GridView ID="gvDP" runat="server" class="table table-striped" AutoGenerateColumns="False" DataSourceID="sqlDP"  AllowPaging="True" AllowSorting="True" ShowFooter="false" PageSize="20" BackColor="White" BorderColor="White" BorderStyle="None" BorderWidth="0px" CellPadding="3" HeaderStyle-BackColor="#006699">
                    <Columns>
                      <asp:TemplateField HeaderText="Class Name">
                            <ItemTemplate>
                                 <asp:HyperLink ID="lnk" runat="server" Target="_self" Text='<%# Eval("ClassName") %>'
                                            NavigateUrl='<%# "Polltail.aspx?ID=" +Eval("ID") %>'></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>                 
                        <asp:BoundField DataField="Name" HeaderText="Instructor" SortExpression="UserID" HeaderStyle-ForeColor="White"/>
                        <asp:BoundField DataField="UserID" HeaderText="Student" HeaderStyle-ForeColor="White"/>  
                        <asp:TemplateField HeaderText="Action" HeaderStyle-ForeColor="White">
                            <ItemTemplate>

                                <asp:LinkButton runat="server" ID="EditButton" class="btn btn-warning btn-circle btn-sm"  CommandArgument='<%# Eval("ID") %>' OnClick="Button1_Click">
                                    <i class="fa fa-search" aria-hidden="true"></i>
                                </asp:LinkButton>

                              
                            
                            </ItemTemplate>
                        </asp:TemplateField>                                      
                    </Columns>
                </asp:GridView>      
              </div>                    
           </div>
           <asp:SqlDataSource ID="sqlDP" runat="server" ConnectionString="<%$ ConnectionStrings:cdas_conn %>"
                    SelectCommand="SELECT c.ID,[ClassName],[ClasssDesp],[UserID],m.Name FROM [Class] c inner join  Member m on m.id=c.userid where CourseID=@CourseID and c.active='1'"  >
                <SelectParameters>
                         <asp:QueryStringParameter Name="CourseID" QueryStringField="CourseID" />                      
                   </SelectParameters>
                </asp:SqlDataSource>
       </div>                             
        <!-- END SAMPLE TABLE PORTLET-->                      
        </div>
    </div>
    
</asp:Content>