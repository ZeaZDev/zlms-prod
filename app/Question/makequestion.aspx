<%@ Page Language="C#" MasterPageFile="~/Police.Master" AutoEventWireup="true" CodeBehind="makequestion.aspx.cs" Inherits="newweb.Question.makequestion" %>

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
           <span>Question</span>
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
                    <i class="fa fa-cogs"></i>Question Create
               </div>    
                <div class="tools">
                    <a  class="" data-controls-modal="mdAdd" data-toggle="modal"   href="#mdAdd" >
                        <i class="fa fa-plus"> </i> <span>Create New</span>
                     </a>
                </div>         
           </div>
           <div class="portlet-body">
             <div class="table-toolbar">              
              <asp:GridView ID="gvDP" runat="server" class="table table-striped table-bordered table-hover table-checkable order-column" OnRowDataBound="GridView1_RowDataBound" AutoGenerateColumns="False" DataSourceID="sqlDP"  AllowPaging="True" AllowSorting="True" ShowFooter="false" PageSize="20" BackColor="White" BorderColor="White" BorderStyle="None" BorderWidth="0px" CellPadding="3" HeaderStyle-BackColor="#006699">
                    <Columns> 
                         <asp:TemplateField HeaderText="Question_name" ItemStyle-Width="20%" HeaderStyle-ForeColor="White">
                             <ItemStyle HorizontalAlign="Left"></ItemStyle>
                            <ItemTemplate>
                                 <asp:HyperLink ID="lnk" runat="server" Target="_self" Text='<%# Eval("Question_name") %>'
                                            NavigateUrl='<%# "Questionmaker.aspx?ID=" +Eval("ID") %>'></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>   
                        <asp:BoundField DataField="Create_date" HeaderText="Create date" HeaderStyle-ForeColor="White" ItemStyle-Width="20%"/>  
                        <asp:TemplateField HeaderText="Action" HeaderStyle-ForeColor="White" ItemStyle-Width="20%">
                            <ItemTemplate>
                                 <asp:LinkButton runat="server" ID="EditButton" class="btn btn-warning btn-circle btn-sm"  CommandArgument='<%# Eval("ID") %>' OnClick="Button1_Click">
                                    <i class="fa fa-pencil" aria-hidden="true"></i>
                                </asp:LinkButton>
                                <asp:LinkButton runat="server"  ID="DeclineButton" class="btn btn-danger btn-circle btn-sm"  OnClientClick="return confirm('Are you sure you want to delete this period?');" CommandArgument='<%# Eval("ID") %>' OnClick="Button2_Click">
                                    <i class="fa fa-trash" aria-hidden="true"></i>
                                </asp:LinkButton>
                            
                            </ItemTemplate>
                        </asp:TemplateField>                                      
                    </Columns>
                </asp:GridView>      
              </div>                    
           </div>
           <asp:SqlDataSource ID="sqlDP" runat="server" ConnectionString="<%$ ConnectionStrings:cdas_conn %>"
                    SelectCommand="SELECT * from Question_select where active='1'"  >
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
                    <h4 class="modal-title">Question Create Name</h4>
                     <h2 id="txtFname">
                        <label for="fullname">Question Name</label>
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
