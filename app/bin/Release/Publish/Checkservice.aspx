<%@ Page Language="C#"  MasterPageFile="~/Police.Master"  AutoEventWireup="true" CodeBehind="Checkservice.aspx.cs" Inherits="newweb.Checkservice" %>

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
           <span>Test Service</span>
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
                    <i class="fa fa-cogs"></i>TestService
               </div>
               <div class="tools">
                 
                </div>
           </div>
           <div class="portlet-body">
              <div class="row">
                <div class="col-sm-12">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </div>  
                  <div class="col-sm-12">
                      <asp:Button ID="Button1" runat="server" Text="Check" OnClick="Button1_Click" />
                </div> 
              </div>
           </div>
           
       </div>                             
        <!-- END SAMPLE TABLE PORTLET-->                      
        </div>
         <div class="col-md-12">                               
       <!-- BEGIN SAMPLE TABLE PORTLET-->
       <div class="portlet box green">
           <div class="portlet-title">
               <div class="caption">
                    <i class="fa fa-cogs"></i>Data
               </div>
               <div class="tools">
                 
                </div>
           </div>
           <div class="portlet-body">
              <div class="row">
                <div class="col-sm-12">
                    <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
                </div>  
                  <div class="col-sm-12">
                      <asp:Label ID="Label2" runat="server" Text="Rank"></asp:Label>
                </div> 
                    <div class="col-sm-12">
                        <asp:Label ID="Label3" runat="server" Text="WorkPlace"></asp:Label>
                </div> 
              </div>
           </div>
           
       </div>                             
        <!-- END SAMPLE TABLE PORTLET-->                      
        </div>
    </div>
    

</asp:Content>