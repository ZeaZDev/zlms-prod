<%@ Page Language="C#"  MasterPageFile="~/Police.Master" AutoEventWireup="true" CodeBehind="Questiondetail.aspx.cs" Inherits="newweb.Question.Questiondetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <link href="../assets/global/plugins/datatables/datatables.min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css" />
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
                    <i class="fa fa-cogs"></i>Question Group
               </div>    
                <div class="tools">
                    <a  class="" data-controls-modal="mdAdd1" data-toggle="modal"   href="#mdAdd1" >
                        <i class="fa fa-plus"> </i> <span>Create New</span>
                     </a>
                </div>         
           </div>
           <div class="portlet-body">
             <div class="table-responsive">
              <asp:GridView ID="GridView1" runat="server" class="table table-striped" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"  AllowPaging="True" AllowSorting="True" ShowFooter="false" PageSize="20" BackColor="White" BorderColor="White" BorderStyle="None" BorderWidth="0px" CellPadding="3" HeaderStyle-BackColor="#006699">
                    <Columns>
  
                        <asp:BoundField DataField="QuestiongroupName" HeaderText="Question Group" HeaderStyle-ForeColor="White"/>  
                        <asp:TemplateField HeaderText="Action" HeaderStyle-ForeColor="White">
                            <ItemTemplate>
                                 <asp:LinkButton runat="server" ID="EditButton" class="btn btn-warning btn-circle btn-sm"  CommandArgument='<%# Eval("ID") %>' OnClick="Button1_Click">
                                    <i class="fa fa-pencil" aria-hidden="true"></i>
                                </asp:LinkButton>
                                <asp:LinkButton runat="server"  ID="DeclineButton" class="btn btn-danger btn-circle btn-sm"  OnClientClick="return confirm('Are you sure you want to delete this period?');" CommandArgument='<%# Eval("ID") %>' OnClick="Button3_Click">
                                    <i class="fa fa-trash" aria-hidden="true"></i>
                                </asp:LinkButton>
                            
                            </ItemTemplate>
                        </asp:TemplateField>                                      
                    </Columns>
                </asp:GridView>      
              </div>                    
           </div>
           <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cdas_conn %>"
                    SelectCommand="SELECT * from Questiongroup qd where qd.active='1' and Questionid=@Questionid "  >
                 <SelectParameters>
                         <asp:QueryStringParameter Name="Questionid" QueryStringField="Questionid" />                      
                   </SelectParameters>
                </asp:SqlDataSource>
       </div>                             
        <!-- END SAMPLE TABLE PORTLET-->                      
        </div>
      <div class="col-md-12">                               
       <!-- BEGIN SAMPLE TABLE PORTLET-->
       <div class="portlet box green">
           <div class="portlet-title">
               <div class="caption">
                    <i class="fa fa-cogs"></i>Question List
               </div>    
                <div class="tools">
                    <a  class="" data-controls-modal="mdAdd" data-toggle="modal"   href="#mdAdd" >
                        <i class="fa fa-plus"> </i> <span>Create New</span>
                     </a>
                </div>         
           </div>
           <div class="portlet-body">
             <div class="table-toolbar">      
              <asp:GridView ID="gvDP" runat="server"  class="table table-striped table-bordered table-hover table-checkable order-column" OnRowDataBound="GridView1_RowDataBound"  AutoGenerateColumns="False" DataSourceID="sqlDP"  AllowPaging="false" AllowSorting="True" ShowFooter="false" BackColor="White" BorderColor="White" BorderStyle="None" BorderWidth="0px" CellPadding="3" HeaderStyle-BackColor="#006699">
                    <Columns>
                        <asp:BoundField DataField="QuestiongroupName" HeaderText="Question Group" HeaderStyle-ForeColor="White" ItemStyle-Width="20%"/> 
                          <asp:TemplateField HeaderText="Question_detail" HeaderStyle-ForeColor="White" ItemStyle-Width="40%">
                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                            <ItemTemplate>
                                 <asp:HyperLink ID="lnk" runat="server" Target="_self" Text='<%# Eval("Question_detail") %>'
                                            NavigateUrl='<%# "Questionanswer.aspx?ID=" +Eval("ID") %>'></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>  
                        <asp:BoundField DataField="questiontypename" HeaderText="Type" HeaderStyle-ForeColor="White" ItemStyle-Width="10%"/>  
                                                 
                        <asp:BoundField DataField="Question_weight" HeaderText="Score" HeaderStyle-ForeColor="White" ItemStyle-Width="10%"/>  
                        <asp:BoundField DataField="Question_diff" HeaderText="Diff" HeaderStyle-ForeColor="White" ItemStyle-Width="10%"/> 
                          
                        <asp:TemplateField HeaderText="Action" HeaderStyle-ForeColor="White" ItemStyle-Width="10%">
                            <ItemTemplate>
                                 <asp:LinkButton runat="server" ID="LinkButton1" class="btn btn-success btn-circle btn-sm"  CommandArgument='<%# Eval("ID")+"&QID="+Eval("QID") %>' OnClick="Button5_Click">
                                    <i class="fa fa-paperclip" aria-hidden="true"></i>
                                </asp:LinkButton>
                                  <asp:LinkButton runat="server" ID="EditButton" class="btn btn-warning btn-circle btn-sm"  CommandArgument='<%# Eval("ID") %>' OnClick="Button8_Click">
                                    <i class="fa fa-pencil" aria-hidden="true"></i>
                                </asp:LinkButton>
                                <asp:LinkButton runat="server"  ID="DeclineButton" class="btn btn-danger btn-circle btn-sm"  OnClientClick="return confirm('Are you sure you want to delete this Question?');" CommandArgument='<%# Eval("ID") %>' OnClick="Button2_Click">
                                    <i class="fa fa-trash" aria-hidden="true"></i>
                                </asp:LinkButton>
                            
                            </ItemTemplate>
                        </asp:TemplateField>                                      
                    </Columns>
                </asp:GridView>      
              </div>                    
           </div>
           <asp:SqlDataSource ID="sqlDP" runat="server" ConnectionString="<%$ ConnectionStrings:cdas_conn %>"
                    SelectCommand="SELECT qd.id,qd.Question_id AS QID,qd.Question_detail,qty.questiontypename,qgp.QuestiongroupName,qd.Question_diff,qd.Question_weight from Question_detail qd
 inner join Question q on q.id=qd.Question_id and q.Active='1'   left join QuestionType qty on qty.id=qd.Question_type left join Questiongroup qgp on qgp.id=qd.Question_group where q.id=@Question_id and qd.Active='1'"  >
                 <SelectParameters>
                         <asp:QueryStringParameter Name="Question_id" QueryStringField="Question_id" />                      
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
                    <h4 class="modal-title">Question Add </h4>
                     <h2 id="txtFname">
                        <label for="fullname">Question Data</label>
                         <textarea rows="4" cols="30" id="txtNName" name ="txtNName" runat="server">
                         </textarea>
                    </h2>                   
                     <h2 id="H3">
                        <label for="newuser">Question_group</label>
                         <asp:DropDownList class="form-control"  ID="DropDownList4" runat="server"></asp:DropDownList>  
                    </h2>    
                       <h2 id="H2">
                        <label for="newuser">Question_diff</label>
                        <asp:DropDownList class="form-control"  ID="DropDownList1" runat="server"></asp:DropDownList>   
                    </h2>   
                       <h2 id="H4">
                        <label for="newuser">Question Type</label>
                        <asp:DropDownList class="form-control"  ID="DropDownList2" runat="server"></asp:DropDownList>   
                    </h2>    
                     <h2 id="H5">
                        <label for="newuser">Question Score</label>
                         <asp:DropDownList class="form-control"  ID="DropDownList3" runat="server"></asp:DropDownList>   
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
                    <h4 class="modal-title">Question Group Add </h4>
                     <h2 id="H1">
                        <label for="fullname">Question Group</label>
                        <input type="text" class="form-control" id="Text1" name ="txtNName" placeholder="Full name" runat="server">
                    </h2>                  
                 
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <asp:Button ID="Button1" class="btn btn-primary"   runat="server" Text="Add" OnClick="bnAddgroup_Click" />
                   
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div> 
    <script src="../assets/global/plugins/datatables/datatables.min.js" type="text/javascript"></script>
        <script src="../assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN THEME GLOBAL SCRIPTS -->
        <script src="../assets/global/scripts/app.min.js" type="text/javascript"></script>
        <!-- END THEME GLOBAL SCRIPTS -->
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script src="../assets/pages/scripts/table-datatables-managed.js" type="text/javascript"></script>
</asp:Content>

