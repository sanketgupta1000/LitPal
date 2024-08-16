<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateNewContent.aspx.cs" Inherits="PoemPal.CreateNewContent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        /* Style to auto-expand the textarea */
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
        <div>
            <!-- Title Controls -->
            <asp:Label runat="server" ID="lblTitle" AssociatedControlID="tbTitle">Title: </asp:Label>
            <asp:TextBox runat="server" ID="tbTitle"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ID="rfvTitle" ControlToValidate="tbTitle"
                Text="Title is required"></asp:RequiredFieldValidator>

            <br /><br />

            <!-- Dropdown for Selecting Type -->
            <asp:Label runat="server" ID="lblType" AssociatedControlID="ddlType">Type: </asp:Label>
            <asp:DropDownList runat="server" ID="ddlType">
                <asp:ListItem Text="Please Select" Selected="True" Value="0"></asp:ListItem>
                <asp:ListItem Text="Story" Value="1"></asp:ListItem>
                <asp:ListItem Text="Poem" Value="2"></asp:ListItem>
            </asp:DropDownList>
            
            <asp:CompareValidator runat="server" ID="cvType" ControlToValidate="ddlType"
                Operator="NotEqual" ValueToCompare="0" Text="Please select a valid type"></asp:CompareValidator>

            <br /><br />

            <!-- Content Textbox -->
            <asp:Label runat="server" ID="lblContent" AssociatedControlID="tbContent">Content: </asp:Label>
            <asp:TextBox runat="server" ID="tbContent" TextMode="MultiLine" Rows="5" onkeyup="autoExpand(this)"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ID="rfvContent" ControlToValidate="tbContent"
                Text="Content is required"></asp:RequiredFieldValidator>
        </div>

        <div>

            <asp:Button runat="server" ID="btnSubmit" Text="Submit" />

        </div>
    </form>
</body>
</html>
