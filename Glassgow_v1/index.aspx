<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Glassgow_v1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link href="./styles/global_styles.css" rel="stylesheet"/>
    <title>Glassgow</title>
</head>
<body>
    
        <header>
            <nav class="navbar" id="nav1">
                <div class="container">
                  <a class="navbar-brand" href="#">
                    <img src="./res/logo.png" width="183.6" height="50.4" >
                  </a>
                </div>
            </nav>
        </header>
        <main>
            <div id="container0">
                <img src="./res/sw2p.png" alt="" id="img1">
            </div>
            <div class="row" id="container1">
                <div class="col d-inline-block" id="box1">
                    <h3 class="display-4">making healthcare</h3>
                    <h1 class="display-2 fw-bold">Better together</h1>
                </div>
                <div class="col d-inline-block" id="box2">
                    <div id="f-box">
                        <h2 class="fw-bold text-center pt-4 pb-3">welcome</h2>
                        <form id="form1" runat="server">
                            <div class="mb-4">
                                <asp:TextBox ID="tbUsuario" CssClass="form-control" runat="server" placeholder="User Name" AutoCompleteType="Disabled"></asp:TextBox>
                            </div> 
                            <div class="mb-4">
                                <asp:TextBox ID="tbPassword" CssClass="form-control" TextMode="Password" runat="server" placeholder="Password"></asp:TextBox>
                            </div> 
                            <hr />
                            <div class="row mb-1">
                                <asp:Label runat="server" CssClass="alert-danger" ID="lblError"></asp:Label>
                            </div>
                            <div class="d-grid">
                                <asp:Button ID="BtnIngresar" CssClass="btn btn-primary" runat="server" Text="log in" OnClick="BtnIngresar_Click" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </main>
        <footer>
            <div id="fbox">
                <h8>designed and built by @amber</h8><br>
                <h8>Glassgow Medical Corporation 2021</h8><br>
                <h8>All rights reserved v1.0.2</h8>
            </div>
        </footer>
     
    </body>
</html>
