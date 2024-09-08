<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="PoemPal.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>

                <asp:Label runat="server" ID="lblGreet"></asp:Label>

                <asp:HyperLink runat="server" ID="hlCreateContent" NavigateUrl="~/CreateNewContent.aspx">Create New Content</asp:HyperLink>
            
                <asp:Button runat="server" ID="btnLogout" Text="Logout" OnClick="HandleLogout" />
            </div>

            <div>

                <asp:Label runat="server" ID="lblDDLContentType" AssociatedControlID="DDLContentType">Viewing: </asp:Label>

                <asp:DropDownList runat="server" ID="DDLContentType"
                    AutoPostBack="true">

                    <asp:ListItem Selected="True" Value="stories">Stories</asp:ListItem>
                    <asp:ListItem Value="poems">Poems</asp:ListItem>
                    <asp:ListItem Value="both">Stories & Poems</asp:ListItem>

                    <asp:ListItem Value="your">By You</asp:ListItem>

                </asp:DropDownList>

            </div>

            <div>

                

                <asp:GridView ID="GDVContent" runat="server" AutoGenerateSelectButton="True" OnSelectedIndexChanged="HandleSelect">
                </asp:GridView>

                

            </div>

        </div>
    </form>
</body>
</html>
