<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VerifyOtp.aspx.cs" Inherits="PoemPal.VerifyOtp" %>

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

                <asp:Label runat="server" ID="lblOtp" AssociatedControlID="tbOtp">
                    OTP:
                </asp:Label>

                <asp:TextBox runat="server" ID="tbOtp" ></asp:TextBox>

                <asp:RequiredFieldValidator runat="server" ID="requiredFieldValidatorOtp"
                    ControlToValidate="tbOtp" Text="OTP is required"></asp:RequiredFieldValidator>

            </div>

            <div>
                <asp:Button runat="server" ID="btnVerifyOtp" Text="Verify"/>
            </div>

        </div>
    </form>
</body>
</html>
