<%@ Page Language="C#" MasterPageFile="~/Police_user.Master" AutoEventWireup="true" CodeBehind="period.aspx.cs" Inherits="newweb.Course_user.period" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

   
     <link href="<%= ResolveUrl("~/assets/global/css/rating.css") %>" rel="stylesheet" type="text/css" />
    
 
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="body" runat="server">
     <script src="<%= ResolveUrl("~/assets/global/scripts/rating.js") %>" type="text/javascript"></script>
     <script type="text/javascript">
         $(function () {
             $('.rating').rating();

             $('.ratingEvent').rating({ rateEnd: function (v) { $('#result').text(v); } });
         });
    </script>
     <div class="page-bar"> 
   
      <ul class="page-breadcrumb">
        <li>
           <a href="<%= ResolveUrl("~/default.aspx") %>">Home</a>
           <i class="fa fa-circle"></i>
       </li>
         <li>
           <a href="<%= ResolveUrl("~/Course/") %>">Course</a>
           <i class="fa fa-circle"></i>
       </li> 
        <li>
           <asp:HyperLink id="hyperlink1" 
                  NavigateUrl="#"
                  Text="Class"
                  runat="server"/>   
           <i class="fa fa-circle"></i>
       </li> 
         <li>
           <asp:HyperLink id="hyperlink2" 
                  NavigateUrl="#"
                  Text="Class Detail"
                  runat="server"/>   
           <i class="fa fa-circle"></i>
       </li>        
       <li>
           <span>Period</span>
       </li>
     </ul>
         </div>
     <br />
   <div class="row">
        <div class="col-md-12">   
       <div class="col-md-8"> 
           <div class="portlet box green">
           <div class="portlet-title">
               <div class="caption">
                    <i class="fa fa-cogs"></i>Details Period
               </div>
               <div class="tools">
                   
                </div>
           </div>
           <div class="portlet-body">
               <div class="row">
                    <div class="col-md-8 "> 
                        <div class="col-sm-3"><span class="pull-right">Name</span></div>
                        <div class="col-sm-6">
                            <span class="pull-left">
                                <asp:Label ID="Name" runat="server" Text="Label"></asp:Label>
                            </span>
                        </div>
                        <div class="col-sm-3"></div>
                    </div>
                   <div class="col-md-4">                         
                    </div>
                   <div class="col-md-8 "> 
                          <div class="col-sm-3"><span class="pull-right">Description</span></div>
                        <div class="col-sm-6">
                            <span class="pull-left">
                                <asp:Label ID="Desp" runat="server" Text="Label"></asp:Label>
                            </span>
                        </div>
                        <div class="col-sm-3"></div>                      
                    </div>
                   <div class="col-md-4"> 
                        
                    </div>
                   <div class="col-md-8 "> 
                        <div class="col-sm-3"><span class="pull-right">Course Name</span></div>
                        <div class="col-sm-6">
                            <span class="pull-left">
                                <asp:Label ID="Course_name" runat="server" Text="Label"></asp:Label>
                            </span>
                        </div>
                        <div class="col-sm-3"></div>
                    </div>
                   <div class="col-md-4">                         
                    </div>
                   <div class="col-md-8 "> 
                        <div class="col-sm-3"><span class="pull-right">Class Name</span></div>
                        <div class="col-sm-6">
                            <span class="pull-left">
                                <asp:Label ID="ClassName" runat="server" Text="Label"></asp:Label>
                            </span>
                        </div>
                        <div class="col-sm-3"></div>
                    </div>
                   <div class="col-md-4">                         
                    </div>
               </div>
            </div>
        </div>
        </div>
        <div class="col-md-4"> 
           <div class="portlet box green">
           <div class="portlet-title">
               <div class="caption">
                    <i class="fa fa-cogs"></i>Rating period
               </div>
               <div class="tools">
                   
                </div>
           </div>
           <div class="portlet-body">
               <div class="row">
                     
                   <div class="row">
                    <div class="col-md-8 "> 
                         <div class="col-sm-6"><span class="pull-right">Rate this period</span></div>
                        <div class="col-sm-6">
                            <span class="pull-left">
                               
                            </span>
                        </div>
                      
                    </div>
                   <div class="col-md-4">                         
                    </div>
                   <div class="col-md-8 "> 
                      <span class="pull-right">&nbsp;</span>                   
                    </div>
                   <div class="col-md-4"> 
                        
                    </div>
                   <div class="col-md-8 "> 
                        <span class="pull-right">&nbsp;</span>      
                    </div>
                   <div class="col-md-4">                         
                    </div>
                   <div class="col-md-8 "> 
                       <div class="col-sm-6"><span class="pull-right"> <asp:Label ID="Label1" runat="server" Text=""></asp:Label><input type="text" class="rating rating5" value="0" runat="server" id="rating"/></span></div>
                        <div class="col-sm-6">
                            <span class="pull-left">
                                
                                <asp:Button ID="Button1" runat="server" Text="Vote" OnClick="Button1_Click" />
                            </span>
                        </div>
                       
               </div>
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
                    <i class="fa fa-cogs"></i>Class Items of <asp:Label ID="Coursename" runat="server" Text="Label"></asp:Label>
               </div>
               <div class="tools">
                   
                </div>
           </div>
           <div class="portlet-body">
             <div class="table-responsive">
              <asp:GridView ID="gvDP" runat="server" class="table table-striped" AutoGenerateColumns="False" DataSourceID="sqlDP"  AllowPaging="True" AllowSorting="True" ShowFooter="false" PageSize="20" BackColor="White" BorderColor="White" BorderStyle="None" BorderWidth="0px" CellPadding="3" HeaderStyle-BackColor="#006699">
                    <Columns>
                        <asp:TemplateField HeaderText="Name" HeaderStyle-ForeColor="White">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="Youtube" class="btn btn-primary btn-sm"   Visible="false">
                                    <i class="fa fa-youtube-play"> </i>

                                </asp:LinkButton>
                                 <asp:HyperLink ID="lnk" runat="server" Target="_self" Text='<%# Eval("ClassItemName") %>'
                                            NavigateUrl='<%# "classitemdetail.aspx?ID=" +Eval("ID") %>'></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>                        
                        <asp:BoundField DataField="Name" HeaderText="Instructor" SortExpression="UserID" HeaderStyle-ForeColor="White"/>
                        <asp:BoundField DataField="ClassItemType" HeaderText="Type" HeaderStyle-ForeColor="White" />                          
                                                         
                    </Columns>
                </asp:GridView>      
              </div>                    
           </div>
           <asp:SqlDataSource ID="sqlDP" runat="server" ConnectionString="<%$ ConnectionStrings:cdas_conn %>"
                    SelectCommand="SELECT c.id,ct.ClassItemType,[ClassItemName],C.[ClassItemDesp],C.[userid],m.Name FROM [ClassItem] c inner join ClassItemType ct on ct.id=c.ClassitemtypeID inner join  Member m on m.id=c.userid where c.[PeriodID]=@PeriodID and c.active='1'"  >
                <SelectParameters>
                         <asp:QueryStringParameter Name="PeriodID" QueryStringField="PeriodID" />                      
                   </SelectParameters>
                </asp:SqlDataSource>
       </div>                             
        <!-- END SAMPLE TABLE PORTLET-->                      
        </div>
    </div>
  
</asp:Content>