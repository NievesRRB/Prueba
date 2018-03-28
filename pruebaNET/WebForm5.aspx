<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm5.aspx.cs" Inherits="pruebaNET.WebForm5"  EnableEventValidation="false"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous"><meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="font/css/open-iconic.css" rel="stylesheet">
    <link href="font/estilo.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="titulo">
            <asp:Label id="lblTitulo1" Text="Persona - " runat="server"></asp:Label>
            <asp:Label id="lblTitulo2" Text="Gestión de usuarios" runat="server"></asp:Label>
        </div>

        <asp:DropDownList ID="ddlDepartamentos" runat="server" OnTextChanged="ddlDepartamentos_TextChanged" DataTextField="nombre" DataValueField="id_departamento" AutoPostBack="true" >
        </asp:DropDownList>       
              
        
        
        <asp:GridView ID="gdV" runat="server" AutoGenerateColumns="False" ShowHeader="true" >
            <Columns>
                <asp:BoundField DataField="nombre" HeaderText="Nombre"/>
                <asp:BoundField DataField="apellido" HeaderText="Apellido"/> 
                
                <asp:TemplateField>
                    <HeaderTemplate>
                        <asp:Button runat="server" ID="btnAlta" CssClass="btn btn-danger" Text="Nuevo" Width="150px" OnClick="btnAlta_Click"/>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <!--Lo q le pasamos dentro del Eval("") es el campo declarado en la bbdd -->
                        <asp:linkButton id="btnPencil" runat="server" CssClass="btn btn-default btn-sm" id_empleado='<%# Eval("id_empleado") %>' nombre='<%# Eval("nombre") %>' apellido='<%# Eval("apellido") %>' dni='<%# Eval("dni") %>' id_departamento='<%# Eval("id_departamento") %>' OnClick="btnPencil_Click" Title="Edicion con URL">
                            <span class="oi" data-glyph="pencil"></span>
                        </asp:linkButton>
                        <asp:linkButton id="btnPrint" runat="server" CssClass="btn btn-default btn-sm" Title="Imprimir datos">
                            <span class="oi" data-glyph="print"></span>
                        </asp:linkButton>
                        <asp:linkButton id="btnTrash" runat="server" CssClass="btn btn-default btn-sm" CommandName='<%# Bind("id_empleado") %>' OnClick="btnTrash_Click" Title="Eliminar">
                            <span class="oi" data-glyph="trash"></span>
                        </asp:linkButton>
                        <asp:LinkButton ID="btnEdit" runat="server" CssClass="btn btn-default btn-sm" OnClick="btnEdit_Click" CommandName='<%# Bind("id_empleado") %>' Title="Edicion con bbdd">
                            <span class="oi" data-glyph="wrench"></span>
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
   
           
        </asp:GridView>       
        </form>

        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
</body>
</html>
