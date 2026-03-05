<%@ Page Language="C#" MasterPageFile="~/Police_user.Master" AutoEventWireup="true" CodeBehind="class.aspx.cs" Inherits="newweb.Course_user._class" %>

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
           <asp:HyperLink id="hyperlink1" 
                  NavigateUrl="#"
                  Text="Class"
                  runat="server"/>   
           <i class="fa fa-circle"></i>
       </li> 
           
           
       <li>
           <span>Class Detail</span>
       </li>
     </ul>
         </div>
     <br />
   <div class="row">
       <div class="col-md-12"> 
           <div class="portlet box green">
           <div class="portlet-title">
               <div class="caption">
                    <i class="fa fa-cogs"></i>Details Class
               </div>
               <div class="tools">
                   
                </div>
           </div>
           <div class="portlet-body">
               <div class="row">
                    <div class="col-md-8 "> 
                        <div class="col-sm-2"><span class="pull-right">Name</span></div>
                        <div class="col-sm-6">
                            <span class="pull-left">
                                <asp:Label ID="Name" runat="server" Text="Label"></asp:Label>
                            </span>
                        </div>
                        <div class="col-sm-4"></div>
                    </div>
                   <div class="col-md-4">                         
                    </div>
                   <div class="col-md-8 "> 
                          <div class="col-sm-2"><span class="pull-right">Description</span></div>
                        <div class="col-sm-6">
                            <span class="pull-left">
                                <asp:Label ID="Desp" runat="server" Text="Label"></asp:Label>
                            </span>
                        </div>
                        <div class="col-sm-4"></div>                      
                    </div>
                   <div class="col-md-4"> 
                        
                    </div>
                   <div class="col-md-8 "> 
                        <div class="col-sm-2"><span class="pull-right">Course Name</span></div>
                        <div class="col-sm-6">
                            <span class="pull-left">
                                <asp:Label ID="Course_name" runat="server" Text="Label"></asp:Label>
                            </span>
                        </div>
                        <div class="col-sm-4"></div>
                    </div>
                   <div class="col-md-4">                         
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
                    <i class="fa fa-cogs"></i>Period of <asp:Label ID="Coursename" runat="server" Text="Label"></asp:Label>
               </div>
               <div class="tools">
                    <a  class="" data-controls-modal="mdAdd" data-toggle="modal"   href="#mdAdd" >
                        <i class="fa fa-plus"> </i> <span>Create Period</span>
                     </a>
                </div>
           </div>
           <div class="portlet-body">
             <div class="table-responsive">
              <asp:GridView ID="gvDP" runat="server" class="table table-striped" AutoGenerateColumns="False" DataSourceID="sqlDP"  AllowPaging="True" AllowSorting="True" ShowFooter="false" PageSize="20" BackColor="White" BorderColor="White" BorderStyle="None" BorderWidth="0px" CellPadding="3" HeaderStyle-BackColor="#006699">
                    <Columns>
                        <asp:TemplateField HeaderText="Name" HeaderStyle-ForeColor="White">
                            <ItemTemplate>
                                 <asp:HyperLink ID="lnk" runat="server" Target="_self" Text='<%# Eval("PeriodName") %>'
                                            NavigateUrl='<%# "period.aspx?ID=" +Eval("ID") %>'></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>                        
                        <asp:BoundField DataField="Name" HeaderText="Instructor" SortExpression="UserID" HeaderStyle-ForeColor="White"/>
                        <asp:BoundField DataField="UserID" HeaderText="Student" HeaderStyle-ForeColor="White"/>  
                                                     
                    </Columns>
                </asp:GridView>      
              </div>                    
           </div>
           <asp:SqlDataSource ID="sqlDP" runat="server" ConnectionString="<%$ ConnectionStrings:cdas_conn %>"
                    SelectCommand="SELECT c.ID,[PeriodName],[PeriodDesp],[userid],m.Name FROM [Period] c inner join  Member m on m.id=c.userid where C.ClassID=@ClassID and c.active='1' "  >
                <SelectParameters>
                         <asp:QueryStringParameter Name="ClassID" QueryStringField="ClassID" />                      
                   </SelectParameters>
                </asp:SqlDataSource>
       </div>                             
        <!-- END SAMPLE TABLE PORTLET-->                      
        </div>
    </div>
     
</asp:Content>