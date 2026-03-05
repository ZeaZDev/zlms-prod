<%@ Page Language="C#" MasterPageFile="~/Police.Master" AutoEventWireup="true" CodeBehind="compareresult.aspx.cs" Inherits="newweb.QA.compareresult" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
     <div class="row">
       <div class="col-md-12"> 
    <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
             </div>
          </div>
     <div class="row">
       <div class="col-md-12"> 
    <asp:Chart ID="Chart1" Height="800px" Width="1600px" runat="server">
        <Series>
            <asp:Series Name="Series1" Legend="Legend1"></asp:Series>
            <asp:Series ChartArea="ChartArea1" Name="Series2" Legend="Legend1">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
        </ChartAreas>
        <Legends>
            <asp:Legend Name="Legend1" TitleAlignment="Near">
            </asp:Legend>
        </Legends>
    </asp:Chart>
           </div>
          </div>
</asp:Content>