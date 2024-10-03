<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="PoemPal.Signup" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Signup - PoemPal</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    
    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .signup-container {
            max-width: 450px;
            margin: 100px auto;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
        }
        .signup-container h3 {
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
        <div class="signup-container">
            <h3>Sign Up</h3>

            <div class="form-group">
                <asp:Label runat="server" ID="lblNotify" CssClass="text-danger"></asp:Label>
            </div>

            <div class="form-group">
                <asp:Label runat="server" ID="lblName" AssociatedControlID="tbName" CssClass="form-label">Name:</asp:Label>
                <asp:TextBox runat="server" ID="tbName" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="requiredFieldValidatorName"
                    ControlToValidate="tbName" CssClass="text-danger" Text="Name is required"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator runat="server" ID="lengthValidatorName"
                    ControlToValidate="tbName" CssClass="text-danger" Text="Name must be at least 3 characters long"
                    ValidationExpression="^.{3,}$"></asp:RegularExpressionValidator>
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
                <asp:RegularExpressionValidator runat="server" ID="lengthValidatorPassword"
                    ControlToValidate="tbPassword" CssClass="text-danger" Text="Password must be at least 8 characters long"
                    ValidationExpression="^.{8,}$"></asp:RegularExpressionValidator>
            </div>

            <div class="form-group">
                <asp:Label runat="server" ID="lblConfirmPass" AssociatedControlID="tbConfirmPass" CssClass="form-label">Confirm Password:</asp:Label>
                <asp:TextBox runat="server" ID="tbConfirmPass" TextMode="Password" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="requiredFieldValidatorConfirmPass"
                    ControlToValidate="tbConfirmPass" CssClass="text-danger" Text="Confirm Password is required"></asp:RequiredFieldValidator>
                <asp:CompareValidator runat="server" ID="compareValidatorConfirmPass"
                    ControlToCompare="tbPassword" ControlToValidate="tbConfirmPass" CssClass="text-danger"
                    Text="Password and Confirm Password do not match"></asp:CompareValidator>
            </div>

            <div class="form-group">
                <asp:Button runat="server" ID="btnSignup" Text="Sign Up" CssClass="btn btn-primary" />
            </div>

            <div class="text-center">
                <asp:HyperLink ID="hpLogin" runat="server" NavigateUrl="~/Login.aspx">Already have an account? Login</asp:HyperLink>
            </div>
        </div>
    </form>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
