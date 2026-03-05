<%@ Page Language="C#" MasterPageFile="~/Police.Master" AutoEventWireup="true" CodeBehind="Questionanswer.aspx.cs" Inherits="newweb.Question.Questionanswer" %>

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
     <br />
   <div class="row">
       <div class="col-md-12"> 
           <div class="portlet box green">
           <div class="portlet-title">
               <div class="caption">
                    <i class="fa fa-cogs"></i>Details Question
               </div>
               <div class="tools">
                   
                </div>
           </div>
           <div class="portlet-body">
               <div class="row">
                    <div class="col-md-8 "> 
                        <div class="col-sm-2"><span class="pull-right">Question </span></div>
                        <div class="col-sm-6">
                            <span class="pull-left">
                                <asp:Label ID="Questioncourse" runat="server" Text="Label"></asp:Label>
                            </span>
                        </div>
                        <div class="col-sm-4"></div>
                    </div>
                   <div class="col-md-4">                         
                    </div>
                  <div class="col-md-8 "> 
                        <div class="col-sm-2"><span class="pull-right">Question name</span></div>
                        <div class="col-sm-6">
                            <span class="pull-left">
                                <asp:Label ID="Questionname" runat="server" Text="Label"></asp:Label>
                            </span>
                        </div>
                        <div class="col-sm-4"></div>
                    </div>
                   <div class="col-md-4">                         
                    </div>
                   <div class="col-md-8 "> 
                        <div class="col-sm-2"><span class="pull-right">Question group</span></div>
                        <div class="col-sm-6">
                            <span class="pull-left">
                                <asp:Label ID="Questiongroup" runat="server" Text="Label"></asp:Label>
                            </span>
                        </div>
                        <div class="col-sm-4"></div>
                    </div>
                     <div class="col-md-8 "> 
                        <div class="col-sm-2"><span class="pull-right"></span></div>
                        <div class="col-sm-6">
                            <asp:Image ID="Image1" runat="server" />
                        </div>
                        <div class="col-sm-4"></div>
                    </div>
                   <div class="col-md-4">                         
                    </div>
               </div>
            </div>
        </div>
        </div>
       <div class="col-md-12">                               
       <!-- BEGIN SAMPLE TABLE PORTLET-->
       <div class="portlet box green">
           <div class="portlet-title">
               <div class="caption">
                    <i class="fa fa-cogs"></i>Choice detail
               </div>
               <div class="tools">
                    <a  class="" data-controls-modal="mdAdd" data-toggle="modal"   href="#mdAdd" >
                        <i class="fa fa-plus"> </i> <span>Create Choice</span>
                     </a>
                </div>
           </div>
           <div class="portlet-body">
             <div class="table-responsive">
              <asp:GridView ID="gvDP" runat="server" class="table table-striped" AutoGenerateColumns="False" DataSourceID="sqlDP"  AllowPaging="True" AllowSorting="True" ShowFooter="false" PageSize="20" BackColor="White" BorderColor="White" BorderStyle="None" BorderWidth="0px" CellPadding="3" HeaderStyle-BackColor="#006699">
                    <Columns>
                        <asp:BoundField DataField="SNO" HeaderText="No" SortExpression="UserID" HeaderStyle-ForeColor="White"/>
                        <asp:BoundField DataField="Question_data" HeaderText="Question choice" SortExpression="UserID" HeaderStyle-ForeColor="White"/>
                        <asp:BoundField DataField="Iscorrect" HeaderText=" Correct answer" HeaderStyle-ForeColor="White"/>  
                        <asp:BoundField DataField="Detail_answer" HeaderText="Detail answer" HeaderStyle-ForeColor="White"/>  
                        <asp:TemplateField HeaderText="Action" HeaderStyle-ForeColor="White">
                            <ItemTemplate>
                                 <asp:LinkButton runat="server" ID="LinkButton1" class="btn btn-success btn-circle btn-sm"  CommandArgument='<%# Eval("ID")+"&QDID="+Eval("Question_detail_id") %>' OnClick="Button3_Click">
                                    <i class="fa fa-paperclip" aria-hidden="true"></i>
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
                    SelectCommand="SELECT ROW_NUMBER() OVER (ORDER BY (SELECT 100)) AS SNO ,[id],[Question_detail_id],[Question_data],[Ispic] ,[Piclocation],[Iscorrect] ,[Detail_answer]  FROM [Question_data] where Question_detail_id=@Question_detail_id and Active='1'"  >
                <SelectParameters>
                         <asp:QueryStringParameter Name="Question_detail_id" QueryStringField="Question_detail_id" />                      
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
                    <h4 class="modal-title">Create choice </h4>
                     <h2 id="txtFname">
                        <label for="fullname">Choice Name</label>
                        <input type="text" class="form-control" id="txtNName" name ="txtNName" placeholder="Full name" runat="server">
                    </h2>                   
                     <h2 id="H1">
                        <label for="fullname">Is correct</label>
                         <asp:CheckBox class="form-control" ID="CheckBox1" runat="server" />
                     </h2>             
                     <h2 id="H2">
                        <label for="fullname">Detial Answer</label>
                        <input type="text" class="form-control" id="detailanswer" name ="txtNName" placeholder="Full name" runat="server">
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
