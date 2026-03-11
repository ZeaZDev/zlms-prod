<%@ Page Language="C#" MasterPageFile="~/Police.Master"  AutoEventWireup="true" CodeBehind="Certificatedetail.aspx.cs" Inherits="newweb.Certificate.Certificatedetail" %>

<%@ Register Assembly="DevExpress.XtraReports.v16.2.Web.WebForms, Version=16.2.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <script src="../Scripts/jquery-1.10.2.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-ui-1.10.4.min.js" type="text/javascript"></script>
    <script src="../Scripts/globalize.js" type="text/javascript"></script>
    <script src="../Scripts/knockout-3.0.0.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="body" runat="server">
    <asp:HyperLink ID="HyperLink1" runat="server">Adjust</asp:HyperLink>
    <dx:ASPxDocumentViewer ID="ASPxDocumentViewer1" runat="server"></dx:ASPxDocumentViewer>
</asp:Content>

