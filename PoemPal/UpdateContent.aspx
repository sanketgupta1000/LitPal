<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateContent.aspx.cs" Inherits="PoemPal.UpdateContent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update Content</title>
    <!-- Adding Bootstrap for styling -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            padding-top: 60px;
            background-color: #f8f9fa;
        }
        .update-container {
            max-width: 600px;
            margin: auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        textarea {
            resize: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="update-container">
                <h2 class="mb-4">Update Content</h2>

                <!-- Title Input -->
                <div class="form-group">
                    <label for="tbTitle">Title</label>
                    <asp:TextBox ID="tbTitle" runat="server" CssClass="form-control" Width="100%"></asp:TextBox>
                </div>

                <!-- Content Input -->
                <div class="form-group">
                    <label for="tbContent">Content</label>
                    <asp:TextBox ID="tbContent" runat="server" TextMode="MultiLine" CssClass="form-control" Rows="6" Width="100%"></asp:TextBox>
                </div>

                <!-- Action Buttons -->
                <div class="form-group text-right">
                    <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-primary" OnClick="btnUpdate_Click" Text="Update" />
                    <asp:Button ID="btnHome" runat="server" CausesValidation="False" CssClass="btn btn-secondary ml-2" OnClick="btnHome_Click" Text="Go Home" />
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
