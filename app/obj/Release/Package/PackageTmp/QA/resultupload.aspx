<%@ Page Language="C#" MasterPageFile="~/Police_noform.Master"  AutoEventWireup="true" CodeBehind="resultupload.aspx.cs" Inherits="newweb.QA.resultupload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <script type="text/javascript">

       Dropzone.autoDiscover = false;
    </script>

    <script type="text/javascript">

        function ReGen(t) {
            var parm = new Object;
            parm['id'] = t;
            $.ajax({
                url: "resultupload.aspx/ReGenToken",
                type: "POST",
                data: JSON.stringify(parm),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (result) {
                    if (result.d != 'Failed') {

                    } else {
                        alert('Status This Token is not Active.\nyou can\'t to change anything. ')

                    }
                    window.location.reload();
                },
                error: function (xhr, status, message) {
                    console.log(xhr);
                }
            });
        }
    </script>
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
           <div class="portlet box green">
           <div class="portlet-title">
               <div class="caption">
                    <i class="fa fa-cogs"></i>Upload Files
               </div>
               <div class="tools">
                   
                </div>
           </div>
           <div class="portlet-body">
               <div class="row">
                   <div class="col-md-12"> 
                   <asp:HyperLink id="hyperlink3" 
                  NavigateUrl="#"
                  Text="View Details"
                  runat="server" class="btn btn-primary"/>   
                </div>
                    <div class="col-md-12"> 
                 &nbsp;
                </div>
                     <% 
                        string tempLibary =renderdata();
                        Response.Write(tempLibary);
                    %>
                 <div class="col-md-12"> 
                 &nbsp;
                </div>
               </div>
                  
               <form id="my-awesome-dropzone" class="dropzone"  defaultbutton="upload" action="#" method="post" enctype="multipart/form-data">
                    <div class="dropzone-previews"></div>
                    <input data-val="true" data-val-number="The field ClassItemID must be a number." data-val-required="The ClassItemID field is required." id="ClassItemID" name="ClassItemID" type="hidden" value="449" />
    
                 </form>
            </div>
        </div>
        </div>

    </div>
                 
    
</asp:Content>
