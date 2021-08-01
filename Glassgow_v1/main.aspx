﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="Glassgow_v1.main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link href="./styles/global_styles.css" rel="stylesheet"/>
    <title>Glassgow</title>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <nav class="navbar" id="nav1">
                <div class="container">
                  <a class="navbar-brand" href="#">
                    <img src="./res/logo.png" width="183.6" height="50.4" >
                  </a>
                  <div>
                    <div class="d-inline p-1" id="addbutton">
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">añadir</button>
                    </div>
                    <div class="d-inline p-1">
                        <asp:Button ID="BtnCerrar" runat="server" Text="log out" CssClass="btn btn-dark" OnClick="BtnCerrar_Click1"/>
                    </div>
                  </div>
                  

                </div>
            </nav>
        </header>
        
        <main>
            <div>
                <asp:Label ID="lblBienvenida" runat="server" Text="" CssClass="h3"></asp:Label>
                <asp:TextBox ID="TextBox6" CssClass="form-control" runat="server" placeholder="date" TextMode="Date"></asp:TextBox>
                <asp:Button ID="btfecha" runat="server" Text="Button" OnClick="btfecha_Click" />
                <asp:Label ID="lbfecha" runat="server" Text="Label"></asp:Label>
            </div>
        </main>
        <footer>
            <div id="fbox">
                <h8>designed and built by @amber</h8><br>
                <h8>Glassgow Medical Corporation 2021</h8><br>
                <h8>All rights reserved v1.0.2</h8>
            </div>
        </footer>
        <!-- Modal -->
        <div class="modal fade" runat="server" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <asp:TextBox ID="tbProduct" CssClass="form-control bg-red-200" runat="server" placeholder="product"></asp:TextBox>
                        <div class="row mt-3">
                            <div class="col d-inline-block">
                                <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" placeholder="provider"></asp:TextBox>
                            </div>
                            <div class="col d-inline-block">
                                <asp:DropDownList ID="DropDownList1" CssClass="form-select" runat="server">
                                    <asp:ListItem Value="1"> Instrumentos Quirurgicos </asp:ListItem>
                                    <asp:ListItem Value="2"> Instrumento Dental </asp:ListItem>
                                    <asp:ListItem Value="3"> Instrumento de Laboratorio </asp:ListItem>
                                    <asp:ListItem Value="4"> Equipo Medico </asp:ListItem>
                                    <asp:ListItem Value="5"> Descartable comun </asp:ListItem>
                                    <asp:ListItem Value="6"> Aparato Pequeño </asp:ListItem>
                                    <asp:ListItem Value="7"> Insumo Medico </asp:ListItem>
                                    <asp:ListItem Selected="True" Value="0"> other </asp:ListItem>                              
                                </asp:DropDownList>        
                            </div>
                        </div>

                        <div class="row mt-3">
                            <div class="col d-inline-block">
                                <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server" placeholder="mark"></asp:TextBox>
                            </div>
                            <div class="col d-inline-block">
                                <asp:TextBox ID="TextBox4" CssClass="form-control" runat="server" placeholder="format"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row mt-3">
                            <div class="col d-inline-block">
                                <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server" placeholder="price" TextMode="Number"></asp:TextBox>
                            </div>
                            <div class="col d-inline-block">
                                <asp:TextBox ID="TextBox5" CssClass="form-control" runat="server" placeholder="date" TextMode="Date"></asp:TextBox>
                            </div>
                        </div>


                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <asp:Button ID="btnSave" runat="server" Text="Save changes" CssClass="btn btn-primary" OnClick="btnSave_Click"/>

                    </div>
                </div>
            </div>
        </div>
        
    </form>
</body>
</html>
