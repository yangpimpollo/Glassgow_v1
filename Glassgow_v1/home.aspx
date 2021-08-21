<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="Glassgow_v1.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <link rel="icon" href="./res/first-aid-kit.ico">
        <link href="./styles/home.css" rel="stylesheet"/>
        <title>Glassgow</title>
    </head>
    <body>
        <form id="form1" runat="server">
            <div id="wrapper">
                <header>
                    <nav class="navbar" id="nav1">
                        <div class="container">
                            <div id="nav-11">
                                <a class="navbar-brand" href="#">
                                    <img id="nav-logo" src="./res/logo_blk.png" height="40" >
                                </a>
                            </div>
                            <div id="nav-12">
                                <div id="subnav-12">
                                    <div class="input-group input-group-sm mb-3">
                                        <asp:TextBox id="search_bar" runat="server" Cssclass="form-control" placeholder="    search" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" OnTextChanged="search_bar_TextChanged"></asp:TextBox>
                                        <span id="search_span" class="input-group-text" id="inputGroup-sizing-sm">
                                            <select id="select1" aria-label=".form-select-sm example">
                                                <option selected>product</option>
                                                <option value="1">provider</option>
                                                <option value="2">category</option>
                                                <option value="3">mark</option>
                                            </select>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div id="nav-13">
                                <div class="btn-group btn-group-sm" role="group" aria-label="Basic mixed styles example">
                                    <button id="btn_add" type="button" class="btn btn-primary"></button>
                                    <asp:LinkButton id="btn_out" runat="server" CssClass="btn btn-danger" OnClick="btn_out_Click"></asp:LinkButton>
                                  </div>
                            </div>
                        </div>
                    </nav>
                </header>

                <div class="section" id="sec-1">
                    <div id="sec-box">
                        <div id="sec-up">
                            <img id="sec-img" src="./res/medic.png" alt="">   
                        </div>
                        <div id="sec-down">
                            <a href="#sec-2">
                                <asp:Label id="lb_user" runat="server" Text="" CssClass="h3 display-5"></asp:Label>
                                <h4 class="display-8">welcome to our platform click here to start</h4>
                            </a>                            
                        </div>                       
                    </div>                       
                </div>
                <div class="section" id="sec-2">
    
                </div>

            </div>
        </form>
    </body>
</html>
