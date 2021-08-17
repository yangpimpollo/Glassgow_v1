<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="start.aspx.cs" Inherits="Glassgow_v1.start" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        
        <link rel="icon" href="./res/first-aid-kit.ico">
        <link href="./styles/start.css" rel="stylesheet"/>
        <title>Glassgow</title>
    </head>
    <body>

                <div id="wrapper">
            <main>
                <div id="main_box">
                    <div id="main_sub-box">
                        <div id="sub_left-box">
                            <div id="left-up">
                                <img id="logo" src="./res/logo_sinf.png">
                            </div>
                            <div id="left-down">
                                <h3 class="display-5">making healthcare better together.</h3>
                            </div>
                        </div>
                        <div id="sub_right-box">
                            <div id="form-box">
                                <div id="form-icon"><img src="./res/heart_mod.png" height="50px"></div>
                                <form id="form1" runat="server">
                                    <div class="mb-4">
                                        <asp:TextBox id="tbUsuario" CssClass="form-control" runat="server" placeholder="User Name" AutoCompleteType="Disabled"></asp:TextBox>
                                    </div> 
                                    <div class="mb-4">
                                        <asp:TextBox id="tbPassword" CssClass="form-control" TextMode="Password" runat="server" placeholder="Password"></asp:TextBox>
                                    </div> 
                                    <hr />
                                    <div class="row mb-1">
                                        <asp:Label runat="server" CssClass="alert-danger" ID="lblError"></asp:Label>
                                    </div> 
                                    <div class="d-grid">
                                        <asp:Button id="btnLogin" CssClass="btn btn-primary" runat="server" Text="log in" OnClick="btnLogin_Click"/>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
            <footer>
                <div id="footer_box">
                    <h8>designed and built by @amber</h8><br>
                    <h8>Glassgow Medical Corporation 2021</h8><br>
                    <h8>All rights reserved v1.0.2</h8>
                </div>
            </footer>
        </div>
    </body>
</html>
