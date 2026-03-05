<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Certificate_adjust.aspx.cs" Inherits="newweb.Certificate.Certificate_adjust" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.XtraReports.v18.2.Web.WebForms, Version=18.2.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script src="../Scripts/jquery-1.10.2.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-ui-1.10.4.min.js" type="text/javascript"></script>
    <script src="../Scripts/globalize.js" type="text/javascript"></script>
    <script src="../Scripts/knockout-3.0.0.js" type="text/javascript"></script>
    <script type="text/javascript">
        function reportDesigner_EndCallback(s, e) {
            btExportReport.DoClick();
        }
</script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
       <dx:ASPxReportDesigner ID="reportDesigner" runat="server" 
            onsavereportlayout="reportDesigner_SaveReportLayout">
            <ClientSideEvents EndCallback="reportDesigner_EndCallback" />
        </dx:ASPxReportDesigner>
        <dx:ASPxButton ID="btExportReport" runat="server" ClientVisible="false" EnableClientSideAPI="true"
    onclick="btExportReport_Click"></dx:ASPxButton>
        </div>
    </form>
</body>
</html>