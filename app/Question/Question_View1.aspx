<%@ Page Language="C#" MasterPageFile="~/Police.Master" AutoEventWireup="true" CodeBehind="Question_View1.aspx.cs" Inherits="newweb.Question.Question_View1" %>

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
           <span>Question</span>
       </li>
     </ul>
         </div>
     <br />
     
   <div class="row">       
    </div>
    <div class="row">
       <div class="col-md-12"> 
           <div class="portlet box green">
           <div class="portlet-title">
               <div class="caption">
                    <i class="fa fa-cogs"></i>Question
               </div>
               <div class="tools">
                   
                </div>
           </div>
            <div class="portlet-body">
               <div class="row">
                   <div class="col-md-12"> 
                        <% 
                        string tempLibary1 =renderdata1();
                        Response.Write(tempLibary1);
                        %>
                       
                    </div>
                
                </div>
            </div>
       </div>
    </div>
         </div>
</asp:Content>
