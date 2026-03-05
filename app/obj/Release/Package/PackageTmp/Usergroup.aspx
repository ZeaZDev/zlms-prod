<%@ Page Language="C#" MasterPageFile="~/Police.Master" AutoEventWireup="true" CodeBehind="Usergroup.aspx.cs" Inherits="newweb.Usergroup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">

        function openModal() {
            $('#mdAdd').modal({ show: true });
        };
    </script>
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="body" runat="server">
     <script type="text/javascript">

         $(function () {
             var dateFormat = "dd-mm-yy",
               from = $(".dtfrom")
                 .datepicker({
                     defaultDate: "+1w",
                     showOn: "button",
                     buttonImage: "Images/calendar.png",
                     buttonImageOnly: true,
                     buttonText: "Select date",
                     changeMonth: true,
                     changeYear: true,
                     dateFormat: "dd-mm-yy"
                 })
                 .on("change", function () {
                     to.datepicker("option", "minDate", getDate(this));
                 }),
               to = $(".dtto").datepicker({
                   defaultDate: "+1w",
                   showOn: "button",
                   buttonImage: "Images/calendar.png",
                   buttonImageOnly: true,
                   buttonText: "Select date",
                   changeMonth: true,
                   changeYear: true,
                   dateFormat: "dd-mm-yy"
               })
               .on("change", function () {
                   from.datepicker("option", "maxDate", getDate(this));
               });

             function getDate(element) {
                 var date;
                 try {
                     date = $.datepicker.parseDate(dateFormat, element.value);
                 } catch (error) {
                     date = null;
                 }

                 return date;
             }
         });
    </script>
     <div class="page-bar"> 
   
      <ul class="page-breadcrumb">
        <li>
           <a href="<%= ResolveUrl("~/default.aspx") %>">Home</a>
           <i class="fa fa-circle"></i>
       </li>
       <li>
           <span>Course</span>
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
                    <i class="fa fa-cogs"></i>List of User Groupname
               </div>
               <div class="tools">
                    <a  class="" data-controls-modal="mdAdd" data-toggle="modal"   href="#mdAdd" onClick="">
                        <i class="fa fa-plus"> </i> <span>User Groupname</span>
                     </a>
                </div>
           </div>
           <div class="portlet-body">
             <div class="table-responsive">
              <asp:GridView ID="gvDP" runat="server" class="table table-striped" AutoGenerateColumns="False" DataSourceID="sqlDP"  ShowFooter="false" >
                    <Columns>                       
                        <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
                        <asp:BoundField DataField="UserGroupname" HeaderText="User Groupname" SortExpression="User Groupname" />
                        <asp:BoundField DataField="Active" HeaderText="Active" />  
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton runat="server"  ID="DeclineButton" class="btn btn-danger btn-circle btn-sm"  OnClientClick="return confirm('Are you sure you want to delete this user group?');" CommandArgument='<%# Eval("ID") %>' OnClick="Button2_Click">
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
                    SelectCommand="SELECT c.ID,[UserGroupname],[UserID],C.Active,m.Name FROM [usergroup] c inner join  Member m on m.id=c.userid where c.Active='1'"  >
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
                    <h4 class="modal-title">Enter User Group </h4>
                     <h2 id="txtFname">
                        <label for="fullname">User Group Name</label>
                        <input type="text" class="form-control" id="txtNName" name ="txtNName" placeholder="Full name" runat="server">
                    </h2>   
                    <h5 class="modal-title">Enter Parent </h5>
                    <asp:DropDownList ID="DropDownList1" runat="server">  
                    </asp:DropDownList>  
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

