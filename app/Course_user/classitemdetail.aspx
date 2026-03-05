<%@ Page Language="C#" MasterPageFile="~/Police_user.Master" AutoEventWireup="true" CodeBehind="classitemdetail.aspx.cs" Inherits="newweb.Course_user.classitemdetail" %>

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
           <asp:HyperLink id="hyperlink1" 
                  NavigateUrl="#"
                  Text="Class"
                  runat="server"/>   
           <i class="fa fa-circle"></i>
       </li> 
         <li>
           <asp:HyperLink id="hyperlink2" 
                  NavigateUrl="#"
                  Text="Class Detail"
                  runat="server"/>   
           <i class="fa fa-circle"></i>
       </li> 
       <li>
           <asp:HyperLink id="hyperlink3" 
                  NavigateUrl="#"
                  Text="Period"
                  runat="server"/>   
           <i class="fa fa-circle"></i>
       </li>       
       <li>
           <span>Class Items</span>
       </li>
     </ul>
         </div>
    <br />
   <div class="row">
       <div class="col-md-12"> 
           <div class="portlet box green">
           <div class="portlet-title">
               <div class="caption">
                    <i class="fa fa-cogs"></i>Start ClassItem
               </div>
               <div class="tools">
                   
                </div>
           </div>
           <div class="portlet-body">
               <div class="row">
                   <div class="col-md-12"> 
                    <div class="col-md-8 "> 
                        <div class="col-sm-2"><span class="pull-right">Name</span></div>
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
                          <div class="col-sm-2"><span class="pull-right">Description</span></div>
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
                        <div class="col-sm-2"><span class="pull-right">Course Name</span></div>
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
                   <div class="col-md-8 "> 
                        <div class="col-sm-2"><span class="pull-right">Class Name</span></div>
                        <div class="col-sm-6">
                            <span class="pull-left">
                                <asp:Label ID="ClassName" runat="server" Text="Label"></asp:Label>
                            </span>
                        </div>
                        <div class="col-sm-4"></div>
                    </div>
                   <div class="col-md-4">                         
                    </div>
                     </div>
                   <div class="col-md-12"> 
                   <div class="col-md-8 "> 
                        <div class="col-sm-2"><span class="pull-right">Period name</span></div>
                        <div class="col-sm-6">
                            <span class="pull-left">
                                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
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
                   <div class="col-md-12">
                        <asp:Button ID="Button1" runat="server" Text="Finish" OnClick="Button1_Click" />
                    </div>
                </div>
            </div>
       </div>
    </div>
         </div>
</asp:Content>

