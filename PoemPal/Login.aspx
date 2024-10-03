<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PoemPal.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login - PoemPal</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    
    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .login-container {
            max-width: 400px;
            margin: 100px auto;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
        }
        .login-container h3 {
            text-align: center;
            margin-bottom: 20px;
            color: #007bff;
        }
        .form-label {
            font-weight: bold;
        }
        .btn-primary {
            width: 100%;
        }
        .text-center {
            margin-top: 15px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <h3>Login</h3>

            <div class="form-group">
                <asp:Label runat="server" ID="lblNotify" CssClass="text-danger"></asp:Label>
            </div>

            <div class="form-group">
                <asp:Label runat="server" ID="lblEmail" AssociatedControlID="tbEmail" CssClass="form-label">Email:</asp:Label>
                <asp:TextBox runat="server" ID="tbEmail" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="requiredFieldValidatorEmail"
                    ControlToValidate="tbEmail" CssClass="text-danger" Text="Email is required"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator runat="server" ID="regexValidatorEmail"
                    ControlToValidate="tbEmail" CssClass="text-danger" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    Text="Please enter a valid email"></asp:RegularExpressionValidator>
            </div>

            <div class="form-group">
                <asp:Label runat="server" ID="lblPassword" AssociatedControlID="tbPassword" CssClass="form-label">Password:</asp:Label>
                <asp:TextBox runat="server" ID="tbPassword" TextMode="Password" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="requiredFieldValidatorPassword"
                    ControlToValidate="tbPassword" CssClass="text-danger" Text="Password is required"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <asp:Button runat="server" ID="btnLogin" Text="Login" CssClass="btn btn-primary"/>
            </div>

            <div class="text-center">
                <asp:HyperLink ID="hpSignup" runat="server" NavigateUrl="~/Signup.aspx">Don't have an account? Sign Up</asp:HyperLink>
            </div>
        </div>
    </form>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
