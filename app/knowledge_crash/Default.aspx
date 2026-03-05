<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="YAF.SampleWebApplication._Default" %>
<%@ Register TagPrefix="YAF" TagName="ForumActiveDiscussion" Src="forum/controls/ForumActiveDiscussion.ascx" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Welcome to PEB-LMS Knowleage Application!
    </h2>
    <p>
        
        </p>
    <p>
        To learn more about YAF.NET visit <a href="http://lms.bkkcom.co.th:12000/" title="PEB-LMS">PEB-LMS</a>.
    </p>
    
    <h3>YAF What's New</h3>
    <div class="yafWhatsNew">
        <YAF:ForumActiveDiscussion ID="ActiveDiscussions" runat="server" />
    </div>
</asp:Content>

