<%@ Page Language="C#" MasterPageFile="~/Police.Master" AutoEventWireup="true" CodeBehind="Questionmaker.aspx.cs" Inherits="newweb.Question.Questionmaker" %>

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
                    <i class="fa fa-cogs"></i>Question Management
               </div>    
                <div class="tools">
                    <a  class="" data-controls-modal="mdAdd" data-toggle="modal"   href="#mdAdd" >
                        <i class="fa fa-plus"> </i> <span>Create New</span>
                     </a>
                </div>         
           </div>
           <div class="portlet-body">
             <div class="table-toolbar">              
              <asp:GridView ID="gvDP" runat="server" class="table table-striped table-bordered table-hover table-checkable order-column" OnRowDataBound="GridView1_RowDataBound" AutoGenerateColumns="False" DataSourceID="sqlDP"  AllowPaging="True" AllowSorting="True" ShowFooter="false" PageSize="50" BackColor="White" BorderColor="White" BorderStyle="None" BorderWidth="0px" CellPadding="3" HeaderStyle-BackColor="#006699">
                    <Columns>
                        <asp:BoundField DataField="Question_name" HeaderText="รายวิชา" HeaderStyle-ForeColor="White" ItemStyle-Width="40%"/>  
                        <asp:BoundField DataField="QuestiongroupName" HeaderText="หัวข้อวิชา" HeaderStyle-ForeColor="White" ItemStyle-Width="40%"/>  
                        <asp:BoundField DataField="Question_weight" HeaderText="จำนวนข้อ" HeaderStyle-ForeColor="White" ItemStyle-Width="10%"/>  
                        <asp:TemplateField HeaderText="Action" HeaderStyle-ForeColor="White" ItemStyle-Width="20%">
                            <ItemTemplate>
                                <asp:LinkButton runat="server"  ID="DeclineButton" class="btn btn-danger btn-circle btn-sm"  OnClientClick="return confirm('Are you sure you want to delete this select?');" CommandArgument='<%# Eval("ID") %>' OnClick="Button2_Click">
                                    <i class="fa fa-trash" aria-hidden="true"></i>
                                </asp:LinkButton>
                            
                            </ItemTemplate>
                        </asp:TemplateField>                                      
                    </Columns>
                </asp:GridView>      
              </div>                    
           </div>
           <asp:SqlDataSource ID="sqlDP" runat="server" ConnectionString="<%$ ConnectionStrings:cdas_conn %>"
                    SelectCommand="SELECT qd.id,q.Question_name,qg.QuestiongroupName,qd.Question_weight FROM [Question_select_add] qd inner join Question q on q.id=qd.Question_id  inner join Questiongroup qg on qg.id=qd.QuestiongroupID where qd.active='1' and qd.Question_select_id=@Question_select_id  order by ID"  >
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
                    <h4 class="modal-title">Question select </h4>                             
                      
                       <h2 id="H4">
                        <label for="newuser">รายวิชา</label>
                           <asp:DropDownList class="form-control"  ID="DropDownList2" runat="server"></asp:DropDownList>
                    </h2>    
                     <h2 id="H5">
                        <label for="newuser">หัวข้อวิชา</label>
                         <asp:DropDownList class="form-control"  ID="DropDownList3" runat="server"></asp:DropDownList>
                    </h2>  
                      <h2 id="H7">
                        <label for="newuser">จำนวนข้อ</label>
                           <input type="text" class="form-control" id="txtNName" name ="txtNName" placeholder="" runat="server">
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