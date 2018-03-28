<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="pruebaNET.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label id="lblNum1" runat="server" Text="Introduzca un primer nº:"></asp:Label>
            <asp:TextBox ID="txtNum1" runat ="server"></asp:TextBox>
            <p>
                <asp:Label ID="lblNum2" runat="server" Text="Introduzca un segundo nº:"></asp:Label>
                <asp:TextBox id="txtNum2" runat ="server"></asp:TextBox>
            </p>
            <p>       
                <asp:RadioButtonList ID="rdBtnLst" runat="server" OnSelectedIndexChanged="rdBtnLst_SelectedIndexChanged" AutoPostBack="true" >
                    <asp:ListItem Text="Suma" Value="Operacion::Suma"></asp:ListItem>
                    <asp:ListItem Text="Resta" Value="resta" ></asp:ListItem>
                    <asp:ListItem Text="Multiplicacion" Value="mult" ></asp:ListItem>
                </asp:RadioButtonList>
            </p>

            <p>
                <asp:Label runat="server" ID="lblResultado"></asp:Label>
            </p>
           
        </div>
    </form>
</body>
</html>
