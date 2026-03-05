<%@ Page Language="C#" MasterPageFile="~/Police.Master" AutoEventWireup="true" CodeBehind="add.aspx.cs" Inherits="lms.ebook._add" %>
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
           <span>E-Book</span>
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
                    <i class="fa fa-cogs"></i>Upload E-Book
               </div>
               <div class="tools">
                    <a href="<%= ResolveUrl("~/ebook/default.aspx") %>">E-Book Shelf</a>
                </div>
           </div>
           <div class="portlet-body">
            <form id="form1">
                PDF file : <asp:FileUpload id="PdfUploadControl" runat="server" />
                ภาพหน้าปก : <asp:FileUpload id="CoverUploadControl" runat="server" />
                <div class="form-group">
                    <label class="control-label visible-ie8 visible-ie9">ชื่อตำรา</label>
                    <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="ชื่อตำรา" id="txttitle" required runat="server"/>

                </div>
                <div class="form-group">
                    <label class="control-label visible-ie8 visible-ie9">ชื่อผู้แต่ง</label>
                    <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="ชื่อผู้แต่ง" id="txtauthor" required runat="server"/>

                </div>
                <br /><br />
                <asp:Button runat="server" id="UploadButton" text="Upload" onclick="UploadButton_Click" />
                <br /><br />
                <asp:Label runat="server" id="StatusLabel" text="Upload status: " />
            </form>
           </div>
       </div>                             
        <!-- END SAMPLE TABLE PORTLET-->                      
        </div>
    </div>
</asp:Content>