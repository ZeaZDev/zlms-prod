<%@ Page Language="C#" MasterPageFile="~/Police_user.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="newweb.Course_user.profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="body" runat="server">
    <div class="content">
            <!-- BEGIN LOGIN FORM -->
            <form id="form1" runat="server">
                <div class="row">
                            <div class="col-md-12">     
                                <div class="portlet box blue">
                                    <div class="portlet-title">
                                        <div class="caption">
                                            <i class="fa fa-gift"></i>Sign Up </div>
                                        <div class="tools">
                                           
                                        </div>
                                    </div>
                                    <div class="portlet-body">
                                        <div class="row">
                                            <div class="col-md-3 col-sm-3 col-xs-3">
                                                <ul class="nav nav-tabs tabs-left">
                                                    <li class="active">
                                                        <a href="#tab_6_1" data-toggle="tab"> Personal </a>
                                                    </li>
                                                    <li>
                                                        <a href="#tab_6_2" data-toggle="tab"> ที่อยู่ตามทะเบียนบ้าน </a>
                                                    </li>                                                    
                                                    <li>
                                                        <a href="#tab_6_3" data-toggle="tab"> ที่อยู่ปัจจุบัน </a>
                                                    </li>
                                                    <li>
                                                        <a href="#tab_6_4" data-toggle="tab"> ประวัติการฝึกอบรม </a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="col-md-9 col-sm-9 col-xs-9">
                                                <div class="tab-content">
                                                    <div class="tab-pane active" id="tab_6_1">
                                                        <div class="form-group">
                                                            <label class="control-label visible-ie8 visible-ie9">Username</label>
                                                            <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="Username" id="txtusername" runat="server"/> </div>
                                                        <div class="form-group">
                                                            <label class="control-label visible-ie8 visible-ie9">Password</label>
                                                            <input class="form-control placeholder-no-fix" type="password" autocomplete="off"  placeholder="Password" id="txtpassword" runat="server"/> </div>
                                                        <div class="form-group">
                                                            <label class="control-label visible-ie8 visible-ie9">Re-type Your Password</label>
                                                            <input class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="Re-type Your Password" id="txtrpassword" runat="server"/> </div>
                                                        <div class="form-group">
                                                            <label class="control-label visible-ie8 visible-ie9">ยศ ชื่อ สกุล</label>
                                                            <input class="form-control placeholder-no-fix" type="text" placeholder="Full Name" id="name" runat="server"/> </div>
                                                        <div class="form-group">
                                                            <label class="control-label visible-ie8 visible-ie9">ยศ ชื่อ สกุล (ภาษาอังกฤษ)</label>
                                                            <input class="form-control placeholder-no-fix" type="text" placeholder="Full Name" id="nameeng" runat="server"/> </div>
                                                        <div class="form-group">
                                                            <label class="control-label visible-ie8 visible-ie9">วัน เดือน ปีเกิด</label>
                                                            <input class="form-control placeholder-no-fix" type="text" placeholder="Full Name" id="birdthdate" runat="server"/> </div>
                                                        <div class="form-group">
                                                            <label class="control-label visible-ie8 visible-ie9">อายุ</label>
                                                            <input class="form-control placeholder-no-fix" type="text" placeholder="Full Name" id="age" runat="server"/> </div>
                                                        <div class="form-group">
                                                            <label class="control-label visible-ie8 visible-ie9">โทรศัพท์มือถือ</label>
                                                            <input class="form-control placeholder-no-fix" type="text" placeholder="Full Name" id="Tel" runat="server"/> </div>
                                                        <div class="form-group">
                                                            <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
                                                            <label class="control-label visible-ie8 visible-ie9">Email</label>
                                                            <input class="form-control placeholder-no-fix" type="text" placeholder="Email" maxlength="100" id="email" runat="server"/> </div>
                                                          
                                                        <div class="form-group">
                                                            <label class="control-label visible-ie8 visible-ie9">หมายเลขบัตรประชาชน</label>
                                                            <input class="form-control placeholder-no-fix" type="text" placeholder="หมายเลขบัตรประชาชน" maxlength="13" id="Citizenid" runat="server"/> </div>   
                                                        <div class="form-group">
                                                            <label class="control-label visible-ie8 visible-ie9">บัตรข้าราชการ</label>
                                                            <input class="form-control placeholder-no-fix" type="text" placeholder="บัตรข้าราชการ" maxlength="20" id="Cardno" runat="server"/> </div>   
                                                    </div>
                                                    <div class="tab-pane fade" id="tab_6_2">
                                                       <div class="form-group">
                                                            <label class="control-label visible-ie8 visible-ie9">Address</label>
                                                            <input class="form-control placeholder-no-fix" type="text" placeholder="ที่อยู่" id="address" runat="server"/> </div>
                                                         <div class="form-group">
                                                            <label class="control-label visible-ie8 visible-ie9">ถนน</label>
                                                            <input class="form-control placeholder-no-fix" type="text" placeholder="ถนน" id="road" runat="server"/> </div>
                                                        <div class="form-group">
                                                            <label class="control-label visible-ie8 visible-ie9">แขวง/ตำบล</label>
                                                            <input class="form-control placeholder-no-fix" type="text" placeholder="แขวง/ตำบล" id="Subdistrict" runat="server"/> </div>     
                                                        <div class="form-group">
                                                            <label class="control-label visible-ie8 visible-ie9">เขต/อำเภอ</label>
                                                            <input class="form-control placeholder-no-fix" type="text" placeholder="เขต/อำเภอ" id="District" runat="server"/> </div>   
                                                        <div class="form-group">
                                                            <label class="control-label visible-ie8 visible-ie9">จังหวัด</label>
                                                            <input class="form-control placeholder-no-fix" type="text" placeholder="จังหวัด" id="Province" runat="server"/> </div>        
                                                        <div class="form-group">
                                                            <label class="control-label visible-ie8 visible-ie9">รหัสไปรษณีย์</label>
                                                            <input class="form-control placeholder-no-fix" type="text" placeholder="รหัสไปรษณีย์" id="postcode" runat="server"/> </div>  
                                                    </div>
                                                    <div class="tab-pane fade" id="tab_6_3">
                                                        <div class="form-group">
                                                            <label class="control-label visible-ie8 visible-ie9">Address</label>
                                                            <input class="form-control placeholder-no-fix" type="text" placeholder="ที่อยู่" id="waddress" runat="server"/> </div>
                                                         <div class="form-group">
                                                            <label class="control-label visible-ie8 visible-ie9">ถนน</label>
                                                            <input class="form-control placeholder-no-fix" type="text" placeholder="ถนน" id="wroad" runat="server"/> </div>
                                                        <div class="form-group">
                                                            <label class="control-label visible-ie8 visible-ie9">แขวง/ตำบล</label>
                                                            <input class="form-control placeholder-no-fix" type="text" placeholder="แขวง/ตำบล" id="wSubdistrict" runat="server"/> </div>     
                                                        <div class="form-group">
                                                            <label class="control-label visible-ie8 visible-ie9">เขต/อำเภอ</label>
                                                            <input class="form-control placeholder-no-fix" type="text" placeholder="เขต/อำเภอ" id="wDistrict" runat="server"/> </div>   
                                                        <div class="form-group">
                                                            <label class="control-label visible-ie8 visible-ie9">จังหวัด</label>
                                                            <input class="form-control placeholder-no-fix" type="text" placeholder="จังหวัด" id="wProvince" runat="server"/> </div>        
                                                        <div class="form-group">
                                                            <label class="control-label visible-ie8 visible-ie9">รหัสไปรษณีย์</label>
                                                            <input class="form-control placeholder-no-fix" type="text" placeholder="รหัสไปรษณีย์" id="wpostcode" runat="server"/> </div>  
                                                    </div>
                                                    <div class="tab-pane fade" id="tab_6_4">
                                                        <div class="form-group">
                                                            1.
                                                            <label class="control-label visible-ie8 visible-ie9">หลักสูตร</label>
                                                            <input class="form-control placeholder-no-fix" type="text" placeholder="หลักสูตร" id="Text1" runat="server"/> 
                                                            <label class="control-label visible-ie8 visible-ie9">ชื่อสถานที่ฝึกอบรม</label>
                                                            <input class="form-control placeholder-no-fix" type="text" placeholder="ชื่อสถานที่ฝึกอบรม" id="Text3" runat="server"/>
                                                            <label class="control-label visible-ie8 visible-ie9">ระยะเวลา</label>
                                                            <input class="form-control placeholder-no-fix" type="text" placeholder="ระยะเวลา" id="Text4" runat="server"/>
                                                            <label class="control-label visible-ie8 visible-ie9">ปีที่สำเร็จ</label>
                                                            <input class="form-control placeholder-no-fix" type="text" placeholder="ปีที่สำเร็จ" id="Text5" runat="server"/>
                                                        </div>
                                                          <div class="form-group">
                                                            2.
                                                            <label class="control-label visible-ie8 visible-ie9">หลักสูตร</label>
                                                            <input class="form-control placeholder-no-fix" type="text" placeholder="หลักสูตร" id="Text2" runat="server"/> 
                                                            <label class="control-label visible-ie8 visible-ie9">ชื่อสถานที่ฝึกอบรม</label>
                                                            <input class="form-control placeholder-no-fix" type="text" placeholder="ชื่อสถานที่ฝึกอบรม" id="Text6" runat="server"/>
                                                            <label class="control-label visible-ie8 visible-ie9">ระยะเวลา</label>
                                                            <input class="form-control placeholder-no-fix" type="text" placeholder="ระยะเวลา" id="Text7" runat="server"/>
                                                            <label class="control-label visible-ie8 visible-ie9">ปีที่สำเร็จ</label>
                                                            <input class="form-control placeholder-no-fix" type="text" placeholder="ปีที่สำเร็จ" id="Text8" runat="server"/>

                                                    </div>
                                                          <div class="form-group">
                                                            3.
                                                            <label class="control-label visible-ie8 visible-ie9">หลักสูตร</label>
                                                            <input class="form-control placeholder-no-fix" type="text" placeholder="หลักสูตร" id="Text9" runat="server"/> 
                                                            <label class="control-label visible-ie8 visible-ie9">ชื่อสถานที่ฝึกอบรม</label>
                                                            <input class="form-control placeholder-no-fix" type="text" placeholder="ชื่อสถานที่ฝึกอบรม" id="Text10" runat="server"/>
                                                            <label class="control-label visible-ie8 visible-ie9">ระยะเวลา</label>
                                                            <input class="form-control placeholder-no-fix" type="text" placeholder="ระยะเวลา" id="Text11" runat="server"/>
                                                            <label class="control-label visible-ie8 visible-ie9">ปีที่สำเร็จ</label>
                                                            <input class="form-control placeholder-no-fix" type="text" placeholder="ปีที่สำเร็จ" id="Text12" runat="server"/>

                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                       <div class="portlet-body">
                                           <div class="row">
                                                <div class="col-md-12">    
                     <div class="form-actions">
                       <asp:Button ID="bnsubmit" runat="server" Text="Submit" class="btn btn-success uppercase pull-Left" OnClick="bnLogin_Click" />
                     </div>   
                                               </div>
                                        </div>
                                </div>   
                                
                            </div> 
                         
                      </div>                   
                   </div>                     
                
                
            </form>
        </div>
</asp:Content>
