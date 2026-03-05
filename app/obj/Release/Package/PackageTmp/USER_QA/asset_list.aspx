<%@ Page Language="C#"   MasterPageFile="~/Police.Master"   AutoEventWireup="true" CodeBehind="asset_list.aspx.cs" Inherits="newweb.USER_QA.asset_list" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

td { white-space:pre-line; }
</style>

      <script type="text/javascript">

          function ReGen(t) {
              var check = confirm("ต้องการลบข้อมูล หรือไม่?");
              if (check == true) {
                  var parm = new Object;
                  parm['id'] = t;
                  $.ajax({
                      url: "asset_list.aspx/ReGenToken",
                      type: "POST",
                      data: JSON.stringify(parm),
                      dataType: "json",
                      contentType: "application/json; charset=utf-8",
                      success: function (result) {
                          if (result.d != 'Failed') {

                          } else {
                              alert('Status This Token is not Active.\nyou can\'t to change anything. ')

                          }
                          window.location.reload();
                      },
                      error: function (xhr, status, message) {
                          console.log(xhr);
                      }
                  });
              }
              else
              {
                  return false;
              }

             
          }
          function ReGen1(t) {
              var check = confirm("ต้องการลบข้อมูล หรือไม่?");
              if (check == true)
              {
                  var parm = new Object;
                  parm['id'] = t;
                  $.ajax({
                      url: "asset_list.aspx/ReGenToken1",
                      type: "POST",
                      data: JSON.stringify(parm),
                      dataType: "json",
                      contentType: "application/json; charset=utf-8",
                      success: function (result) {
                          if (result.d != 'Failed') {

                          } else {
                              alert('Status This Token is not Active.\nyou can\'t to change anything. ')

                          }
                          window.location.reload();
                      },
                      error: function (xhr, status, message) {
                          console.log(xhr);
                      }
                  });
              }
              else
              {
                  return false;
              }
             
          }
          function ReGen3(t) {
              var check = confirm("ต้องการลบข้อมูล หรือไม่?");
              if (check == true)
              {
                  var parm = new Object;
                  parm['id'] = t;
                  $.ajax({
                      url: "asset_list.aspx/ReGenToken2",
                      type: "POST",
                      data: JSON.stringify(parm),
                      dataType: "json",
                      contentType: "application/json; charset=utf-8",
                      success: function (result) {
                          if (result.d != 'Failed') {

                          } else {
                              alert('Status This Token is not Active.\nyou can\'t to change anything. ')

                          }
                          window.location.reload();
                      },
                      error: function (xhr, status, message) {
                          console.log(xhr);
                      }
                  });
              }
              else {
                  return false;
              }
          }
          function ReGen4(t) {
              var check = confirm("ต้องการลบข้อมูล หรือไม่?");
              if (check == true)
              {
                  var parm = new Object;
                  parm['id'] = t;
                  $.ajax({
                      url: "asset_list.aspx/ReGenToken4",
                      type: "POST",
                      data: JSON.stringify(parm),
                      dataType: "json",
                      contentType: "application/json; charset=utf-8",
                      success: function (result) {
                          if (result.d != 'Failed') {

                          } else {
                              alert('Status This Token is not Active.\nyou can\'t to change anything. ')

                          }
                          window.location.reload();
                      },
                      error: function (xhr, status, message) {
                          console.log(xhr);
                      }
                  });
              }
              else {
                  return false;
              }
            
          }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
     <div class="page-bar"> 
   
      <ul class="page-breadcrumb">
        <li>
           <a href="<%= ResolveUrl("~/default.aspx") %>">Home</a>
           <i class="fa fa-circle"></i>
       </li>
       <li>
           <asp:HyperLink id="hyperlink1" 
                  NavigateUrl="#"
                  Text="QA Fill"
                  runat="server"/>   
           <i class="fa fa-circle"></i>
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
                    <i class="fa fa-cogs"></i>ตัวบ่งชี้ที่ <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
               </div>
               <div class="tools">
                 
                </div>
           </div>
           <div class="portlet-body">
         <table class="table table-bordered table-striped table-condensed flip-content">
                 <thead class="flip-content">
                      <tr>
                    <th width="80%">กระบวนการ</th>
                    <th> คะแนน </th>
                      </tr>
                   </thead>
                 <% 
                        string tempLibary =renderdata();
                        Response.Write(tempLibary);
                    %>
                <tr>
                    <td align="right">
                        <asp:Label ID="Label4" runat="server" Text="ผลลัพธ์"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox> </td>
                      </tr>
                 <tr>
                    <td align="right">
                        <asp:Label ID="Label5" runat="server" Text="กระบวนการ"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><asp:Button ID="Button2" runat="server" Text="บันทึก" OnClick="Button2_Click" /> </td>
                      </tr>
                 <tr>
                    <td align="right">
                        <asp:Label ID="Label7" runat="server" Text="รวมคะแนน ทุกตัวบ่งชี้"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TextBox8" runat="server" ReadOnly="true"></asp:TextBox>
                    </td>
                      </tr>
                </table>  
       </div>                        
        <!-- END SAMPLE TABLE PORTLET-->                      
        </div>
           <div id="group7_1" runat="server" class="col-md-12"> 
           <div class="portlet box green">
           <div class="portlet-title">
               <div class="caption">
                    <i class="fa fa-cogs"></i>ผลของการดำเนินโครงการบริการทางวิชาการ
               </div>
               <div class="tools">
                   
                </div>
           </div>
           <div class="portlet-body">
               <div class="row">
                    <div class="col-md-4 "> 
                     <h5 id="H14">
                        <label for="fullname">จำนวนโครงการ/กิจกรรม </label>
                          <asp:TextBox ID="TextBox3" class="form-control" runat="server" Readonly="true"></asp:TextBox>
                    </h5> 
                    </div> 
                   <div class="col-md-4 ">                 
                   <h5 id="H15">
                        <label for="fullname">
                            <asp:Label ID="Label2" runat="server" Text="จำนวนครู/อาจารย์ และครูฝึกทั้งหมด"></asp:Label> </label>    
                        <asp:TextBox ID="TextBox5" class="form-control" runat="server" ></asp:TextBox>
                    </h5> 
                       </div> 
                   <div class="col-md-4 ">                 
                   <h5 id="H16">
                        <label for="fullname">ร้อยละ</label>
                       <asp:TextBox ID="TextBox4" class="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                    </h5> 
                       </div> 
                     
                     <div class="col-md-12 ">    

                          <asp:Button ID="Button5" runat="server" Text="บันทึกข้อมูล" OnClick="Button71_Click"/>
                          </div>     
                    </div>

            </div>
        </div>

        </div>
       <div id="group8_1" runat="server" class="col-md-12"> 
           <div class="portlet box green">
           <div class="portlet-title">
               <div class="caption">
                    <i class="fa fa-cogs"></i>ค่าเฉลี่ยความพึงพอใจ
               </div>
               <div class="tools">
                   
                </div>
           </div>
           <div class="portlet-body">
               <div class="row">
                    <div class="col-md-6 "> 
                     <h5 id="H31">
                        <label for="fullname">บุคลากรระดับผู้บริหาร </label>
                          <asp:TextBox ID="TextBox11" class="form-control" runat="server" ></asp:TextBox>
                    </h5> 
                    </div> 
                   <div class="col-md-6 ">                 
                   <h5 id="H32">
                        <label for="fullname">
                            <asp:Label ID="Label9" runat="server" Text="ครู/อาจารย์ และครูฝึก"></asp:Label> </label>    
                        <asp:TextBox ID="TextBox12" class="form-control"  runat="server" ></asp:TextBox>
                    </h5> 
                       </div> 
                   <div class="col-md-6 ">                 
                   <h5 id="H33">
                        <label for="fullname">บุคลากรสายงานสนับสนุน</label>
                       <asp:TextBox ID="TextBox13" class="form-control"  runat="server" ></asp:TextBox>
                    </h5> 
                       </div> 
                   <div class="col-md-6 ">                 
                   <h5 id="H34">
                        <label for="fullname">ค่าเฉลี่ยในภาพรวม</label>
                       <asp:TextBox ID="TextBox14" class="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                    </h5> 
                       </div> 
                     <div class="col-md-12 ">    

                          <asp:Button ID="Button10" runat="server" Text="บันทึกข้อมูล" OnClick="Button81_Click"/>
                          </div>     
                    </div>

            </div>
        </div>

        </div>
     <div id="group5_1" runat="server" class="col-md-12"> 
           <div class="portlet box green">
           <div class="portlet-title">
               <div class="caption">
                    <i class="fa fa-cogs"></i>ผลของการดำเนินการ
               </div>
               <div class="tools">
                   
                </div>
           </div>
           <div class="portlet-body">
               <div class="row">
                   <div class="col-md-4 ">                 
                   <h5 id="H27">
                        <label for="fullname">
                            <asp:Label ID="Label6" runat="server" Text="จำนวนครู/อาจารย์ และครูฝึกทั้งหมด"></asp:Label> </label>    
                        <asp:TextBox ID="TextBox9" class="form-control" runat="server" ></asp:TextBox>
                    </h5> 
                       </div> 
                   <div class="col-md-4 ">                 
                   <h5 id="H28">
                        <label for="fullname">ร้อยละ</label>
                       <asp:TextBox ID="TextBox10" class="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                    </h5> 
                       </div> 
                     <div class="col-md-12 ">    

                          <asp:Button ID="Button8" runat="server" Text="บันทึกข้อมูล" OnClick="Button511_Click"/>
                          </div>     
                    </div>

            </div>
        </div>

        </div>
     <div id="group2" runat="server" class="col-md-12"> 
           <div class="portlet box green">
           <div class="portlet-title">
               <div class="caption">
                    <i class="fa fa-cogs"></i>ความพึงพอใจของผู้บังคับบัญชาหน่วยงานต้นสังกัดและผู้ที่เกี่ยวข้อง
               </div>
               <div class="tools">
                   
                </div>
           </div>
           <div class="portlet-body">
               <div class="row">
                    <div class="col-md-6 "> 
                     <h5 id="H42">
                        <label for="fullname">หลักสูตร </label>
                          <asp:TextBox ID="TextBox15" class="form-control" runat="server" ></asp:TextBox>
                    </h5> 
                    </div> 
                   <div class="col-md-6 ">                 
                   <h5 id="H43">
                        <label for="fullname">ค่าเฉลี่ยความพึงพอใจของผู้บังคับบัญชา</label>                              
                        <asp:TextBox ID="TextBox16" class="form-control" runat="server" ></asp:TextBox>
                    </h5> 
                       </div>  
                   <div class="col-md-6 ">                 
                   <h5 id="H44">
                        <label for="fullname">ค่าเฉลี่ยความพึงพอใจของผู้เกี่ยวข้อง</label>                              
                        <asp:TextBox ID="TextBox17" class="form-control" runat="server" ></asp:TextBox>
                    </h5> 
                       </div>                           
                     <div class="col-md-12 ">    

                          <asp:Button ID="Button11"  runat="server" Text="บันทึก" OnClick="Button21_Click"/>
                          </div>     
                    </div>
            </div>
        </div>
        <div class="portlet box green">
           <div class="portlet-title">
               <div class="caption">
                    <i class="fa fa-cogs"></i>ค่าเฉลี่ยความพึงพอใจหลักสูตร
               </div>
               <div class="tools">
                </div>
           </div>
           <div class="portlet-body">
                     <div class="portlet-body flip-scroll">
                <table class="table table-bordered table-striped table-condensed flip-content">
                  <thead class="flip-content">
                  <tr>
                     <th width="5%"> No </th>
                     <th width="50%"> หลักสูตร </th>
                     <th width="20%"> ค่าเฉลี่ยความพึงพอใจของผู้บังคับบัญชา</th>
                     <th width="20%"> ค่าเฉลี่ยความพึงพอใจของผู้เกี่ยวข้อง</th>
                      <th width="5%"> </th>
                 </tr>
                 </thead>
                   <tbody>
                        <% 
                        string tempLibary6 =renderdata6();
                        Response.Write(tempLibary6);
                    %>
                   </tbody>
                  </table>
               </div>                 
           </div>         
       </div>  


        </div>
    <div id="group4" runat="server" class="col-md-12"> 
           <div class="portlet box green">
           <div class="portlet-title">
               <div class="caption">
                    <i class="fa fa-cogs"></i>ความพึงพอใจของผู้ศึกษาอบรม
               </div>
               <div class="tools">
                   
                </div>
           </div>
           <div class="portlet-body">
               <div class="row">
                   <div class="col-md-6 "> 
                     <h5 id="H11">
                        <label for="fullname">หลักสูตร</label>
                         <asp:DropDownList ID="DropDownList4" runat="server"></asp:DropDownList>
                    </h5> 
                    </div> 
                  <div class="col-md-6 "> 
                     <h5 id="H12">
                        <label for="fullname">ชื่อหลักสูตร อื่นๆ</label>
                         <input type="text" class="form-control" id="Text141" name ="txtNName" placeholder="ชื่อโครงการ" runat="server">  
                    </h5> 
                    </div> 
                   <div class="col-md-6 ">                 
                   <h5 id="H18">
                        <label for="fullname">ค่าเฉลี่ยความพึงพอใจของผู้ศึกษาอบรม</label>                              
                        <asp:TextBox ID="TextBox7" class="form-control" runat="server" ></asp:TextBox>
                    </h5> 
                       </div>                   
                     <div class="col-md-12 ">    

                          <asp:Button ID="Button6"  runat="server" Text="บันทึก" OnClick="Button41_Click"/>
                          </div>     
                    </div>
            </div>
        </div>
        <div class="portlet box green">
           <div class="portlet-title">
               <div class="caption">
                    <i class="fa fa-cogs"></i>รายชื่อโครงการ/หลักสูตร
               </div>
               <div class="tools">
                </div>
           </div>
           <div class="portlet-body">
             <div class="table-responsive">
             <div class="portlet-body flip-scroll">
                <table class="table table-bordered table-striped table-condensed flip-content">
                  <thead class="flip-content">
                  <tr>
                     <th width="5%"> No </th>
                     <th width="70%"> รายชื่อโครงการ/หลักสูตร </th>
                     <th width="20%"> ค่าเฉลี่ยความพึงพอใจของผู้ศึกษาอบรม</th>
                      <th width="5%"> </th>
                 </tr>
                 </thead>
                   <tbody>
                        <% 
                        string tempLibary7 =renderdata7();
                        Response.Write(tempLibary7);
                    %>
                   </tbody>
                  </table>
               </div>                 
           </div>
         
       </div>  

