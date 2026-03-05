<%@ Page Language="C#" MasterPageFile="~/Police.Master"  AutoEventWireup="true" CodeBehind="activities_detail.aspx.cs" Inherits="newweb.USER_QA.activities_detail" %>

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
                    <i class="fa fa-cogs"></i>รายละเอียดกิจกรรม
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
                         <asp:TemplateField HeaderText="Activities detail" HeaderStyle-ForeColor="White">
                            <ItemTemplate>
                                 <asp:HyperLink ID="lnk" runat="server" Target="_self" Text='<%# Eval("Activitiesdetail") %>'
                                            NavigateUrl='<%# "activities_detail_list.aspx?ID=" +Eval("ID") %>'></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>  
                         <asp:BoundField DataField="passscore" HeaderText="Pass Score" />        
                        <asp:TemplateField>
                            <ItemTemplate>
                                 <asp:LinkButton runat="server" ID="LinkButton2" class="btn btn-info btn-circle btn-sm"  CommandArgument='<%# Eval("ID") %>' OnClick="Button12_Click">
                                    <i class="fa fa-check" aria-hidden="true"></i>
                                </asp:LinkButton>
                                 <asp:LinkButton runat="server" ID="LinkButton1" class="btn btn-success btn-circle btn-sm"  CommandArgument='<%# Eval("ID") %>' OnClick="Button3_Click">
                                    <i class="fa fa-paperclip" aria-hidden="true"></i>
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
                    SelectCommand="SELECT  [id] ,[Activitiesdetail],CASE  WHEN [Passascore] ='1' then 'pass' ELSE 'no result' END   as passscore FROM [QA_activities_detail] c where Active='1' and Activities=@Activities "  >
                <SelectParameters>
                         <asp:QueryStringParameter Name="Activities" QueryStringField="Activities" />                      
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
                    <h4 class="modal-title">Enter Project </h4>
                     <h2 id="txtFname">
                        <label for="fullname">Project Name </label>
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
</asp:Content>
