<%@ Page Language="C#"  MasterPageFile="~/Police.Master"  AutoEventWireup="true" CodeBehind="Issue.aspx.cs" Inherits="newweb.Certificate.Issue" %>

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
           <span>Issure Certificate</span>
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
                    <i class="fa fa-cogs"></i>รายการหลักสูตร 
               </div>
               <div class="tools">
                      <a  class="" data-controls-modal="mdAdd" data-toggle="modal"   href="#mdAdd" >
                        <i class="fa fa-plus"> </i> <span>สร้างหลักสูตร รายการประกาศนียบัตร</span>
                     </a>
                </div>
           </div>
           <div class="portlet-body">
             <div class="table-responsive">
              <asp:GridView ID="gvDP" runat="server" class="table table-striped" AutoGenerateColumns="False" DataSourceID="sqlDP"  ShowFooter="false" >
                    <Columns>
    
                        <asp:BoundField DataField="CourseName" HeaderText="หลักสูตร" SortExpression="UserID" />                  
                        <asp:BoundField DataField="Name" HeaderText="ผู้สอน" SortExpression="UserID" />
                        <asp:BoundField DataField="Certificatename" HeaderText="ประกาศนียบัตร" /> 
                          <asp:TemplateField>
                            <ItemTemplate>
                                  <asp:LinkButton runat="server" ID="LinkButton2" class="btn btn-success btn-circle btn-sm"  CommandArgument='<%# Eval("ID") %>' OnClick="Button1_Click">
                                    <i class="fa fa-search" aria-hidden="true"></i>
                                </asp:LinkButton>
 
                            
                            </ItemTemplate>
                        </asp:TemplateField>                       
                    </Columns>
                   <HeaderStyle Font-Size="Small" BackColor="#006699" Font-Bold="True" ForeColor="White" />
                </asp:GridView>      
              </div>                    
           </div>
           <asp:SqlDataSource ID="sqlDP" runat="server" ConnectionString="<%$ ConnectionStrings:cdas_conn %>"
                    SelectCommand="SELECT c.ID,[CourseName],[CourseDesp],[UserID],m.Name,cx.Certificatename FROM [Course] c inner join  Member m on m.id=c.userid left join [Certificate] cx on cx.id=c.Certificate_id where c.Active='1'"  >
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
                    <h4 class="modal-title">สร้างหลักสูตร รายการประกาศนียบัตร </h4>
                     <h2 id="H3">
                        <label for="newuser">หลักสูตร</label>
                         <asp:DropDownList class="form-control"  ID="DropDownList1" runat="server"></asp:DropDownList>
                    </h2>  
                     <h2 id="txtFname">
                        <label for="fullname">ชื่อประกาศนียบัตร</label>
                        <asp:DropDownList class="form-control"  ID="DropDownList2" runat="server"></asp:DropDownList>
                    </h2>  
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">ยกเลิก</button>
                    <asp:Button ID="bnAdduser" class="btn btn-primary"   runat="server" Text="เพิ่ม" OnClick="bnAdduser_Click" />
                   
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div> 
</asp:Content>