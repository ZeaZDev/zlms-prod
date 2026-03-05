<%@ Page Language="C#" MasterPageFile="~/Police_user.Master"  AutoEventWireup="true" CodeBehind="poll.aspx.cs" Inherits="newweb.Course_user.poll" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style type="text/css">

td { white-space:pre-line; }
</style>

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
           <span>User Poll</span>
       </li>
     </ul>
         </div>
     <br />
    <div class="row">
     <div class="col-md-12"> 
           <div class="portlet box green">
           <div class="portlet-title">
               <div class="caption">
                    <i class="fa fa-cogs"></i>คำชี้แจง
               </div>
               <div class="tools">
                   
                </div>
           </div>
           <div class="portlet-body">
               <div class="row">
                    <div class="col-md-12"> 
                         <% 
                        string tempLibary2 =renderdata2();
                        Response.Write(tempLibary2);
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
                    <i class="fa fa-cogs"></i>ข้อมูลทั่วไปเกี่ยวกับผู้ตอบแบบสอบถาม
               </div>
               <div class="tools">
                   
                </div>
           </div>
           <div class="portlet-body">
               <div class="row">
                    <div class="col-md-12"> 
                         <% 
                        string tempLibary3 =renderdata3();
                        Response.Write(tempLibary3);
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
                                            <i class="fa fa-cogs"></i>ความคิดเห็นเกี่ยวกับความพึงพอใจในการปฏิบัติงานของผู้สำเร็จการศึกษาอบรม </div>
                                        <div class="tools">
                                            
                                        </div>
                                    </div>
                                    <div class="portlet-body flip-scroll">
                        <% 
                        string tempLibary1 =renderdata1();
                        Response.Write(tempLibary1);
                        %>
                            </div>
                        </div>
                    </div>
                  
                </div>
     <div class="row">
     <div class="col-md-12"> 
           <div class="portlet box green">
           <div class="portlet-title">
               <div class="caption">
                    <i class="fa fa-cogs"></i>ตอนที่ ๓ คุณลักษณะที่พึงประสงค์ของผู้สำเร็จการศึกษาอบรมหลักสูตร
               </div>
               <div class="tools">
                   
                </div>
           </div>
           <div class="portlet-body">
               <div class="row">
                    <div class="col-md-12"> 
                        1. ท่านต้องการให้ผู้ใต้บังคับบัญชาของท่าน มีความรู้ความสามารถในเรื่องใดมากที่สุด 
                        <input type="text" id="Text4" runat="server" class='form-control' placeholder="1)"/>
                         <input type="text" id="Text10" runat="server" class='form-control' placeholder="2)"/>
                         <input type="text" id="Text11" runat="server" class='form-control' placeholder="3)"/>
                    </div> 
                    <div class="col-md-12"> 
                        2.ท่านต้องการให้ผู้ใต้บังคับบัญชาของท่าน พัฒนา ปรับปรุง หรือแก้ไขในเรื่องใดมากที่สุด (เรียงตามลำดับก่อนหลัง)
                         <input type="text" id="Text5" runat="server" class='form-control' placeholder="1)"/>
                         <input type="text" id="Text8" runat="server" class='form-control' placeholder="2)"/>
                         <input type="text" id="Text9" runat="server" class='form-control' placeholder="3)"/>
                    </div>
                    <div class="col-md-12"> 
                       3.ข้อคิดเห็น/ข้อเสนอแนะอื่น  <input type="text" id="Text6" runat="server" class='form-control'/>
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