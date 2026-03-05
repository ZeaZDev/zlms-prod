<%@ Page Language="C#" MasterPageFile="~/Police.Master"  AutoEventWireup="true" CodeBehind="asset_detail_add.aspx.cs" Inherits="newweb.USER_QA.asset_detail_add" %>

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
           <span>QA Project</span>
       </li>
     </ul>
         </div>
    <br />
   <div class="row">
       <div class="col-md-12"> 
           <div class="portlet box green">
           <div class="portlet-title">
               <div class="caption">
                    <i class="fa fa-cogs"></i>รายละเอียดการประเมิณ
               </div>
               <div class="tools">
                   
                </div>
           </div>
           <div class="portlet-body">
               <div class="row">
                   <div class="col-md-12"> 
                    <div class="col-md-8 "> 
                        <div class="col-sm-2"><span class="pull-right">ดัชนี</span></div>
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
                          <div class="col-sm-2"><span class="pull-right">กลุ่มตัวบ่งชี้</span></div>
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
                        <div class="col-sm-2"><span class="pull-right">ตัวบ่งชี้</span></div>
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
                        <div class="col-sm-2"><span class="pull-right">ประเด็นการพิจารณา</span></div>
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
                    <div class="col-md-8 "> 
                        <div class="col-sm-2"><span class="pull-right">รายละเอียด</span></div>
                        <div class="col-sm-6">
                            <span class="pull-left">
                                <asp:TextBox ID="TextBox1" runat="server" Rows="10" TextMode="MultiLine" style="width: 800px"></asp:TextBox>
                            </span>
                        </div>
                        <div class="col-sm-4"></div>
                    </div>
                   <div class="col-md-4">                         
                    </div>
                    </div>
                    <div class="col-md-12"> 
                    <div class="col-md-8 "> 
                        <div class="col-sm-2"><span class="pull-right"></span></div>
                        <div class="col-sm-6">
                            <span class="pull-left">
                                <asp:Button ID="Button1" runat="server" Text="Save" OnClick="Button1_Click" />
                                <asp:Button ID="Button2" runat="server" Text="Back"  />
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
        </div>

    </div>
    
</asp:Content>
