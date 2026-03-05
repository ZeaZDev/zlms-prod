<%@ Page Language="C#" MasterPageFile="~/Police.Master"  AutoEventWireup="true" CodeBehind="asset_list_1.aspx.cs" Inherits="newweb.USER_QA.asset_list_1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

td { white-space:pre }
</style>
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
                    <i class="fa fa-cogs"></i>ตัวบ่งชี้ <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
               </div>
               <div class="tools">
                 
                </div>
           </div>
           <div class="portlet-body">

            <table class="table table-bordered table-striped table-condensed flip-content">
                 <thead class="flip-content">
                      <tr>
                    <th width="80%">ตัวบ่งชี้</th>
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
                        <asp:Label ID="Label7" runat="server" Text="รวมคะแนน"></asp:Label></td>
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
                        <label for="fullname">จำนวนโครงการ/หลักสูตร </label>
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
                       <asp:TextBox ID="TextBox4" class="form-control" runat="server" Enabled="false"></asp:TextBox>
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
                    <i class="fa fa-cogs"></i>ผลของการดำเนินโครงการบริการทางวิชาการ
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
             <div class="table-responsive">
              <asp:GridView ID="GridView6" runat="server" class="table table-striped" AutoGenerateColumns="False" DataSourceID="SqlDataSource6"  ShowFooter="true"  OnRowDataBound="Gv_RowDataBound6" >
                    <Columns>
                        <asp:BoundField DataField="No" HeaderText="#" />  
                         <asp:BoundField DataField="project" HeaderText="หลักสูตร" />                          
                        <asp:BoundField DataField="total_result" HeaderText="ค่าเฉลี่ยความพึงพอใจของผู้บังคับบัญชา" />  
                          <asp:BoundField DataField="total_result1" HeaderText="ค่าเฉลี่ยความพึงพอใจของผู้เกี่ยวข้อง" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                 <asp:LinkButton runat="server"  ID="DeclineButton10" class="btn btn-danger btn-circle btn-sm"  OnClientClick="return confirm('Are you sure you want to delete this?');" CommandArgument='<%# Eval("ID") %>' OnClick="DELETE8_Click">
                                    <i class="fa fa-trash" aria-hidden="true"></i>
                                </asp:LinkButton>                            
                            </ItemTemplate>
                        </asp:TemplateField>    
                    </Columns>
                   <HeaderStyle Font-Size="Small" BackColor="#006699" Font-Bold="True" ForeColor="White" />
                </asp:GridView>      
              </div>                    
           </div>
           <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:cdas_conn %>"
                    SelectCommand="SELECT  ROW_NUMBER() OVER (ORDER BY id) AS No,[project],[total_result],[total_result],[total_result1],ID from QA_main_result where Standardid=@projectid and active='1' order by Standardid"  >
                 <SelectParameters>
                         <asp:QueryStringParameter Name="projectid" QueryStringField="projectid" />                      
                   </SelectParameters>
                </asp:SqlDataSource>
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
                     <h5 id="H17">
                        <label for="fullname">โครงการ/หลักสูตร </label>
                          <asp:TextBox ID="TextBox6" class="form-control" runat="server" ></asp:TextBox>
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
              <asp:GridView ID="GridView3" runat="server" class="table table-striped" AutoGenerateColumns="False" DataSourceID="SqlDataSource3"  ShowFooter="true"  OnRowDataBound="Gv_RowDataBound1" >
                    <Columns>
                        <asp:BoundField DataField="No" HeaderText="#" />  
                         <asp:BoundField DataField="project" HeaderText="รายชื่อโครงการ/หลักสูตร" />                          
                        <asp:BoundField DataField="total_result" HeaderText="ค่าเฉลี่ยความพึงพอใจของผู้ศึกษาอบรม" />  
                          <asp:TemplateField>
                            <ItemTemplate>
                                 <asp:LinkButton runat="server"  ID="DeclineButton6" class="btn btn-danger btn-circle btn-sm"  OnClientClick="return confirm('Are you sure you want to delete this?');" CommandArgument='<%# Eval("ID") %>' OnClick="DELETE4_Click">
                                    <i class="fa fa-trash" aria-hidden="true"></i>
                                </asp:LinkButton>                            
                            </ItemTemplate>
                        </asp:TemplateField>    
                    </Columns>
                   <HeaderStyle Font-Size="Small" BackColor="#006699" Font-Bold="True" ForeColor="White" />
                </asp:GridView>      
              </div>                    
           </div>
           <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:cdas_conn %>"
                    SelectCommand="SELECT  ROW_NUMBER() OVER (ORDER BY id) AS No,[project],[total_result],ID from QA_main_result where Standardid=@projectid and active='1'  order by Standardid"  >
                 <SelectParameters>
                         <asp:QueryStringParameter Name="projectid" QueryStringField="projectid" />                      
                   </SelectParameters>
                </asp:SqlDataSource>
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
                        <label for="fullname">จำนวนผู้ผ่านการอบรม </label>
                        <input type="text" class="form-control" id="Text3" name ="txtNName" placeholder="จำนวนผู้ผ่านการอบรม" runat="server">
                    </h5> 
                       </div> 
                   <div class="col-md-6 ">       
                    <h5 id="H2">
                        <label for="fullname">ระยะเวลาการฝึกอบรม (วัน)</label>
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
              <asp:GridView ID="gvDP" runat="server" class="table table-striped" AutoGenerateColumns="False" DataSourceID="sqlDP"  ShowFooter="true" OnRowDataBound="Gv_RowDataBound" >
                    <Columns>
                         <asp:BoundField DataField="activities" HeaderText="รายชื่อโครงการ/หลักสูตร" />  
                        <asp:BoundField DataField="Total" HeaderText="จำนวนผู้เข้าอบรม" />  
                        <asp:BoundField DataField="Score" HeaderText="จำนวนผู้ผ่านการอบรม" />  
                        <asp:BoundField DataField="period" HeaderText="ระยะเวลาการฝึกอบรม" />  
                              <asp:TemplateField>
                            <ItemTemplate>
                                 <asp:LinkButton runat="server"  ID="DeclineButton1" class="btn btn-danger btn-circle btn-sm"  OnClientClick="return confirm('Are you sure you want to delete this 1?');" CausesValidation="false" CommandArgument='<%# Eval("ID") %>' OnClick="DELETE3_Click">
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
                    SelectCommand="SELECT  q.[id],[activities] ,[period],[Total],[Score] FROM [QA_activities] q where q.Active='1' and q.[projectid]=@projectid order by projectid"  >
                 <SelectParameters>
                         <asp:QueryStringParameter Name="projectid" QueryStringField="projectid" />                      
                   </SelectParameters>
                </asp:SqlDataSource>
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
                        <label for="fullname">ระยะเวลา (วัน)</label>
                        <input type="text" class="form-control" id="Text9" name ="txtNName" placeholder="ระยะเวลา (วัน)" runat="server">
                    </h5> 
                       </div> 
                     <div class="col-md-12 ">                 
                   <h5 id="H24">
                        <label for="fullname">ไฟล์แนบกิจกกรม</label>
                       <asp:FileUpload ID="FileUpload7" runat="server" />
                    </h5> 
                       </div> 
                   <div class="col-md-12 ">       
                    <h5 id="H22">
                        <label for="fullname">การนำความรู้มาเผยแพร่ให้ผู้อื่นรับทราบ</label>
                        <asp:FileUpload ID="FileUpload8" runat="server" />
                    </h5> 
                      </div> 
                    <div class="col-md-12 ">       
                    <h5 id="H23">
                        <label for="fullname">การนำความรู้มาพัฒนาการเรียนการสอน</label>
                        <asp:FileUpload ID="FileUpload9" runat="server" />
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
             <div class="table-responsive">
                       <asp:GridView ID="GridView4" runat="server" class="table table-striped" AutoGenerateColumns="False" DataSourceID="SqlDataSource4"  ShowFooter="true" OnRowDataBound="Gv2_RowDataBound"  >
                    <Columns>
                        <asp:BoundField DataField="No" HeaderText="#" />  
                        <asp:BoundField DataField="name" HeaderText="รายชื่อครู/อาจารย์ ครูฝึก" />     
                         <asp:BoundField DataField="project" HeaderText="ชื่อโครงการ/กิจกรรมที่เข้ารับการเพิ่มพูนความรู้/ประสบการณ์" />    
                        <asp:BoundField DataField="timex" HeaderText="ระยะเวลา" />  
                        <asp:TemplateField HeaderText="ไฟล์โครงการ/กิจกรรม">
                            <ItemTemplate>
                                 <asp:HyperLink ID="lnk" runat="server" Target="_blank" Text='<%# Eval("file1") %>'
                                            NavigateUrl='<%# "/QAFILE/" +Eval("id")+"/"+Eval("file1") %>'></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>  
                          <asp:TemplateField HeaderText="การนำความรู้มาเผยแพร่ให้ผู้อื่นรับทราบ">
                            <ItemTemplate>
                                 <asp:HyperLink ID="HyperLink2" runat="server" Target="_blank" Text='<%# Eval("file2") %>'
                                            NavigateUrl='<%# "/QAFILE/" +Eval("id")+"/"+Eval("file2") %>'></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>  
                          <asp:TemplateField HeaderText="การนำความรู้มาพัฒนาการเรียนการสอน">
                            <ItemTemplate>
                                 <asp:HyperLink ID="HyperLink3" runat="server" Target="_blank" Text='<%# Eval("file3") %>'
                                            NavigateUrl='<%# "/QAFILE/" +Eval("id")+"/"+Eval("file3") %>'></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField> 
                          <asp:TemplateField>
                            <ItemTemplate>
                                 <asp:LinkButton runat="server"  ID="DeclineButton2" class="btn btn-danger btn-circle btn-sm"  OnClientClick="return confirm('Are you sure you want to delete this?');" CommandArgument='<%# Eval("IDX") %>' OnClick="DELETE5_Click">
                                    <i class="fa fa-trash" aria-hidden="true"></i>
                                </asp:LinkButton>                            
                            </ItemTemplate>
                        </asp:TemplateField>     
                    </Columns>
                   <HeaderStyle Font-Size="Small" BackColor="#006699" Font-Bold="True" ForeColor="White" />
                </asp:GridView>    
              </div>                    
           </div>
          <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:cdas_conn %>"
                    SelectCommand="SELECT  ROW_NUMBER() OVER (ORDER BY id) AS No,[project],[NAME],[timex],[file1],[file2],[file3],Standardid as id,ID as IDX from QA_main_result where Standardid=@projectid and active='1'  order by Standardid"  >
                 <SelectParameters>
                         <asp:QueryStringParameter Name="projectid" QueryStringField="projectid" />                      
                   </SelectParameters>
                </asp:SqlDataSource>
       </div>    

        </div>
        <div id="group9" runat="server" class="col-md-12"> 
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
                     <h5 id="H4">
                        <label for="fullname">ประเด็นการพิจาราณา </label>
                         <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
                    </h5> 
                    </div> 
                   <div class="col-md-12 ">                 
                   <h5 id="H5">
                        <label for="fullname">แนบไฟล์ </label>
                       <asp:FileUpload ID="FileUpload1" runat="server" />
                       <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                    </h5> 
                       </div> 
                   <div class="col-md-12 ">                 
                   <h5 id="H6">
                        <label for="fullname">หมายเหตุ </label>
                        <input type="text" class="form-control" id="Text6" name ="txtNName" placeholder="หมายเหตุ" runat="server">
                    </h5> 
                       </div>                  
                     <div class="col-md-12 ">    

                          <asp:Button ID="Button3" runat="server" Text="เพิ่ม" OnClick="Button_gp9_Click"/>
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
             <div class="table-responsive">
              <asp:GridView ID="GridView1" runat="server" class="table table-striped" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"  ShowFooter="false">
                    <Columns>
                         <asp:BoundField DataField="Standard_detail" HeaderText="ประเด็นการพิจารณา" />   
                          <asp:TemplateField HeaderText="ชื่อไฟล์แนบ">
                            <ItemTemplate>
                                 <asp:HyperLink ID="HyperLink4" runat="server" Target="_blank" Text='<%# Eval("file1") %>'
                                            NavigateUrl='<%# "/QAFILE/" +Eval("id")+"/"+Eval("file1") %>'></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>  
                        <asp:BoundField DataField="remark" HeaderText="หมายเหตุ" />  
                          <asp:TemplateField>
                            <ItemTemplate>
                                 <asp:LinkButton runat="server"  ID="DeclineButton3" class="btn btn-danger btn-circle btn-sm"  OnClientClick="return confirm('Are you sure you want to delete this?');" CommandArgument='<%# Eval("ID") %>' OnClick="DELETE1_Click">
                                    <i class="fa fa-trash" aria-hidden="true"></i>
                                </asp:LinkButton>                            
                            </ItemTemplate>
                        </asp:TemplateField>                                       
                    </Columns>
                   <HeaderStyle Font-Size="Small" BackColor="#006699" Font-Bold="True" ForeColor="White" />
                </asp:GridView>      
              </div>                    
           </div>
           <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cdas_conn %>"
                    SelectCommand="SELECT  q.[project],q.[NAME],q.[timex],q.[file1],q.[remark],qd.Standard_detail,qd.id FROM [QA_main_result] q inner join QA_standard_detail_add qd on qd.id=q.Standardid where qd.Standardid=@projectid and q.active='1' order by q.Standardid"  >
                 <SelectParameters>
                         <asp:QueryStringParameter Name="projectid" QueryStringField="projectid" />                      
                   </SelectParameters>
                </asp:SqlDataSource>
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
                   <div class="col-md-6 ">                 
                   <h5 id="H8">
                        <label for="fullname">แนบไฟล์ ประเด็น1 </label>
                       <asp:FileUpload ID="FileUpload2" runat="server" />
                    </h5> 
                       </div> 
                    <div class="col-md-6 ">                 
                   <h5 id="H10">
                        <label for="fullname">แนบไฟล์ ประเด็น2 </label>
                       <asp:FileUpload ID="FileUpload3" runat="server" />
                    </h5> 
                       </div> 
                    <div class="col-md-6 ">                 
                   <h5 id="H11">
                        <label for="fullname">แนบไฟล์ ประเด็น3 </label>
                       <asp:FileUpload ID="FileUpload4" runat="server" />
                    </h5> 
                       </div> 
                    <div class="col-md-6 ">                 
                   <h5 id="H12">
                        <label for="fullname">แนบไฟล์ ประเด็น4 </label>
                       <asp:FileUpload ID="FileUpload5" runat="server" />
                    </h5> 
                       </div> 
                    <div class="col-md-6 ">                 
                   <h5 id="H13">
                        <label for="fullname">แนบไฟล์ ประเด็น5 </label>
                       <asp:FileUpload ID="FileUpload6" runat="server" />
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
             <div class="table-responsive">
              <asp:GridView ID="GridView2" runat="server" class="table table-striped" AutoGenerateColumns="False" DataSourceID="SqlDataSource2"  ShowFooter="false">
                    <Columns>
                         <asp:BoundField DataField="project" HeaderText="ชื่อโครงการ" />                       
                          <asp:TemplateField HeaderText="ชื่อไฟล์แนบ ประเด็น1">
                            <ItemTemplate>
                                 <asp:HyperLink ID="HyperLink5" runat="server" Target="_blank" Text='<%# Eval("file1") %>'
                                            NavigateUrl='<%# "/QAFILE/" +Eval("id")+"/"+Eval("file1") %>'></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>  
                          <asp:TemplateField HeaderText="ชื่อไฟล์แนบ ประเด็น2">
                            <ItemTemplate>
                                 <asp:HyperLink ID="HyperLink6" runat="server" Target="_blank" Text='<%# Eval("file2") %>'
                                            NavigateUrl='<%# "/QAFILE/" +Eval("id")+"/"+Eval("file2") %>'></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>  
                          <asp:TemplateField HeaderText="ชื่อไฟล์แนบ ประเด็น3">
                            <ItemTemplate>
                                 <asp:HyperLink ID="HyperLink7" runat="server" Target="_blank" Text='<%# Eval("file3") %>'
                                            NavigateUrl='<%# "/QAFILE/" +Eval("id")+"/"+Eval("file3") %>'></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>  
                          <asp:TemplateField HeaderText="ชื่อไฟล์แนบ ประเด็น4">
                            <ItemTemplate>
                                 <asp:HyperLink ID="HyperLink8" runat="server" Target="_blank" Text='<%# Eval("file4") %>'
                                            NavigateUrl='<%# "/QAFILE/" +Eval("id")+"/"+Eval("file4") %>'></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>  
                          <asp:TemplateField HeaderText="ชื่อไฟล์แนบ ประเด็น5">
                            <ItemTemplate>
                                 <asp:HyperLink ID="HyperLink9" runat="server" Target="_blank" Text='<%# Eval("file5") %>'
                                            NavigateUrl='<%# "/QAFILE/" +Eval("id")+"/"+Eval("file5") %>'></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>  
                        <asp:BoundField DataField="remark" HeaderText="หมายเหตุ" />  
                          <asp:TemplateField>
                            <ItemTemplate>
                                 <asp:LinkButton runat="server"  ID="DeclineButton4" class="btn btn-danger btn-circle btn-sm"  OnClientClick="return confirm('Are you sure you want to delete this?');" CommandArgument='<%# Eval("ID") %>' OnClick="DELETE6_Click">
                                    <i class="fa fa-trash" aria-hidden="true"></i>
                                </asp:LinkButton>                            
                            </ItemTemplate>
                        </asp:TemplateField>                                      
                    </Columns>
                   <HeaderStyle Font-Size="Small" BackColor="#006699" Font-Bold="True" ForeColor="White" />
                </asp:GridView>      
              </div>                    
           </div>
           <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cdas_conn %>"
                    SelectCommand="SELECT  q.[project],q.[NAME],q.[timex],q.[file1],q.[remark],qd.Standard_detail,qd.id,[total_result],q.[file2],q.[file3],q.[file4],q.[file5] FROM [QA_main_result] q inner join QA_standard_detail_add qd on qd.id=q.Standardid where qd.id=@projectid and q.active='1' "  >
                 <SelectParameters>
                         <asp:QueryStringParameter Name="projectid" QueryStringField="projectid" />                      
                   </SelectParameters>
                </asp:SqlDataSource>
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
                    <div class="col-md-12 "> 
                     <h5 id="H29">
                        <label for="fullname">หลักสูตร</label>
                         <asp:DropDownList ID="DropDownList3" runat="server"></asp:DropDownList>
                    </h5> 
                    </div> 
                   <div class="col-md-6 ">                 
                   <h5 id="H30">
                        <label for="fullname">แนบไฟล์ ประเด็น ๑.๑ </label>
                       <asp:FileUpload ID="FileUpload10" runat="server" />
                    </h5> 
                       </div> 
                    <div class="col-md-6 ">                 
                   <h5 id="H35">
                        <label for="fullname">แนบไฟล์ ประเด็น ๑.๒ </label>
                       <asp:FileUpload ID="FileUpload11" runat="server" />
                    </h5> 
                       </div> 
                    <div class="col-md-6 ">                 
                   <h5 id="H36">
                        <label for="fullname">แนบไฟล์ ประเด็น ๒.๑ </label>
                       <asp:FileUpload ID="FileUpload12" runat="server" />
                    </h5> 
                       </div> 
                    <div class="col-md-6 ">                 
                   <h5 id="H37">
                        <label for="fullname">แนบไฟล์ ประเด็น ๒.๒ </label>
                       <asp:FileUpload ID="FileUpload13" runat="server" />
                    </h5> 
                       </div> 
                    <div class="col-md-6 ">                 
                   <h5 id="H38">
                        <label for="fullname">แนบไฟล์ ประเด็น ๓ </label>
                       <asp:FileUpload ID="FileUpload14" runat="server" />
                    </h5> 
                       </div> 
                     <div class="col-md-6 ">                 
                   <h5 id="H40">
                        <label for="fullname">แนบไฟล์ ประเด็น ๔ </label>
                       <asp:FileUpload ID="FileUpload15" runat="server" />
                    </h5> 
                       </div> 
                     <div class="col-md-6 ">                 
                   <h5 id="H41">
                        <label for="fullname">แนบไฟล์ ประเด็น ๕ </label>
                       <asp:FileUpload ID="FileUpload16" runat="server" />
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
             <div class="table-responsive">
              <asp:GridView ID="GridView5" runat="server" class="table table-striped" AutoGenerateColumns="False" DataSourceID="SqlDataSource5"  ShowFooter="false">
                    <Columns>
                         <asp:BoundField DataField="project" HeaderText="ชื่อโครงการ" />                       
                          <asp:TemplateField HeaderText="ชื่อไฟล์แนบ ประเด็น ๑.๑ ">
                            <ItemTemplate>
                                 <asp:HyperLink ID="HyperLink10" runat="server" Target="_blank" Text='<%# Eval("file1") %>'
                                            NavigateUrl='<%# "/QAFILE/" +Eval("id")+"/"+Eval("file1") %>'></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>  
                          <asp:TemplateField HeaderText="ชื่อไฟล์แนบ ประเด็น ๑.๒">
                            <ItemTemplate>
                                 <asp:HyperLink ID="HyperLink11" runat="server" Target="_blank" Text='<%# Eval("file2") %>'
                                            NavigateUrl='<%# "/QAFILE/" +Eval("id")+"/"+Eval("file2") %>'></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>  
                          <asp:TemplateField HeaderText="ชื่อไฟล์แนบ ประเด็น ๒.๑">
                            <ItemTemplate>
                                 <asp:HyperLink ID="HyperLink12" runat="server" Target="_blank" Text='<%# Eval("file3") %>'
                                            NavigateUrl='<%# "/QAFILE/" +Eval("id")+"/"+Eval("file3") %>'></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>  
                          <asp:TemplateField HeaderText="ชื่อไฟล์แนบ ประเด็น ประเด็น ๒.๒">
                            <ItemTemplate>
                                 <asp:HyperLink ID="HyperLink13" runat="server" Target="_blank" Text='<%# Eval("file4") %>'
                                            NavigateUrl='<%# "/QAFILE/" +Eval("id")+"/"+Eval("file4") %>'></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>  
                          <asp:TemplateField HeaderText="ชื่อไฟล์แนบ ประเด็น ๓">
                            <ItemTemplate>
                                 <asp:HyperLink ID="HyperLink14" runat="server" Target="_blank" Text='<%# Eval("file5") %>'
                                            NavigateUrl='<%# "/QAFILE/" +Eval("id")+"/"+Eval("file5") %>'></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>  
                        <asp:TemplateField HeaderText="ชื่อไฟล์แนบ ประเด็น ๔">
                            <ItemTemplate>
                                 <asp:HyperLink ID="HyperLink15" runat="server" Target="_blank" Text='<%# Eval("file5") %>'
                                            NavigateUrl='<%# "/QAFILE/" +Eval("id")+"/"+Eval("file6") %>'></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>  
                        <asp:TemplateField HeaderText="ชื่อไฟล์แนบ ประเด็น ๕">
                            <ItemTemplate>
                                 <asp:HyperLink ID="HyperLink16" runat="server" Target="_blank" Text='<%# Eval("file5") %>'
                                            NavigateUrl='<%# "/QAFILE/" +Eval("id")+"/"+Eval("file7") %>'></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>  
                        <asp:BoundField DataField="remark" HeaderText="หมายเหตุ" />  
                         <asp:TemplateField>
                            <ItemTemplate>
                                 <asp:LinkButton runat="server"  ID="DeclineButton5" class="btn btn-danger btn-circle btn-sm"  OnClientClick="return confirm('Are you sure you want to delete this?');" CommandArgument='<%# Eval("ID") %>' OnClick="DELETE8_Click">
                                    <i class="fa fa-trash" aria-hidden="true"></i>
                                </asp:LinkButton>                            
                            </ItemTemplate>
                        </asp:TemplateField>                                       
                    </Columns>
                   <HeaderStyle Font-Size="Small" BackColor="#006699" Font-Bold="True" ForeColor="White" />
                </asp:GridView>      
              </div>                    
           </div>
           <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:cdas_conn %>"
                    SelectCommand="SELECT  q.[project],q.[NAME],q.[timex],q.[file1],q.[remark],qd.Standard_detail,qd.id,[total_result],q.[file2],q.[file3],q.[file4],q.[file5],q.[file6],q.[file7] FROM [QA_main_result] q inner join QA_standard_detail_add qd on qd.id=q.Standardid where q.Standardid=@projectid and q.active='1' "  >
                 <SelectParameters>
                         <asp:QueryStringParameter Name="projectid" QueryStringField="projectid" />                      
                   </SelectParameters>
                </asp:SqlDataSource>
       </div> 
        </div>




        </div>
    </div>
</asp:Content>
