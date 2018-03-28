<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="pruebaNET.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblNum1" Text="Introduzca un primer nº:" runat ="server"></asp:Label>
            <asp:TextBox ID="txtNumero1" runat="server"></asp:TextBox>
            <p>
                <asp:Label ID="lblNum2" Text="Introduzca un segundo nº:" runat ="server"></asp:Label>
                <asp:TextBox ID="txtNumero2" runat="server" ></asp:TextBox>
            </p>
            <asp:Button id="btnSuma" Text="Suma" runat="server" OnClick="btnSuma_Click"/> 
        </div>
    </form>
</body>
</html>
