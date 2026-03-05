<%@ Page Language="C#" MasterPageFile="~/Police.Master"  AutoEventWireup="true" CodeBehind="Question.aspx.cs" Inherits="newweb.Course.Question" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">

         function openModal() {
             $('#mdAdd').modal({ show: true });
         };
    </script>
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="body" runat="server">

     <div class="page-bar">

      <ul class="page-breadcrumb">
        <li>
           <a href="<%= ResolveUrl("~/default.aspx") %>">หน้าหลัก</a>
           <i class="fa fa-circle"></i>
       </li>
         <li>
           <a href="<%= ResolveUrl("~/Course/") %>">หลักสูตร</a>
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
           <span>สื่อ</span>
       </li>
     </ul>
         </div>
    <br />
   <div class="row">
       <div class="col-md-12">
           <div class="portlet box green">
           <div class="portlet-title">
               <div class="caption">
                    <i class="fa fa-cogs"></i>รายละเอียด
               </div>
               <div class="tools">

                </div>
           </div>
           <div class="portlet-body">
               <div class="row">
                   <div class="col-md-12">
                    <div class="col-md-8 ">
                        <div class="col-sm-2"><span class="pull-right">ชื่อ</span></div>
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
                          <div class="col-sm-2"><span class="pull-right">รายละเอียด</span></div>
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
                        <div class="col-sm-2"><span class="pull-right">หลักสูตร</span></div>
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
                        <div class="col-sm-2"><span class="pull-right">หมวดวิชา</span></div>
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
                        <div class="col-sm-2"><span class="pull-right">วิชา</span></div>
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
                   <div class="col-md-8 ">
                        <div class="col-sm-2"><span class="pull-right">ชื่อข้อสอบที่เลือก</span></div>
                        <div class="col-sm-6">
                            <span class="pull-left">
                               <asp:Label ID="Questionxx" runat="server" Text="Label"></asp:Label>
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
     <div class="row">
       <div class="col-md-12">
           <div class="portlet box green">
           <div class="portlet-title">
               <div class="caption">
                    <i class="fa fa-cogs"></i>เลือกข้อสอบ
               </div>
               <div class="tools">

                </div>
           </div>
            <div class="portlet-body">
               <div class="row">
                   <div class="col-md-12">
                       <div class="col-md-8 ">
                        <div class="col-sm-2"><span class="pull-right">ข้อสอบ</span></div>
                        <div class="col-sm-6">
                            <span class="pull-left">
                                <asp:DropDownList ID="DropDownList1" runat="server" ></asp:DropDownList>
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
                                <asp:Button ID="Button1" runat="server" Text="เลือก" OnClick="Button1_Click" />
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
         </div>

</asp:Content>
