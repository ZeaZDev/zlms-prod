<%@ Page Language="C#" MasterPageFile="~/Police.Master"  AutoEventWireup="true" CodeBehind="Activities.aspx.cs" Inherits="newweb.QA_NEW.Activities" %>

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
           <a href="<%= ResolveUrl("~/QA/") %>">QA</a>
           <i class="fa fa-circle"></i>
       </li>
       <li>
           <span>QA Project Activities</span>
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
                    <i class="fa fa-cogs"></i>รายชื่อโครงการ/หลักสูตร
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
                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                 <asp:HyperLink ID="lnk" runat="server" Target="_self" Text='<%# Eval("activities") %>'
                                            NavigateUrl='<%# "activities_detail.aspx?ID=" +Eval("ID") %>'></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField> 
                        <asp:BoundField DataField="Total" HeaderText="จำนวนผู้เข้าอบรม" />  
                        <asp:BoundField DataField="period" HeaderText="ระยะเวลาการฝึกอบรม" />  
                        <asp:TemplateField>
                            <ItemTemplate>
                                   <asp:LinkButton runat="server" ID="LinkButton1" class="btn btn-warning  btn-sm"  CommandArgument='<%# Eval("ID") %>' OnClick="Button3_Click">
                                    <i class="fa fa-pencil" aria-hidden="true"></i>
                                </asp:LinkButton>
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
                    SelectCommand="SELECT  q.[id],[activities] ,[period],[Total],u.[Name] FROM [QA_activities] q inner join List_main u on u.id =q.Responsible where q.Active='1' and q.[projectid]=@projectid"  >
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
                    <h4 class="modal-title">Enter Project Activities</h4>
                     <h2 id="txtFname">
                        <label for="fullname">ชื่อโครงการ/หลักสูตร </label>
                        <input type="text" class="form-control" id="txtNName" name ="txtNName" placeholder="Full name" runat="server">
                    </h2>                  
                   <h2 id="H1">
                        <label for="fullname">จำนวนผู้เข้าอบรม </label>
                        <input type="text" class="form-control" id="Text1" name ="txtNName" placeholder="Full name" runat="server">
                    </h2> 
                    <h2 id="H2">
                        <label for="fullname">ระยะเวลาการฝึกอบรม (วัน)</label>
                          <input type="text" class="form-control" id="Text2" name ="txtNName" placeholder="Full name" runat="server">
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
</asp:Content>
