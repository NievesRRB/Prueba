<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm7.aspx.cs" Inherits="pruebaNET.WebForm7" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblIdDpto" runat="server" Text="Id. Dpto:"></asp:Label>
                <asp:TextBox ID="txtIdDpto" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldDpto" runat="server" ErrorMessage="Campo obligatorio, introduzca su identificador de dpto" ControlToValidate="txtIdDpto" ValidationGroup="empleado"></asp:RequiredFieldValidator>
            
            <br />
            <asp:Label ID="lblNombre" runat="server" text="Nombre:"> </asp:Label>
                <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator id="RequiredFieldNombre" runat="server" ErrorMessage="Campo obligatorio, introduzca nombre" ControlToValidate="txtNombre" ValidationGroup="empleado"></asp:RequiredFieldValidator>

            <br />
            <asp:Label ID="lblApellido" runat="server" Text="Apellido:"> </asp:Label>
                <asp:TextBox ID="txtApellido" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldApellido" runat="server" ErrorMessage="Campo obligatorio, introduzca su apellido" ControlToValidate="txtApellido" ValidationGroup="empleado"></asp:RequiredFieldValidator>

            <br />
            <asp:Label ID="lblDNI" runat="server" Text="DNI:"></asp:Label>
                <asp:TextBox ID="txtDNI" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldDNI" runat="server" ErrorMessage="Campo obligatorio, introduzca su DNI" ControlToValidate="txtDNI" ValidationGroup="empleado"></asp:RequiredFieldValidator>

            <!--Boton de guardar datos, ya sea para alta nueva o para actualizar datos. -->
            <asp:Button ID="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click" ValidationGroup="empleado" />
           
        </div>
    </form>
</body>
</html>
