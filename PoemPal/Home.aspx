<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="PoemPal.Home" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home - PoemPal</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f8f9fa;
        }
        /* Header styling */
        .navbar {
            background-color: #343a40;
            padding: 10px 20px; /* Adjust padding */
        }
        .navbar-brand {
            color: #ffffff !important;
            font-size: 1.5rem;
        }
        .navbar-nav .nav-link {
            color: #ffffff !important;
            margin-right: 10px;
            font-size: 1rem; /* Adjust font size for better fit */
        }
        /* For smaller screens, ensure the buttons stack nicely */
        @media (max-width: 576px) {
            .navbar-nav {
                text-align: center;
            }
            .navbar-nav .nav-item {
                margin-bottom: 10px;
            }
        }
        .container {
            margin-top: 70px;
        }
        .table thead {
            background-color: #343a40;
            color: white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Header Section -->
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
            <div class="container-fluid"> <!-- Changed from container to container-fluid -->
                <a class="navbar-brand" href="#">PoemPal</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <asp:HyperLink runat="server" ID="hlCreateContent" NavigateUrl="~/CreateNewContent.aspx" CssClass="nav-link">Create New Content</asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <asp:Button runat="server" ID="btnLogout" Text="Logout" CssClass="btn btn-danger nav-link" OnClick="HandleLogout" />
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Content Section -->
        <div class="container">
            <div class="row text-center">
                <div class="col-md-12">
                    <asp:Label runat="server" ID="lblGreet" CssClass="h4 text-primary"></asp:Label>
                </div>
            </div>

            <!-- Dropdown for Filtering Content -->
            <div class="row text-center my-3">
                <div class="col-md-6 offset-md-3">
                    <asp:Label runat="server" ID="lblDDLContentType" AssociatedControlID="DDLContentType" CssClass="h6">Viewing: </asp:Label>
                    <asp:DropDownList runat="server" ID="DDLContentType" AutoPostBack="true" CssClass="form-control-sm">
                        <asp:ListItem Selected="True" Value="stories">Stories</asp:ListItem>
                        <asp:ListItem Value="poems">Poems</asp:ListItem>
                        <asp:ListItem Value="both">Stories & Poems</asp:ListItem>
                        <asp:ListItem Value="your">By You</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <!-- Content Table -->
            <div class="row">
                <div class="col-md-12">
                    <asp:GridView ID="GDVContent" runat="server" CssClass="table table-hover table-bordered text-center" AutoGenerateSelectButton="True" OnSelectedIndexChanged="HandleSelect">
                       
                    </asp:GridView>
                </div>
            </div>
        </div>
    </form>

    <!-- Include Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
