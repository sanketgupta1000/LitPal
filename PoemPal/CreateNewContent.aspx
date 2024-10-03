<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateNewContent.aspx.cs" Inherits="PoemPal.CreateNewContent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create New Content</title>
    <!-- Adding Bootstrap for styling -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        /* Custom styles */
        body {
            padding-top: 60px;
            background-color: #f7f7f7;
        }
        .form-container {
            max-width: 600px;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            margin: auto;
        }
        .form-group label {
            font-weight: bold;
        }
        textarea {
            width: 100%;
            overflow: hidden;
            min-height: 100px;
            resize: none;
        }
    </style>
    <script type="text/javascript">
        // Script to auto-expand the textarea as the user types
        function autoExpand(textarea) {
            textarea.style.height = 'auto';
            textarea.style.height = (textarea.scrollHeight) + 'px';
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="form-container">
                <h2 class="text-center">Create New Content</h2>

                <!-- Title Input -->
                <div class="form-group">
                    <asp:Label runat="server" ID="lblTitle" AssociatedControlID="tbTitle" CssClass="control-label">Title:</asp:Label>
                    <asp:TextBox runat="server" ID="tbTitle" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="rfvTitle" ControlToValidate="tbTitle"
                        CssClass="text-danger" Text="Title is required"></asp:RequiredFieldValidator>
                </div>

                <!-- Type Dropdown -->
                <div class="form-group">
                    <asp:Label runat="server" ID="lblType" AssociatedControlID="ddlType" CssClass="control-label">Type:</asp:Label>
                    <asp:DropDownList runat="server" ID="ddlType" CssClass="form-control">
                        <asp:ListItem Text="Please Select" Selected="True" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Story" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Poem" Value="2"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:CompareValidator runat="server" ID="cvType" ControlToValidate="ddlType"
                        Operator="NotEqual" ValueToCompare="0" CssClass="text-danger" Text="Please select a valid type"></asp:CompareValidator>
                </div>

                <!-- Content Textarea -->
                <div class="form-group">
                    <asp:Label runat="server" ID="lblContent" AssociatedControlID="tbContent" CssClass="control-label">Content:</asp:Label>
                    <asp:TextBox runat="server" ID="tbContent" TextMode="MultiLine" CssClass="form-control" Rows="5" onkeyup="autoExpand(this)"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="rfvContent" ControlToValidate="tbContent"
                        CssClass="text-danger" Text="Content is required"></asp:RequiredFieldValidator>
                </div>

                <!-- Buttons -->
                <div class="form-group text-center">
                    <asp:Button runat="server" ID="btnSubmit" Text="Submit" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
                    &nbsp;&nbsp;
                    <asp:Button ID="btnHome" runat="server" CausesValidation="False" OnClick="btnHome_Click" Text="Go Home" CssClass="btn btn-secondary" />
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
