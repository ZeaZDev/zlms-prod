<%@ Page Language="C#" MasterPageFile="~/Police_user.Master"  AutoEventWireup="true" CodeBehind="poll1.aspx.cs" Inherits="newweb.Course_user.poll1" %>

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
                        1. ตำแหน่งหน้าที่ในปัจจุบัน <input type="text" id="currentname" runat="server" class='form-control' />
                    </div> 
                    <div class="col-md-12"> 
                        2.อายุราชการในตำแหน่งปัจจุบัน <input type="text" id="Text1" runat="server" class='form-control'/>
                    </div>
                    <div class="col-md-12"> 
                       3.อายุราชการโดยรวม <input type="text" id="Text2" runat="server" class='form-control'/>
                    </div>
                   <div class="col-md-12"> 
                       4. คุณวุฒิทางการศึกษา  <INPUT name="edu" id="subject" type="radio" value="ต่ำกว่าปริญญาตรี" required >ต่ำกว่าปริญญาตรี     
                          <INPUT name="edu" id="Radio1" type="radio" value="ปริญญาตรี">ปริญญาตรี
                         <INPUT  name="edu" id="Radio3" type="radio" value="ปริญญาโท">   ปริญญาโท
                          <INPUT  name="edu" id="Radio2" type="radio" value="สูงกว่าปริญญาโท">   สูงกว่าปริญญาโท
                    </div>
                   <div class="col-md-12"> 
                       5.สายงานที่รับผิดชอบ <INPUT name="occu" id="Radio4" type="radio" value="สืบสวน" required>สืบสวน 
                       <INPUT name="occu" id="Radio5" type="radio" value="สอบสวน " required>สอบสวน 
                       <INPUT name="occu" id="Radio6" type="radio" value="สืบสวน" required>ป้องกันปราบปราม
                       <INPUT name="occu" id="Radio7" type="radio" value="สืบสวน" required>จราจร
                       <INPUT name="occu" id="Radio8" type="radio" value="สืบสวน" required>อำนวยการ
                       <INPUT name="occu" id="Radio9" type="radio" value="สืบสวน" required>บริหาร
                    </div>
                   <div class="col-md-12"> 
                        6.เพื่อนร่วมงานท่านเป็นผู้สำเร้จการศึกษาหลักสูตร <input type="text" id="Text3" runat="server" class='form-control'/>
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
                    <i class="fa fa-cogs"></i>คุณลักษณะที่พึงประสงค์ของผู้สำเร็จการศึกษาอบรมหในทัศนะของผู้บังคับบัญชา
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