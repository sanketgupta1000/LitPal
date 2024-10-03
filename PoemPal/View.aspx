<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="PoemPal.View" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Content</title>
    <!-- Adding Bootstrap for styling -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            padding-top: 60px;
            background-color: #f8f9fa;
        }
        .view-container {
            max-width: 800px;
            margin: auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .content-label {
            white-space: pre-wrap;
        }
        .btn-group {
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="view-container">
                <!-- Title -->
                <h1 class="display-4">
                    <asp:Label runat="server" ID="lblTitle" CssClass="font-weight-bold"></asp:Label>
                </h1>

                <!-- Author and Action Buttons -->
                <p>
                    <asp:Label runat="server" ID="lblAuthor" CssClass="text-muted"></asp:Label>
                    <div class="btn-group float-right">
                        <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger" OnClick="btnDelete_Click" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn btn-warning" OnClick="btnEdit_Click" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnHome" runat="server" Text="Go Home" CssClass="btn btn-secondary" OnClick="btnHome_Click" />
                    </div>
                </p>

                <!-- Type and Date -->
                <p>
                    <asp:Label runat="server" ID="lblType" CssClass="badge badge-primary"></asp:Label>
                    <span class="text-muted">&bull;</span>
                    <asp:Label runat="server" ID="lblDate" CssClass="text-muted"></asp:Label>
                </p>

                <hr />

                <!-- Content -->
                <div>
                    <asp:Label runat="server" ID="lblContent" CssClass="content-label"></asp:Label>
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
