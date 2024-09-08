<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="PoemPal.Signup" %>

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
                <asp:Label runat="server" ID="lblName" AssociatedControlID="tbName">Name:</asp:Label>
                <asp:TextBox runat="server" ID="tbName"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="requiredFieldValidatorName"
                    ControlToValidate="tbName" Text="Name is required"></asp:RequiredFieldValidator>
           
                <!-- validate length -->
                <asp:RegularExpressionValidator runat="server" ID="lengthValidatorName"
                    ControlToValidate="tbName" Text="Name must be at least 3 characters long"
                    ValidationExpression="^.{3,}$"></asp:RegularExpressionValidator>
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
           
                <!-- validate length -->
                <asp:RegularExpressionValidator runat="server" ID="lengthValidatorPassword"
                    ControlToValidate="tbPassword" Text="Password must be at least 8 characters long"
                    ValidationExpression="^.{8,}$"></asp:RegularExpressionValidator>
            </div>

            <div>
                <asp:Label runat="server" ID="lblComfirmPass" AssociatedControlID="tbConfirmPass">Confirm Password:</asp:Label>
                <asp:TextBox runat="server" ID="tbConfirmPass" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="requiredFieldValidatorConfirmPass"
                    ControlToValidate="tbConfirmPass" Text="Confirm Password is required"></asp:RequiredFieldValidator>
           
                <asp:CompareValidator runat="server" ID="compareValidatorConfirmPass" ControlToCompare="tbPassword"
                    ControlToValidate="tbConfirmPass" Text="Password and Confirm Password do not match"></asp:CompareValidator>
            </div>

            <div>

                <asp:Button runat="server" ID="btnSignup" Text="Signup"/>

            &nbsp;&nbsp;&nbsp;
                <asp:HyperLink ID="hpLogin" runat="server" NavigateUrl="~/Login.aspx">Login</asp:HyperLink>

            </div>

        </div>
    </form>
</body>
</html>
