<%@ Page Language="C#" MasterPageFile="~/Police.Master"  AutoEventWireup="true" CodeBehind="Roomdetail.aspx.cs" Inherits="newweb.Multimedia.Roomdetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="body" runat="server">
 <script src="https://cdn.jsdelivr.net/npm/hls.js@latest"></script>
    <video id="video" controls></video>
    <script>
        if (Hls.isSupported()) {
            var video = document.getElementById('video');
            var hls = new Hls();
            hls.loadSource('<%= linkhhtp %>');
            hls.attachMedia(video);
            hls.on(Hls.Events.MANIFEST_PARSED, function () {
                video.play();
            });
        }
        else if (video.canPlayType('application/vnd.apple.mpegurl')) {
            video.src = '<%= linkhhtp %>';
            video.addEventListener('canplay', function () {
                video.play();
            });
        }
    </script>
</asp:Content>
