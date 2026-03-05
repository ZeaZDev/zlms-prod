<%@ Page Language="C#"  MasterPageFile="~/Police.Master"  AutoEventWireup="true" CodeBehind="live_edit.aspx.cs" Inherits="newweb.Multimedia.live_edit" %>

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
           <span>Course</span>
       </li>
     </ul>
         </div>
     <br />
     <div class="row">
                            <div class="col-md-12">
                                <div class="portlet box green">
                                    <div class="portlet-title">
                                        <div class="caption">
                                            <i class="fa fa-gift"></i>Edit Course</div>
                                    </div>
                                    <div class="portlet-body">
                                        <h4>Live Name</h4>
                                       <asp:TextBox ID="Name" runat="server" style="width:500px" ></asp:TextBox>
                                        <h4>Link (Http)</h4>
                                         <asp:TextBox ID="Desp" runat="server" style="width:500px"></asp:TextBox>                                       
                                         <h4>&nbsp;</h4>
                                               <asp:Button ID="Button1" runat="server" Text="Save" OnClick="Button1_Click"  class="btn btn-primary"/>
				                                <asp:HyperLink id="hyperlink1" NavigateUrl="#" Text="Cancel" runat="server"/> 
                                        
                                    </div>
                                </div>
                            </div>
                            
                        </div>
    

</asp:Content>
