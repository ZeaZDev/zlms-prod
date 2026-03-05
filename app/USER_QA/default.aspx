<%@ Page Language="C#"  MasterPageFile="~/Police.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="newweb.USER_QA._default" %>

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
                    <i class="fa fa-cogs"></i>รายชื่อหน่วยงาน
               </div>
               <div class="tools">
                   
                </div>
           </div>
           <div class="portlet-body">
             <div class="table-responsive">
              <asp:GridView ID="gvDP" runat="server" class="table table-striped" AutoGenerateColumns="False"   ShowFooter="false" >
                    <Columns>

                         <asp:BoundField DataField="Project" HeaderText="Name" ItemStyle-Width="60%"/>  
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="LinkButton1" class="btn btn-success "  CommandArgument='<%# Eval("ID") %>' OnClick="Button5_Click">
                                กรอกข้อมูล
                                </asp:LinkButton>
                                <asp:LinkButton runat="server" ID="LinkButton3" class="btn btn-success "  CommandArgument='<%# Eval("ID") %>' OnClick="Button1_Click">
                                 กรอกคะแนน
                                </asp:LinkButton>                                    
                                  <asp:LinkButton runat="server" ID="LinkButton4" class="btn btn-success "  CommandArgument='<%# Eval("ID") %>' OnClick="Button6_Click">
                                 ดูคะแนนประเมิณตนเอง
                                </asp:LinkButton>  
                                <asp:LinkButton runat="server" ID="LinkButton6" class="btn btn-success "  CommandArgument='<%# Eval("ID") %>' OnClick="Button7_Click">
                                ดูรายงาน
                                </asp:LinkButton>           
                            </ItemTemplate>
                        </asp:TemplateField>                                      
                    </Columns>
                   <HeaderStyle Font-Size="Small" BackColor="#006699" Font-Bold="True" ForeColor="White" />
                </asp:GridView>      
              </div>                    
           </div>
           <asp:SqlDataSource ID="sqlDP" runat="server" ConnectionString="<%$ ConnectionStrings:cdas_conn %>"
                    SelectCommand="SELECT  [id] ,[Project] FROM [QA_project] c where Active='1' and [Resposibilities]=@projectid"  >
                <SelectParameters>
                         <asp:QueryStringParameter Name="projectid" QueryStringField="projectid" />
                   </SelectParameters>
                </asp:SqlDataSource>
           <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cdas_conn %>"
                    SelectCommand="SELECT  [id] ,[Project] FROM [QA_project] c where Active='1' "  >
                </asp:SqlDataSource>
       </div>                             
        <!-- END SAMPLE TABLE PORTLET-->                      
        </div>
    </div>

</asp:Content>