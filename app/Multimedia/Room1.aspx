<%@ Page Language="C#" MasterPageFile="~/Police.Master"   AutoEventWireup="true" CodeBehind="Room1.aspx.cs" Inherits="newweb.Multimedia.Room1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="body" runat="server">
 <script src="https://cdn.jsdelivr.net/npm/hls.js@latest"></script>
    <video id="video" controls></video>
    <script>
        if (Hls.isSupported()) {
            var video = document.getElementById('video');
            var hls = new Hls();
            hls.loadSource('http://lms.bkkcom.co.th:1935/live/cvs/playlist.m3u8');
            hls.attachMedia(video);
            hls.on(Hls.Events.MANIFEST_PARSED, function () {
                video.play();
            });
        }
        else if (video.canPlayType('application/vnd.apple.mpegurl')) {
            video.src = 'http://lms.bkkcom.co.th:1935/live/cvs/playlist.m3u8';
            video.addEventListener('canplay', function () {
                video.play();
            });
        }
    </script>
</asp:Content>
