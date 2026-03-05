<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="YAF.SampleWebApplication._Default" %>
<%@ Register TagPrefix="YAF" TagName="ForumActiveDiscussion" Src="forum/controls/ForumActiveDiscussion.ascx" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Welcome to LMS KNOWLEDGE MANAGEMENT.
    </h2>
    
    <h3>Latest</h3>
    <div class="yafWhatsNew">
        <YAF:ForumActiveDiscussion ID="ActiveDiscussions" runat="server" />
    </div>
</asp:Content>

