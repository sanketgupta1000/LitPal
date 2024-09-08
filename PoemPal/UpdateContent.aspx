<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateContent.aspx.cs" Inherits="PoemPal.UpdateContent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblTitle" runat="server" Text="Title"></asp:Label>
            :&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="tbTitle" runat="server" Width="279px"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="lblContent" runat="server" Text="Content"></asp:Label>
            :<br />
&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="tbContent" runat="server" Height="122px" TextMode="MultiLine" Width="416px"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btnUpdate" runat="server" Height="26px" OnClick="btnUpdate_Click" Text="Update" Width="105px" />
        &nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnHome" runat="server" CausesValidation="False" OnClick="btnHome_Click" Text="Go Home" Width="128px" />
        </div>
    </form>
</body>
</html>
