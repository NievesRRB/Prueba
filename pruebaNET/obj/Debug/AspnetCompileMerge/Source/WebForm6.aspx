<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm6.aspx.cs" Inherits="pruebaNET.WebForm6" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!--Metiamos el id_departamento con un nº-->
            <!--<asp:Label ID="lblCampo0" runat="server" Text="id_departamento:"></asp:Label>
                <asp:TextBox ID="txtiddpto" runat="server"></asp:TextBox>-->
            <!--Llamamos a un desplegable que nos cargue los departamentos disponibles-->
            <asp:Label ID="lblCampoId" runat ="server" Text="id_departamento: "></asp:Label>
                <asp:DropDownList ID="ddlDepartamentos" runat="server" DataTextField="nombre" DataValueField="id_departamento" AutoPostBack="true" Required="true" AppendDataBoundItems="true"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldIdDpto" runat="server" InitialValue="Seleccionar..." ErrorMessage="No puede ser un campo vacío" ControlToValidate="ddlDepartamentos" ForeColor="Red" ValidationGroup="empleado" CausesValidation="true"></asp:RequiredFieldValidator>
            
            <br />
            <asp:Label ID="lblCampo1" runat="server" Text="Nombre:"></asp:Label>
                <asp:TextBox ID="txtNombre" runat ="server" Required="true"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldNombre" runat="server" ErrorMessage="No puede ser un campo vacío" ControlToValidate="txtNombre" ForeColor="Red" ValidationGroup="empleado" CausesValidation ="true"></asp:RequiredFieldValidator>
                <!--<asp:RegularExpressionValidator id="RegularExpressionNombre" runat="server" ErrorMessage="Datos no permitidos" ControlToValidate="txtNombre" ValidationExpression="[A-Za-z]"></asp:RegularExpressionValidator>-->
            
            
            <br />
            <asp:Label ID="lblCampo2" runat="server" Text="Apellido:"></asp:Label>
                <asp:TextBox ID="txtApellido1" runat="server" Required="true"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldApellido1" runat="server" ErrorMessage="No puede ser un campo vacío" ControlToValidate="txtApellido1" ForeColor="Red" ValidationGroup="empleado" CausesValidation="true"></asp:RequiredFieldValidator>
                 <!--<asp:RegularExpressionValidator id="RegularExpressionApellido1" runat="server" ErrorMessage="Datos no permitidos" ControlToValidate="txtApellido1" ValidationExpression="[A-Za-z]"></asp:RegularExpressionValidator>-->
            
            
             <!--<asp:Label ID="lblCampo3" runat="server" Text="Apellido-2:"></asp:Label>-->
                <!--<asp:TextBox ID="txtApellido2" runat="server"></asp:TextBox>-->
                <!--<asp:RequiredFieldValidator ID="RequiredFieldApellido2" runat="server" ErrorMessage="No puede ser un campo vacío" ControlToValidate="txtApellido2" ForeColor="Red" ValidationGroup="empleado"></asp:RequiredFieldValidator>-->
            
            <br />
             <asp:Label ID="lblCampo4" runat="server" Text="DNI:"></asp:Label>
               <asp:TextBox ID="txtDNI" runat="server" Required="true"></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiriedFieldDNI" runat="server" ErrorMessage="DNI Inválido" ControlToValidate="txtDNI" ForeColor="Red" ValidationGroup="empleado" CausesValidation="true"></asp:RequiredFieldValidator>
               <!--<asp:RegularExpressionValidator id="RegularExpressionDNI" runat="server" ErrorMessage="Formato no válido" ControlToValidate="txtDNI" ValidationExpression="[0-9]-[A-Z]"></asp:RegularExpressionValidator>-->

            <asp:Button ID="btnGuardar" Text="Guardar" runat="server" OnClick="btnGuardar_Click" ValidationGroup="empleado" OnClientClick="validarIdDpto()" />
            
        </div>
    </form>
</body>
</html>

<!--Función para controlar en el cliente que el id_departamento no vaya vacío, hemos creado el evento OnClientClick-->
<!-- Con el return false no deberia de realizar la validación en el servidor, en este caso lo ideal seria, quitar
    el evento de Onclick del botón y realizar una llamada a ajax-->
<script>
    function validarIdDpto() {
        //Controlamos que se seleccione uno de los departamentos y no se quede vacio. 
        if ($("#ddlDepartamentos option:selected").text() == "Seleccionar...") {
            alert("El id_departamento es un campo obligatorio");

            return false;
        }
    }
</script>
