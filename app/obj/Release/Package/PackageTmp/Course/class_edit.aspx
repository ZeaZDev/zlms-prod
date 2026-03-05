<%@ Page Language="C#" MasterPageFile="~/Police.Master"  AutoEventWireup="true" CodeBehind="class_edit.aspx.cs" Inherits="newweb.Course.class_edit" %>

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
                    <i class="fa fa-cogs"></i>Edit Class
               </div>
              
           </div>      
           </div>   
            <div class="portlet-body">
                <div class="row">
                    <div class="col-md-8 "> 
                        <div class="col-sm-2"><span class="pull-right">Class Name</span></div>
                        <div class="col-sm-6">
                            <span class="pull-left">
                                <asp:TextBox ID="Name" runat="server"></asp:TextBox>
                                
                            </span>
                        </div>
                        <div class="col-sm-4"></div>
                    </div>
                   <div class="col-md-4">                         
                    </div>
                   <div class="col-md-8 "> 
                          <div class="col-sm-2"><span class="pull-right">Class Description</span></div>
                        <div class="col-sm-6">
                            <span class="pull-left">
                                <asp:TextBox ID="Desp" runat="server"></asp:TextBox>
                            </span>
                        </div>
                        <div class="col-sm-4"></div>                      
                    </div>
                   <div class="col-md-4"> 
                        
                    </div>
                    <div class="col-md-8 "> 
                          <div class="col-sm-2"><span class="pull-right">
                              <asp:Button ID="Button1" runat="server" Text="Save" OnClick="Button1_Click"  class="btn btn-primary"/>
				             <asp:HyperLink id="hyperlink1" NavigateUrl="#" Text="Cancel" runat="server"/>   </span></div>
                        <div class="col-sm-6">

                        </div>
                        <div class="col-sm-4"></div>                      
                    </div>
                   <div class="col-md-4"> 
                        
                    </div>
                 
               </div>     
           </div> 
       </div>
    </div>
</asp:Content>
