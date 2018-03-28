<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="pruebaNET.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="btndemo" runat="server" Text="Demo" OnClick="Button1_Click" />
            <asp:label id="lblfecha" runat="server"></asp:label>

        </div>
        <p>
            <asp:Label ID="lblNombre" runat="server" Text ="Nombre:"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

            <asp:Label ID="lblApellido" runat="server" Text ="Apellido:"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        </p>

        <p>
            <asp:Button ID="btnvalidar" runat="server" Text="Validar" OnClick="btnvalidar_Click" />
        </p>

        
        <asp:Label ID="lblNombre1" runat="server" Text ="Nombre:"></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem Value="1"> Juan </asp:ListItem>
            <asp:ListItem Value="2"> Maria </asp:ListItem>
            <asp:ListItem Value="3"> Antonio </asp:ListItem>
            <asp:ListItem Value="4"> Pepe </asp:ListItem>   
        </asp:DropDownList>
       
       
        <asp:Label ID="lblApellido1" runat = "server" Text ="Apellido:"></asp:Label>
        <asp:DropDownList ID="DropDownList2" runat="server" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="true">
            <asp:ListItem Value="1" Text="Garcia"> Garcia </asp:ListItem>
            <asp:ListItem Value="2" Text="Lopez"> Lopez </asp:ListItem>
            <asp:ListItem Value="3" Text="Rodriguez"> Rodriguez </asp:ListItem>
            <asp:ListItem Value="4" Text="Martinez"> Martinez </asp:ListItem>  
        </asp:DropDownList>

        <p>
            <asp:Label ID="datos" runat="server" Text="Datos seleccionados:"></asp:Label>
        </p>

        <p>
            <asp:label ID="lblvalor" runat ="server"> El valor es: </asp:label>
        </p>


        


    </form>
</body>
</html>
