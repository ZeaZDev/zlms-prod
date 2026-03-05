<%@ Page Language="C#" MasterPageFile="~/Police.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="lms.ebook._default" %>
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
                    <i class="fa fa-cogs"></i>E-Book Shelf
               </div>
               <div class="tools">
                    <a href="<%= ResolveUrl("~/ebook/add.aspx") %>">เพิ่ม E-Book</a>
                </div>
           </div>
           <div class="portlet-body">
             <div class="table-responsive">
              <asp:GridView ID="gvDP" runat="server" class="table table-striped" AutoGenerateColumns="False" DataSourceID="sqlDP"  ShowFooter="false" >
                    <Columns> 
                        <asp:TemplateField HeaderText="Title">
                            <ItemTemplate>
                                 <asp:HyperLink ID="lnk" runat="server" Target="_self" Text='<%# Eval("title") %>'
                                            NavigateUrl='<%# "ebook_detail.aspx?ID=" +Eval("file_id") %>'></asp:HyperLink><br />
                                <asp:image ID="imgcover" runat="server" imageurl='<%# "~/ebook_assets/" + Eval("thumbnail") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>                                              
                        <asp:BoundField DataField="author" HeaderText="Author" SortExpression="file_id" />  
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="EditButton" class="btn btn-warning btn-circle btn-sm"  CommandArgument='<%# Eval("file_id") %>' OnClick="Button1_Click">
                                    <i class="fa fa-pencil" aria-hidden="true"></i>
                                </asp:LinkButton>
                                <asp:LinkButton runat="server"  ID="DeclineButton" class="btn btn-danger btn-circle btn-sm"  OnClientClick="return confirm('Are you sure you want to delete this E-Book?');" CommandArgument='<%# Eval("file_id") %>' OnClick="Button2_Click">
                                    <i class="fa fa-trash" aria-hidden="true"></i>
                                </asp:LinkButton>
                            
                            </ItemTemplate>
                        </asp:TemplateField>                                      
                    </Columns>
                   <HeaderStyle Font-Size="Small" BackColor="#006699" Font-Bold="True" ForeColor="White" />
                </asp:GridView>      
              </div>                    
           </div>
           <asp:SqlDataSource ID="sqlDP" runat="server" ConnectionString="<%$ ConnectionStrings:cdas_conn %>"
                    SelectCommand="SELECT file_id,[title],[author],[isbn],[thumbnail],[filename] FROM [ebook]"  >
                </asp:SqlDataSource>
       </div>                             
        <!-- END SAMPLE TABLE PORTLET-->                      
        </div>
    </div>
</asp:Content>