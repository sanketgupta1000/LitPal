<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="PoemPal.View" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1><asp:Label runat="server" ID="lblTitle"></asp:Label></h1>
            <p><asp:Label runat="server" ID="lblAuthor"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnDelete" runat="server" Text="Delete" Width="98px" OnClick="btnDelete_Click" />
&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnEdit" runat="server" Text="Edit" Width="97px" OnClick="btnEdit_Click" />
&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnHome" runat="server" OnClick="btnHome_Click" Text="Go Home" Width="105px" />
            </p>
            <p><asp:Label runat="server" ID="lblType"></asp:Label></p>
            <p><asp:Label runat="server" ID="lblDate"></asp:Label></p>
            <hr />
            <p><asp:Label runat="server" ID="lblContent"></asp:Label></p>
        </div>
    </form>
</body>
</html>