</div>
        </div>

  <div id="group1" runat="server" class="col-md-12"> 
           <div class="portlet box green">
           <div class="portlet-title">
               <div class="caption">
                    <i class="fa fa-cogs"></i>ผู้ผ่านการทดสอบตามเกณฑ์มาตรฐานวิชาการ
               </div>
               <div class="tools">
                   
                </div>
           </div>
           <div class="portlet-body">
               <div class="row">
                    <div class="col-md-6 "> 
                     <h5 id="txtFname">
                        <label for="fullname">ชื่อโครงการ/หลักสูตร </label>
                         <asp:DropDownList class="form-control" ID="DropDownList2" runat="server"></asp:DropDownList>  
                    </h5> 
                    </div> 
                    <div class="col-md-6 "> 
                     <h5 id="H26">
                        <label for="fullname">ชื่อโครงการ/หลักสูตร อื่นๆ</label>
                         <input type="text" class="form-control" id="txtNName" name ="txtNName" placeholder="ชื่อโครงการ" runat="server">  
                    </h5> 
                    </div> 
                   <div class="col-md-6 ">                 
                   <h5 id="H1">
                        <label for="fullname">จำนวนผู้เข้าอบรม </label>
                        <input type="text" class="form-control" id="Text1" name ="txtNName" placeholder="จำนวนผู้เข้าอบรม" runat="server">
                    </h5> 
                       </div> 
                   <div class="col-md-6 ">                 
                   <h5 id="H3">
                        <label for="fullname">จำนวนผู้ผ่านการทดสอบตามเกณฑ์มาตรฐานวิชาการ</label>
                        <input type="text" class="form-control" id="Text3" name ="txtNName" placeholder="จำนวนผู้ผ่านการอบรม" runat="server">
                    </h5> 
                       </div> 
                   <div class="col-md-6 ">       
                    <h5 id="H2">
                        <label for="fullname">ระยะเวลาการฝึกอบรม</label>
                          <input type="text" class="form-control" id="Text2" name ="txtNName" placeholder="ระยะเวลา" runat="server">
                    </h5> 
                      </div> 
                     <div class="col-md-6 ">    

                          <asp:Button ID="Button1" runat="server" Text="บันทึกข้อมูล" OnClick="Button1_Click"/>
                          </div>     
                    </div>

            </div>
        </div>
        <div class="portlet box green">
           <div class="portlet-title">
               <div class="caption">
                    <i class="fa fa-cogs"></i>รายชื่อโครงการ/หลักสูตร
               </div>
               <div class="tools">
                </div>
           </div>
           <div class="portlet-body">
             <div class="table-responsive">

                  <table class="table table-bordered table-striped table-condensed flip-content">
                  <thead class="flip-content">
                  <tr>
                     <th width="50%"> รายชื่อโครงการ/หลักสูตร </th>
                     <th width="15%"> จำนวนผู้เข้าอบรม </th>
                     <th width="15%"> จำนวนผู้ผ่านการทดสอบตามเกณฑ์มาตรฐานวิชาการ</th>
                     <th width="15%"> ระยะเวลาการฝึกอบรม</th>                      
                      <th width="5%"> </th>
                 </tr>
                 </thead>
                   <tbody>
                        <% 
                        string tempLibary8 =renderdata8();
                        Response.Write(tempLibary8);
                    %>
                   </tbody>
                  </table>            
              </div>                    
           </div>
           
       </div>  
        </div>

        <div id="group5" runat="server" class="col-md-12"> 
           <div class="portlet box green">
           <div class="portlet-title">
               <div class="caption">
                    <i class="fa fa-cogs"></i>ครู/อาจารย์ และครูฝึก ได้รับการเพิ่มพูนความรู้/ประสบการณ์
               </div>
               <div class="tools">
                   
                </div>
           </div>
           <div class="portlet-body">
               <div class="row">
                    <div class="col-md-6 "> 
                     <h5 id="H19">
                        <label for="fullname">รายชื่อครู/อาจารย์ ครูฝึก </label>
                        <input type="text" class="form-control" id="Text7" name ="txtNName" placeholder="รายชื่อครู/อาจารย์ ครูฝึก " runat="server">
                       
                    </h5> 
                    </div> 
                   <div class="col-md-6 ">                 
                   <h5 id="H20">
                        <label for="fullname">ชื่อโครงการ/กิจกรรมที่เข้ารับการเพิ่มพูนความรู้/ประสบการณ์</label>
                        <input type="text" class="form-control" id="Text8" name ="txtNName" placeholder="ชื่อโครงการ" runat="server">
                    </h5> 
                       </div> 
                 
                   <div class="col-md-6 ">                 
                   <h5 id="H21">
                        <label for="fullname">ระยะเวลา </label>
                        <input type="text" class="form-control" id="Text9" name ="txtNName" placeholder="ระยะเวลา " runat="server">
                    </h5> 
                       </div>                     
                     <div class="col-md-12 ">                 
                   <h5 id="H25">
                        <label for="fullname">หมายเหตุ </label>
                        <input type="text" class="form-control" id="Text10" name ="txtNName" placeholder="หมายเหตุ" runat="server">
                    </h5> 
                       </div>      
                     <div class="col-md-12 ">    

                          <asp:Button ID="Button7" runat="server" Text="บันทึกข้อมูล" OnClick="Button51_Click"/>
                          </div>     
                    </div>

            </div>
        </div>
        <div class="portlet box green">
           <div class="portlet-title">
               <div class="caption">
                    <i class="fa fa-cogs"></i>ครู/อาจารย์ และครูฝึก ได้รับการเพิ่มพูนความรู้/ประสบการณ์
               </div>
               <div class="tools">
                </div>
           </div>
           <div class="portlet-body">
              <div class="portlet-body flip-scroll">
                <table class="table table-bordered table-striped table-condensed flip-content">
                  <thead class="flip-content">
                  <tr>
                     <th width="2%"> No </th>
                     <th width="20%"> รายชื่อครู/อาจารย์ ครูฝึก </th>
                     <th width="25%"> ชื่อโครงการ/กิจกรรมที่เข้ารับการเพิ่มพูนความรู้/ประสบการณ์</th>
                     <th width="5%"> ระยะเวลา</th>
                     <th width="13%"> ไฟล์โครงการ/กิจกรรม</th>
                       <th width="15%"> การนำความรู้มาเผยแพร่ให้ผู้อื่นรับทราบ</th>
                       <th width="15%"> การนำความรู้มาพัฒนาการเรียนการสอน</th>
                      <th width="5%"> </th>
                 </tr>
                 </thead>
                   <tbody>
                        <% 
                        string tempLibary2 =renderdata2();
                        Response.Write(tempLibary2);
                    %>
                   </tbody>
                  </table>
               </div>                 
       </div>    
     </div>
     </div>
        <div id="group9" runat="server" class="col-md-12"> 
        <div class="portlet box green">
           <div class="portlet-title">
               <div class="caption">
                    <i class="fa fa-cogs"></i>รายการบันทึก
               </div>
               <div class="tools">
                </div>
           </div>
           <div class="portlet-body">
             <div class="portlet-body flip-scroll">
                <table class="table table-bordered table-striped table-condensed flip-content">
                  <thead class="flip-content">
                  <tr>
                     <th width="55%"> ประเด็นการพิจารณา </th>
                     <th width="35%"> ไฟล์ </th>
                     <th width="10%"> หมายเหตุ </th>
                 </tr>
                 </thead>
                   <tbody>
                        <% 
                        string tempLibary1 =renderdata1();
                        Response.Write(tempLibary1);
                    %>
                   </tbody>
                  </table>
                 <asp:Button ID="Button17" runat="server" Text="แก้ไขหมายเหตุ" OnClick="Button17_Click" />
               </div>                    
           </div>
         
       </div> 
        </div>
        <div id="group7" runat="server" class="col-md-12"> 
           <div class="portlet box green">
           <div class="portlet-title">
               <div class="caption">
                    <i class="fa fa-cogs"></i>ประเด็นการพิจารณา
               </div>
               <div class="tools">
                   
                </div>
           </div>
           <div class="portlet-body">
               <div class="row">
                    <div class="col-md-12 "> 
                     <h5 id="H7">
                        <label for="fullname">ชื่อโครงการ</label>
                        <input type="text" class="form-control" id="Text5" name ="txtNName" placeholder="ชื่อโครงการ" runat="server">
                    </h5> 
                    </div> 
                   <div class="col-md-12 "> 
                     <h5 id="H45">
                        <label for="fullname">ชื่อกิจกรรม</label>
                        <input type="text" class="form-control" id="Text11" name ="txtNName" placeholder="ชื่อกิจกรรม" runat="server">
                    </h5> 
                    </div> 
                   
                   <div class="col-md-12 ">                 
                   <h5 id="H9">
                        <label for="fullname">หมายเหตุ </label>
                        <input type="text" class="form-control" id="Text4" name ="txtNName" placeholder="หมายเหตุ" runat="server">
                    </h5> 
                       </div>                  
                     <div class="col-md-12 ">    

                          <asp:Button ID="Button4" runat="server" Text="เพิ่ม" OnClick="Button_gp7_Click"/>
                          </div>     
                    </div>

            </div>
        </div>
        <div class="portlet box green">
           <div class="portlet-title">
               <div class="caption">
                    <i class="fa fa-cogs"></i>รายการบันทึก
               </div>
               <div class="tools">
                </div>
           </div>
           <div class="portlet-body">
              <div class="portlet-body flip-scroll">
                <table class="table table-bordered table-striped table-condensed flip-content">
                  <thead class="flip-content">
                  <tr>
                      <th width="25%"> ชื่อโครงการ </th>
                      <th width="20%"> กิจจกรรม</th>
                      <th width="8%"> ไฟล์แนบ ประเด็น1</th>
                      <th width="8%"> ไฟล์แนบ ประเด็น2</th>
                      <th width="8%"> ไฟล์แนบ ประเด็น3</th>
                      <th width="8%"> ไฟล์แนบ ประเด็น4</th>
                      <th width="8%"> ไฟล์แนบ ประเด็น5</th>
                     <th width="10%"> หมายเหตุ </th>
                     <th width="5%"> </th>
                 </tr>
                 </thead>
                   <tbody>
                        <% 
                        string tempLibary4 =renderdata4();
                        Response.Write(tempLibary4);
                    %>
                   </tbody>
                  </table>
               </div>                    
           </div>
       </div> 
        </div>
       <div id="group3" runat="server" class="col-md-12"> 
           <div class="portlet box green">
           <div class="portlet-title">
               <div class="caption">
                    <i class="fa fa-cogs"></i>ประเด็นการพิจารณา ผลการจัดการศึกษาอบรมที่เน้นผู้ศึกษาอบรมเป็นสำคัญ
               </div>
               <div class="tools">
                   
                </div>
           </div>
           <div class="portlet-body">
               <div class="row">
                    <div class="col-md-6 "> 
                     <h5 id="H29">
                        <label for="fullname">หลักสูตร</label>
                         <asp:DropDownList ID="DropDownList3" runat="server"></asp:DropDownList>
                    </h5> 
                    </div> 
                  <div class="col-md-6 "> 
                     <h5 id="H10">
                        <label for="fullname">ชื่อหลักสูตร อื่นๆ</label>
                         <input type="text" class="form-control" id="Text14" name ="txtNName" placeholder="ชื่อโครงการ" runat="server">  
                    </h5> 
                    </div> 
                   <div class="col-md-12 ">                 
                   <h5 id="H39">
                        <label for="fullname">หมายเหตุ </label>
                        <input type="text" class="form-control" id="Text12" name ="txtNName" placeholder="หมายเหตุ" runat="server">
                    </h5> 
                       </div>                  
                     <div class="col-md-12 ">    

                          <asp:Button ID="Button9" runat="server" Text="เพิ่ม" OnClick="Button_gp3_Click"/>
                          </div>     
                    </div>

            </div>
        </div>
        <div class="portlet box green">
           <div class="portlet-title">
               <div class="caption">
                    <i class="fa fa-cogs"></i>รายการบันทึก
               </div>
               <div class="tools">
                </div>
           </div>
           <div class="portlet-body">
                <div class="portlet-body flip-scroll">
                <table class="table table-bordered table-striped table-condensed flip-content">
                  <thead class="flip-content">
                  <tr>
                      <th width="29%"> หลักสูตร </th>
                      <th width="8%">ไฟล์แนบ ประเด็น1.1</th>
                      <th width="8%"> ไฟล์แนบ ประเด็น1.2</th>
                      <th width="8%"> ไฟล์แนบ ประเด็น2.1</th>
                      <th width="8%"> ไฟล์แนบ ประเด็น2.2</th>
                      <th width="8%"> ไฟล์แนบ ประเด็น3</th>
                      <th width="8%"> ไฟล์แนบ ประเด็น4</th>
                      <th width="8%"> ไฟล์แนบ ประเด็น5</th>
                     <th width="10%"> หมายเหตุ </th>
                     <th width="5%"> </th>
                 </tr>
                 </thead>
                   <tbody>
                        <% 
                        string tempLibary5 =renderdata5();
                        Response.Write(tempLibary5);
                    %>
                   </tbody>
                  </table>
               </div>      

           </div> 
       </div> 
        </div>

        <div id="group10" runat="server" class="col-md-12"> 
           <div class="portlet box green">
           <div class="portlet-title">
               <div class="caption">
                    <i class="fa fa-cogs"></i>ผลการดำเนินงาน
               </div>
               <div class="tools">
                   
                </div>
           </div>
           <div class="portlet-body">
               <div class="row">
                    <div class="col-md-12 "> 
                     <h5 id="H22">
                        <label for="fullname">ผลการดำเนินงาน</label>
                         <asp:TextBox Rows="10" Columns="80" ID="Text131"  class="form-control"  TextMode="multiLine" runat="server"> </asp:TextBox>

                    </h5> 
                    </div> 

                     <div class="col-md-12 ">    

                          <asp:Button ID="Button12" runat="server" Text="บันทึกข้อมูล" OnClick="Button_g103_Click"/>
                          </div>     
                    </div>

            </div>
        </div>
     </div>            
        </div>
    </div>   

</asp:Content>
