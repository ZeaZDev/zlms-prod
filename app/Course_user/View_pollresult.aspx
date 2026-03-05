<%@ Page Language="C#" MasterPageFile="~/Police_user.Master" AutoEventWireup="true" CodeBehind="View_pollresult.aspx.cs" Inherits="newweb.Course_user.View_pollresult" %>

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
           <span>User Poll</span>
       </li>
     </ul>
         </div>
     <br />

    <div class="row">
                   <div class="col-md-12"> 
                       <div class="portlet box green">
                                    <div class="portlet-title">
                                        <div class="caption">
                                            <i class="fa fa-cogs"></i>ความคิดเห็นเกี่ยวกับความพึงพอใจในการปฏิบัติงานของผู้สำเร็จการศึกษาอบรม </div>
                                        <div class="tools">
                                            
                                        </div>
                                    </div>
                                    <div class="portlet-body flip-scroll">
                        <% 
                        string tempLibary1 =renderdata1();
                        Response.Write(tempLibary1);
                        %>
                            </div>
                        </div>
                    </div>
                  
                </div>
     <div class="row">
    
    </div>
</asp:Content>