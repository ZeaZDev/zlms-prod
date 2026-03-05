<%@ Page Language="C#" MasterPageFile="~/Police.Master"  AutoEventWireup="true" CodeBehind="Questiondetail_edit.aspx.cs" Inherits="newweb.Question.Questiondetail_edit" %>

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
           <span>Question Group</span>
       </li>
     </ul>
         </div>
     <br />
     <div class="row">
                            <div class="col-md-12">
                                <div class="portlet box green">
                                    <div class="portlet-title">
                                        <div class="caption">
                                            <i class="fa fa-gift"></i>Edit Question Detial</div>
                                    </div>
                                    <div class="portlet-body">
                                        <h4>Question Detial</h4>
                                         <textarea rows="4" cols="50" ID="Name" runat="server">
                                          </textarea>
                                    
                                                                                <h4>&nbsp;</h4>
                                               <asp:Button ID="Button1" runat="server" Text="Save" OnClick="Button1_Click"  class="btn btn-primary"/>
				                                <asp:HyperLink id="hyperlink1" NavigateUrl="#" Text="Cancel" runat="server"/> 
                                        
                                    </div>
                                </div>
                            </div>
                            
                        </div>
    

</asp:Content>