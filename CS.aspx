﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CS.aspx.cs" Inherits="CS" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyAxesrfr8opV-pFfuOphg2TTQi2b4IKJ9Y"></script>
    <script type="text/javascript">
    var markers = [
    <asp:Repeater ID="rptMarkers" runat="server">
    <ItemTemplate>
             {
                "title": '<%# Eval("Mobile") %>',
                "lat": '<%# Eval("Latitude") %>',
                "lng": '<%# Eval("Longitude") %>',
                "description": '<%# Eval("Date") %>'
            }
    </ItemTemplate>
    <SeparatorTemplate>
        ,
    </SeparatorTemplate>
    </asp:Repeater>
    ];
    </script>
    <script type="text/javascript">

        window.onload = function () {
            var mapOptions = {
                center: new google.maps.LatLng(markers[0].lat, markers[0].lng),
                zoom: 8,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            var infoWindow = new google.maps.InfoWindow();
            var map = new google.maps.Map(document.getElementById("dvMap"), mapOptions);
            for (i = 0; i < markers.length; i++) {
                var data = markers[i]
                var myLatlng = new google.maps.LatLng(data.lat, data.lng);
                var marker = new google.maps.Marker({
                    position: myLatlng,
                    map: map,
                    title: data.title
                });
                (function (marker, data) {
                    google.maps.event.addListener(marker, "click", function (e) {
                        infoWindow.setContent(data.description);
                        infoWindow.open(map, marker);
                    });
                })(marker, data);
            }
        }
    </script>
    
     <center>
    
    <table>
    <tr>
    <td class="style2" colspan="2">
    
    <h2>
        Welcome Service Provider!
    </h2>
    
    </td>
    </tr>
    <tr>
    <td class="style2">
    <h2>
    FILTER DATA
    </h2>
        </td>
    <td class="style3">
    
        <asp:TextBox ID="TextBox1" runat="server" Width="198px" AutoPostBack="True" 
            ontextchanged="TextBox1_TextChanged" ></asp:TextBox>
    
    </td>
    </tr>
    <tr>
    <td class="style2" colspan="2">
    
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
    
        </td>
    </tr>
    </table>    

     <div id="dvMap" style="width: 800px; height: 500px">
    </div>

    </center>

    </form>
</body>
</html>
