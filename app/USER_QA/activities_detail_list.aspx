<%@ Page Language="C#" MasterPageFile="~/Police.Master" AutoEventWireup="true" CodeBehind="activities_detail_list.aspx.cs" Inherits="newweb.USER_QA.activities_detail_list" %>

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
           <span>QA Project</span>
       </li>
     </ul>
         </div>
    <br />
   <div class="row">
       <div class="col-md-12"> 
           <div class="portlet box green">
           <div class="portlet-title">
               <div class="caption">
                    <i class="fa fa-cogs"></i>ไฟล์แนบกิจกรรม
               </div>
               <div class="tools">
                   
                </div>
           </div>
           <div class="portlet-body">
               <div class="row">
                   <div class="col-md-12"> 
                    <div class="col-md-8 "> 
                        <div class="col-sm-2"><span class="pull-right">Project Name</span></div>
                        <div class="col-sm-6">
                            <span class="pull-left">
                                <asp:Label ID="Name" runat="server" Text="Label"></asp:Label>
                            </span>
                        </div>
                        <div class="col-sm-4"></div>
                    </div>
                   <div class="col-md-4">                         
                    </div>
                    </div>
                   <div class="col-md-12"> 
                   <div class="col-md-8 "> 
                          <div class="col-sm-2"><span class="pull-right">Activities</span></div>
                        <div class="col-sm-6">
                            <span class="pull-left">
                                <asp:Label ID="Desp" runat="server" Text="Label"></asp:Label>
                            </span>
                        </div>
                        <div class="col-sm-4"></div>                      
                    </div>
                   <div class="col-md-4"> 
                        
                    </div>
                   </div>
                   <div class="col-md-12"> 
                   <div class="col-md-8 "> 
                        <div class="col-sm-2"><span class="pull-right">Activities Detial</span></div>
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
                 
                   <div class="col-md-12"> 
                     <% 
                        string tempLibary =renderdata();
                        Response.Write(tempLibary);
                    %>
                    </div>
                    
               </div>
            </div>
        </div>
        </div>

    </div>
    
</asp:Content>

