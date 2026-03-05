<%@ Page Language="C#" MasterPageFile="~/Police_noform.Master" AutoEventWireup="true" CodeBehind="Uploadfile.aspx.cs" Inherits="newweb.USER_QA.Uploadfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <script type="text/javascript">

            Dropzone.autoDiscover = false;
    </script>
    <script type="text/javascript">

        function ReGen(t) {
            var parm = new Object;
            parm['id'] = t;
            $.ajax({
                url: "classitemupload.aspx/ReGenToken",
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
     
   <div class="row">
       <div class="col-md-12"> 
           <div class="portlet box green">
           <div class="portlet-title">
               <div class="caption">
                    <i class="fa fa-cogs"></i>Upload Files<asp:Label ID="Label1" runat="server" Text=""></asp:Label>
               </div>
               <div class="tools">
                   
                </div>
           </div>
           <div class="portlet-body">
               <form id="test" runat="server" method="post">
               <div class="row">
                    
                   <div class="col-md-12"> 
                 <asp:Button ID="Button77" runat="server" OnClientClick="window.close(); return false" Text="Close" />
                </div>

               </div>
                </form>  
               <br />
                <br />
                <div id="group10" runat="server" > 
               <form id="my-awesome-dropzone" class="dropzone" defaultbutton="upload" action="#" method="post" enctype="multipart/form-data">
                    <div class="dropzone-previews"></div>
                    <input data-val="true" data-val-number="The field ClassItemID must be a number." data-val-required="The ClassItemID field is required." id="ClassItemID" name="ClassItemID" type="hidden" value="449" />
               </form>
                </div>
            </div>
        </div>
        </div>

    </div>

      <script>
          Dropzone.options.myDropzone = {
              maxFilesize: 500,
              init: function () {
                  this.on("uploadprogress", function (file, progress) {
                      console.log("File progress", progress);
                  });
              }
          }
</script>            
    
</asp:Content>