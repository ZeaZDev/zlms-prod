<%@ Page Language="C#" MasterPageFile="~/Police.Master" AutoEventWireup="true" CodeBehind="Questionitemupload.aspx.cs" Inherits="newweb.Question.Questionitemupload" %>

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
     <br />
   <div class="row">
       <div class="col-md-12"> 
           <div class="portlet box green">
           <div class="portlet-title">
               <div class="caption">
                    <i class="fa fa-cogs"></i>Details Question
               </div>
               <div class="tools">
                   
                </div>
           </div>
           <div class="portlet-body">
               <div class="row">
                    <div class="col-md-8 "> 
                        <div class="col-sm-2"><span class="pull-right">Question </span></div>
                        <div class="col-sm-6">
                            <span class="pull-left">
                                <asp:Label ID="Questioncourse" runat="server" Text="Label"></asp:Label>
                            </span>
                        </div>
                        <div class="col-sm-4"></div>
                    </div>
                   <div class="col-md-4">                         
                    </div>
                  <div class="col-md-8 "> 
                        <div class="col-sm-2"><span class="pull-right">Question name</span></div>
                        <div class="col-sm-6">
                            <span class="pull-left">
                                <asp:Label ID="Questionname" runat="server" Text="Label"></asp:Label>
                            </span>
                        </div>
                        <div class="col-sm-4"></div>
                    </div>
                   <div class="col-md-4">                         
                    </div>
                   <div class="col-md-8 "> 
                        <div class="col-sm-2"><span class="pull-right">Question group</span></div>
                        <div class="col-sm-6">
                            <span class="pull-left">
                                <asp:Label ID="Questiongroup" runat="server" Text="Label"></asp:Label>
                            </span>
                        </div>
                        <div class="col-sm-4"></div>
                    </div>
                   <div class="col-md-4">                         
                    </div>
                   <div class="col-md-8 "> 
                        <div class="col-sm-2"><span class="pull-right">Question Choice</span></div>
                        <div class="col-sm-6">
                            <span class="pull-left">
                                <asp:Label ID="Questionchoice" runat="server" Text="Label"></asp:Label>
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
       
    </div>
     <div class="row">
       <div class="col-md-12"> 
           <div class="portlet box green">
           <div class="portlet-title">
               <div class="caption">
                    <i class="fa fa-cogs"></i>Upload Pic
               </div>
               <div class="tools">
                   
                </div>
           </div>
           <div class="portlet-body">
               <div class="row">
                    <div class="col-md-8 "> 
                        <div class="col-sm-2"><span class="pull-right">Pic </span></div>
                        <div class="col-sm-6">
                            <span class="pull-left">
                                <asp:FileUpload ID="FileUpload1" runat="server" /><asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                            </span>
                        </div>
                        <div class="col-sm-4"></div>
                    </div>
                   <div class="col-md-4">                         
                    </div>
                  
                   <div class="col-md-8 "> 
                        <div class="col-sm-2"><span class="pull-right"></span></div>
                        <div class="col-sm-6">
                            <span class="pull-left">
                                <asp:Button ID="Button1" runat="server" Text="Add" OnClick="Button1_Click"/>
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
       
    </div>
</asp:Content>