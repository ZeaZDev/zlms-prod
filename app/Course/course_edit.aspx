<%@ Page Language="C#" MasterPageFile="~/Police.Master"  AutoEventWireup="true" CodeBehind="course_edit.aspx.cs" Inherits="newweb.Course.course_edit" %>

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
                                            <i class="fa fa-gift"></i>แก้ไขหลักสูตร</div>
                                    </div>
                                    <div class="portlet-body">
                                        <h4>หลักสูตร</h4>
                                       <asp:TextBox ID="Name" runat="server" style="width:500px" ></asp:TextBox>
                                        <h4>รายละเอียดหลักสูตร</h4>
                                         <asp:TextBox ID="Desp" runat="server" style="width:500px"></asp:TextBox>
                                        <h4>ระยะเวลา</h4>
                                          <div class="input-group input-large date-picker input-daterange" data-date="10/11/2012" data-date-format="mm/dd/yyyy">
                                          <input type="text" class="form-control" id="dtfrom" runat="server">
                                           <span class="input-group-addon"> to </span>
                                           <input type="text" class="form-control" id="dtto" runat="server">
                                              
                                        </div>
                                         <h4>&nbsp;</h4>
                                               <asp:Button ID="Button1" runat="server" Text="บันทึก" OnClick="Button1_Click"  class="btn btn-primary"/>
				                                <asp:HyperLink id="hyperlink1" NavigateUrl="#" Text="ยกเลิก" runat="server"/> 
                                        
                                    </div>
                                </div>
                            </div>
                            
                        </div>
    

</asp:Content>

