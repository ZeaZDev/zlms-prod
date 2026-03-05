<%@ Page Language="C#" MasterPageFile="~/Police.Master"  AutoEventWireup="true" CodeBehind="setpoll.aspx.cs" Inherits="newweb.QA_NEW.setpoll" %>

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
       <!-- BEGIN SAMPLE TABLE PORTLET-->
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
                    <div class="col-md-12 "> 
                     <h5 id="H22">
                        <label for="fullname">คำชี้แจง</label>
                         <asp:TextBox Rows="10" Columns="80" ID="Text131"  class="form-control"  TextMode="multiLine" runat="server"> </asp:TextBox>

                    </h5> 
                    </div> 

                     <div class="col-md-12 ">    

                          <asp:Button ID="Button12" runat="server" Text="บันทึกข้อมูล" OnClick="Button_g103_Click"/>
                          </div>     
                    </div>                  
           </div>
       </div>                             
        <!-- END SAMPLE TABLE PORTLET-->                      
        </div>
    </div>

    <div class="row">
       <div class="col-md-12">                               
       <!-- BEGIN SAMPLE TABLE PORTLET-->
       <div class="portlet box green">
           <div class="portlet-title">
               <div class="caption">
                    <i class="fa fa-cogs"></i>ตอนที่ ๑ ข้อมูลทั่วไปเกี่ยวกับผู้ตอบแบบสอบถาม
               </div>
               <div class="tools">
                    <a  class="" data-controls-modal="mdAdd" data-toggle="modal"   href="#mdAdd1" >
                        <i class="fa fa-plus"> </i> <span>Create New</span>
                     </a>
                </div>
           </div>
           <div class="portlet-body">
             <div class="table-responsive">
               <asp:GridView ID="GridView1" runat="server" class="table table-striped" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"  ShowFooter="false" >
                    <Columns>
                        <asp:TemplateField HeaderText="หัวข้อคำถาม">
                            <ItemTemplate>
                                 <asp:HyperLink ID="lnk" runat="server" Target="_self" Text='<%# Eval("indicator") %>'
                                            NavigateUrl='<%# "Poll_detail1.aspx?ID=" +Eval("ID") %>'></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField> 
                        <asp:BoundField DataField="Type1" HeaderText="ประเภท" />   
                        <asp:TemplateField>
                            <ItemTemplate>
                                 <asp:LinkButton runat="server"  ID="DeclineButton" class="btn btn-danger btn-circle btn-sm"  OnClientClick="return confirm('Are you sure you want to delete this event?');" CommandArgument='<%# Eval("ID") %>' OnClick="Button3_Click">
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
                    SelectCommand="SELECT  [id] ,indicator,[Type1] FROM [QA_Poll_main1] c where Active='1' and projectid=@projectid"  >
                <SelectParameters>
                         <asp:QueryStringParameter Name="projectid" QueryStringField="projectid" />                      
                   </SelectParameters>
                </asp:SqlDataSource>
       </div>                             
        <!-- END SAMPLE TABLE PORTLET-->                      
        </div>
    </div>

   <div class="row">
       <div class="col-md-12">                               
       <!-- BEGIN SAMPLE TABLE PORTLET-->
       <div class="portlet box green">
           <div class="portlet-title">
               <div class="caption">
                    <i class="fa fa-cogs"></i>List of หัวข้อคำถาม
               </div>
               <div class="tools">
                    <a  class="" data-controls-modal="mdAdd" data-toggle="modal"   href="#mdAdd" >
                        <i class="fa fa-plus"> </i> <span>Create New</span>
                     </a>
                </div>
           </div>
           <div class="portlet-body">
             <div class="table-responsive">
              <asp:GridView ID="gvDP" runat="server" class="table table-striped" AutoGenerateColumns="False" DataSourceID="sqlDP"  ShowFooter="false" >
                    <Columns>
                        <asp:TemplateField HeaderText="หัวข้อคำถาม">
                            <ItemTemplate>
                                 <asp:HyperLink ID="lnk" runat="server" Target="_self" Text='<%# Eval("indicator") %>'
                                            NavigateUrl='<%# "Poll_detail.aspx?ID=" +Eval("ID") %>'></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField> 
                        <asp:TemplateField>
                            <ItemTemplate>
                                 <asp:LinkButton runat="server"  ID="DeclineButton" class="btn btn-danger btn-circle btn-sm"  OnClientClick="return confirm('Are you sure you want to delete this event?');" CommandArgument='<%# Eval("ID") %>' OnClick="Button2_Click">
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
                    SelectCommand="SELECT  [id] ,indicator FROM [QA_Poll_main] c where Active='1' and projectid=@projectid"  >
                <SelectParameters>
                         <asp:QueryStringParameter Name="projectid" QueryStringField="projectid" />                      
                   </SelectParameters>
                </asp:SqlDataSource>
       </div>                             
        <!-- END SAMPLE TABLE PORTLET-->                      
        </div>
    </div>
     <div id="mdAdd" class="modal fade in" tabindex="-1" role="dialog" >
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Enter หัวข้อคำถาม </h4>
                     <h2 id="txtFname">
                        <label for="fullname">หัวข้อคำถาม </label>
                        <input type="text" class="form-control" id="txtNName" name ="txtNName" placeholder="Full name" runat="server">
                    </h2>                  
                   
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <asp:Button ID="bnAdduser" class="btn btn-primary"   runat="server" Text="Add" OnClick="bnAdduser_Click" />
                   
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div> 

      <div id="mdAdd1" class="modal fade in" tabindex="-1" role="dialog" >
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Enter QA Indicator </h4>
                     <h2 id="H2">
                        <label for="fullname">ข้อความ คำถาม </label>
                        <input type="text" class="form-control" id="Text2" name ="txtNName" placeholder="Full name" runat="server">
                    </h2>                  
                     <h2 id="H3">
                        <label for="fullname">ประเภทคำภาม </label>
                         <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
                    </h2>   
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <asp:Button ID="Button1" class="btn btn-primary"   runat="server" Text="Add" OnClick="bnAdduser1_Click" />
                   
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div> 
</asp:Content>
