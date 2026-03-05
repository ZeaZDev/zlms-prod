<%@ Page Language="C#" MasterPageFile="~/Police.Master" AutoEventWireup="true" CodeBehind="Question_select_make.aspx.cs" Inherits="newweb.Question.Question_select_make" %>

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
                    <i class="fa fa-cogs"></i>สร้างชุดข้อสอบ
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
                         <asp:TemplateField HeaderText="Question_select_maker" ItemStyle-Width="80%" HeaderStyle-ForeColor="White">
                             <ItemStyle HorizontalAlign="Left"></ItemStyle>
                            <ItemTemplate>
                                 <asp:HyperLink ID="lnk" runat="server" Target="_self" Text='<%# Eval("Question_select_maker") %>'
                                            NavigateUrl='<%# "Question_View.aspx?ID=" +Eval("Question_select_maker_no") +"&IP="+Eval("Question_select_id")%>'></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>   
                        <asp:BoundField DataField="Create_date" HeaderText="Create date" HeaderStyle-ForeColor="White" ItemStyle-Width="20%"/>  
                                                         
                    </Columns>
                </asp:GridView>      
              </div>                    
           </div>
           <asp:SqlDataSource ID="sqlDP" runat="server" ConnectionString="<%$ ConnectionStrings:cdas_conn %>"
                    SelectCommand="SELECT Question_select_maker_no,Question_select_maker,Create_date,Question_select_id FROM [Question_select_maker] where  Question_select_id=@Question_select_id  group by Question_select_maker_no,Question_select_maker,Create_date,Question_select_id "  >
               <SelectParameters>
                         <asp:QueryStringParameter Name="Question_select_id" QueryStringField="Question_select_id" />                      
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
                    <h4 class="modal-title">สร้างชุดข้อสอบ</h4>
                     <h2 id="txtFname">
                        <label for="fullname">ชื่อชุดข้อสอบ</label>
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

