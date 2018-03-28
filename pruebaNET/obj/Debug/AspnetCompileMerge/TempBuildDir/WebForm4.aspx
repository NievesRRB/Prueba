<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm4.aspx.cs" Inherits="pruebaNET.WebForm4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous"><meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="font/css/open-iconic.css" rel="stylesheet">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label id="lblTitulo1" Text="Persona" runat="server"></asp:Label>
            <asp:Label id="lblTitulo2" Text="Gestión de usuarios" runat="server"></asp:Label>
        </div>

        <table class="table table-striped">
        
        <thead>Registro</thead> 
               
        <thead> 
            <tr>
                <th>Nombre</th>
                <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                <th>Apellido-1</th>
                <asp:TextBox ID="txtApellido1" runat="server"></asp:TextBox>
                <th>Apellido-2</th> 
                <asp:TextBox ID="txtApellido2" runat="server"></asp:TextBox>
                <th> 
                    <asp:Button ID="btnAlta" runat="server" OnClick="btnAlta_Click" Text="Alta_usuario" class="btn btn-default btn-sm"/>
                </th>
            </tr>           
        </thead>
        <tbody>
            <tr>
                <td>Pepe</td>
                <td>Suarez</td>
                <td>García</td>
                <td>
                    <button type="button" class="btn btn-default btn-sm">
                        <span class="oi" data-glyph="pencil"></span>
                    </button>
                    <button type="button" class="btn btn-default btn-sm">
                        <span class="oi" data-glyph="print"></span>
                    </button>
                    <button type="button" class="btn btn-default btn-sm">
                        <span class="oi" data-glyph="trash"></span>
                    </button>
                </td>
            </tr>

            <tr>
                <td>Juan</td>
                <td>López</td>
                <td>Rodríguez</td>
                <td>
                    <button type="button" class="btn btn-default btn-sm">
                        <span class="oi" data-glyph="pencil"></span>
                    </button>
                    <button type="button" class="btn btn-default btn-sm">
                        <span class="oi" data-glyph="print"></span>
                    </button>
                    <button type="button" class="btn btn-default btn-sm">
                        <span class="oi" data-glyph="trash"></span>
                    </button>
                </td>
            </tr>

            <tr>
                <td>María</td>
                <td>Martínez</td>
                <td>González</td>
                <td>
                    <button type="button" class="btn btn-default btn-sm">
                        <span class="oi" data-glyph="pencil"></span>
                    </button>
                    <button type="button" class="btn btn-default btn-sm">
                        <span class="oi" data-glyph="print"></span>
                    </button>
                    <button type="button" class="btn btn-default btn-sm">
                        <span class="oi" data-glyph="trash"></span>
                    </button>
                </td>
            </tr>

            <tr>
                <td>Antonio</td>
                <td>López</td>
                <td>García</td>
                <td>
                    <button type="button" class="btn btn-default btn-sm">
                        <span class="oi" data-glyph="pencil"></span>
                    </button>
                    <button type="button" class="btn btn-default btn-sm">
                        <span class="oi" data-glyph="print"></span>
                    </button>
                    <button type="button" class="btn btn-default btn-sm">
                        <span class="oi" data-glyph="trash"></span>
                    </button>
                </td>
            </tr>



        </tbody>

        <tfoot>
            <td>
                </button>
                       <button type="button" class="btn btn-default btn-sm">
                        <span class="oi" data-glyph="arrow-thick-left"></span>
                </button>  
            </td>
            <td>
                </button>
                <button type="button" class="btn btn-default btn-sm">
                    <span class="oi" data-glyph="one"></span>
                </button>
            </td>
            <td>
                </button>
                <button type="button" class="btn btn-default btn-sm">
                    <span class="oi" data-glyph="arrow-thick-right"></span>
                </button>
            </td>
        </tfoot>
    </table>
    </form>
</body>
</html>
