<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VerifyOtp.aspx.cs" Inherits="PoemPal.VerifyOtp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Verify OTP</title>
    <!-- Adding Bootstrap for styling -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            padding-top: 60px;
            background-color: #f8f9fa;
        }
        .otp-container {
            max-width: 400px;
            margin: auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="otp-container">
                <h2 class="text-center mb-4">Verify OTP</h2>

                <!-- Notification Label -->
                <div class="form-group">
                    <asp:Label runat="server" ID="lblNotify" CssClass="text-danger"></asp:Label>
                </div>

                <!-- OTP Input -->
                <div class="form-group">
                    <label for="tbOtp">OTP:</label>
                    <asp:TextBox runat="server" ID="tbOtp" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="requiredFieldValidatorOtp"
                        ControlToValidate="tbOtp" CssClass="text-danger" Text="OTP is required"></asp:RequiredFieldValidator>
                </div>

                <!-- Verify Button -->
                <div class="form-group text-center">
                    <asp:Button runat="server" ID="btnVerifyOtp" CssClass="btn btn-primary btn-block" Text="Verify" />
                </div>
            </div>
        </div>
    </form>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
