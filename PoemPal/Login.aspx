<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PoemPal.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <div>
                <asp:Label runat="server" ID="lblNotify"></asp:Label>
            </div>

            <div>

                <asp:Label runat="server" ID="lblEmail" AssociatedControlID="tbEmail">Email:</asp:Label>
                <asp:TextBox runat="server" ID="tbEmail"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="requiredFieldValidatorEmail"
                    ControlToValidate="tbEmail" Text="Email is required"></asp:RequiredFieldValidator>

                <asp:RegularExpressionValidator runat="server" ID="regexValidatorEmail"
                    ControlToValidate="tbEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    Text="Please enter a valid email"></asp:RegularExpressionValidator>

            </div>

            <div>
                <asp:Label runat="server" ID="lblPassword" AssociatedControlID="tbPassword">Password:</asp:Label>
                <asp:TextBox runat="server" ID="tbPassword" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="requiredFieldValidatorPassword"
                    ControlToValidate="tbPassword" Text="Password is required"></asp:RequiredFieldValidator>
           
            </div>

            <div>

                <asp:Button runat="server" ID="btnLogin" Text="Login"/>

            &nbsp;&nbsp;&nbsp;
                <asp:HyperLink ID="hpSignup" runat="server" NavigateUrl="~/Signup.aspx">Sign Up</asp:HyperLink>

            </div>

        </div>
    </form>
</body>
</html>
