<%@ Page Language="C#" MasterPageFile="~/Police.Master" AutoEventWireup="true" CodeBehind="setusercourse.aspx.cs" Inherits="newweb.Course.setusercourse" %>

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
           <span>Set Course User Group</span>
       </li>
     </ul>
         </div>
     <br />
   <div class="row">
       <div class="col-md-12"> 
           <div class="portlet box green">
           <div class="portlet-title">
               <div class="caption">
                    <i class="fa fa-cogs"></i>เพิ่มกลุ่มผู้ใช้
               </div>
               <div class="tools">
                   
                </div>
           </div>
           <div class="portlet-body">
               <div class="row">
                    <div class="col-md-8 "> 
                        <div class="col-sm-2"><span class="pull-right">หลักสูตร</span></div>
                        <div class="col-sm-6">
                            <span class="pull-left">
                                <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
                            </span>
                        </div>
                        <div class="col-sm-4"></div>
                    </div>
                   <div class="col-md-4">                         
                    </div>
                   <div class="col-md-4"> 
                        
                    </div>
                   <div class="col-md-8 "> 
                        <div class="col-sm-2"><span class="pull-right"></span></div>
                        <div class="col-sm-6">
                            <span class="pull-left">
                                <asp:Button ID="Button1" runat="server" Text="เพิ่ม" OnClick="Button1_Click"/>
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
                    <i class="fa fa-cogs"></i>รายชื่อผู้ใช้ในหลักสูตร
               </div>              
           </div>
           <div class="portlet-body">
             <div class="table-responsive">
              <asp:GridView ID="gvDP" runat="server" class="table table-striped" AutoGenerateColumns="False" DataSourceID="sqlDP"  AllowPaging="True" AllowSorting="True" ShowFooter="false" PageSize="20" BackColor="White" BorderColor="White" BorderStyle="None" BorderWidth="0px" CellPadding="3" HeaderStyle-BackColor="#006699">
                    <Columns>

                        <asp:BoundField DataField="UserGroupname" HeaderText="หลักสูตร" HeaderStyle-ForeColor="White"/>  
                        <asp:TemplateField HeaderText=" " HeaderStyle-ForeColor="White">
                            <ItemTemplate>
                                <asp:LinkButton runat="server"  ID="DeclineButton" class="btn btn-danger btn-circle btn-sm"  OnClientClick="return confirm('Are you sure you want to delete this period?');" CommandArgument='<%# Eval("ID") %>' OnClick="Button2_Click">
                                    <i class="fa fa-trash" aria-hidden="true"></i>
                                </asp:LinkButton>
                            
                            </ItemTemplate>
                        </asp:TemplateField>                                      
                    </Columns>
                </asp:GridView>      
              </div>                    
           </div>
           <asp:SqlDataSource ID="sqlDP" runat="server" ConnectionString="<%$ ConnectionStrings:cdas_conn %>"
                    SelectCommand="SELECT c.ID,[usergroupID],[userid],m.UserGroupname FROM [Coursepermission] c inner join  usergroup m on m.id=c.usergroupID where C.CourseID=@CourseID and c.active='1' "  >
                <SelectParameters>
                         <asp:QueryStringParameter Name="CourseID" QueryStringField="CourseID" />                      
                   </SelectParameters>
                </asp:SqlDataSource>
       </div>                             
        <!-- END SAMPLE TABLE PORTLET-->                      
        </div>
    </div>

</asp:Content>