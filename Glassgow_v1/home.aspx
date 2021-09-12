<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="Glassgow_v1.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <link rel="icon" href="./res/first-aid-kit.ico">
        <link href="./styles/home.css" rel="stylesheet"/>
        <title>Glassgow</title>
    </head>
    <body>
        <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
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
                                        <asp:TextBox id="search_bar" runat="server" Cssclass="form-control" placeholder="    search" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" AutoPostBack="true" OnTextChanged="search_bar_TextChanged" ></asp:TextBox>
                                        <span id="search_span" class="input-group-text" id="inputGroup-sizing-sm">
                                            <asp:DropDownList ID="select1"  aria-label=".form-select-sm example" runat="server">
                                                <asp:ListItem Selected="True" Value="m_product"> product </asp:ListItem>
                                                <asp:ListItem Value="m_provider"> provider </asp:ListItem>
                                                <asp:ListItem Value="m_category"> category </asp:ListItem>
                                                <asp:ListItem Value="m_mark"> mark </asp:ListItem>
                                            </asp:DropDownList>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div id="nav-13">
                                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                    <ContentTemplate>
                                        <div class="btn-group btn-group-sm" role="group" aria-label="Basic mixed styles example">
                                            <asp:LinkButton id="btn_add" runat="server" CssClass="btn btn-primary" OnClick="btn_add_Click" causesvalidation="false"></asp:LinkButton>
                                            <%--<button id="btn_add" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal"  data-backdrop="static" data-keyboard="false"></button>--%>
                                            <asp:LinkButton id="btn_out" runat="server" CssClass="btn btn-danger" OnClick="btn_out_Click"></asp:LinkButton>
                                        </div>                                
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="btn_add"/>
                                    </Triggers>
                                </asp:UpdatePanel>
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
                    <div ID="databox" class="overflow-auto">                        
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="GridView1" runat="server" Cssclass="table table-light table-hover table-responsive" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataKeyNames="id" OnRowDeleting="rowDelet" OnRowCommand="rowCommand">
                                    <Columns>
                                        <asp:TemplateField HeaderText="        #">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server"
                                                    Text='<%# (GridView1.PageSize * GridView1.PageIndex) + Container.DisplayIndex + 1 %>'>
                                                </asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="m_Product" HeaderText="Product" />
                                        <asp:BoundField DataField="m_Provider" HeaderText="Provider" />
                                        <asp:BoundField DataField="m_Category" HeaderText="Category" />
                                        <asp:BoundField DataField="m_Mark" HeaderText="Mark" />
                                        <asp:BoundField DataField="m_Format" HeaderText="Format" />
                                        <asp:BoundField DataField="m_Price" HeaderText="Price" />
                                        <asp:BoundField DataField="id" HeaderText="id" Visible="False" />
                                        <asp:TemplateField HeaderText="Actions">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="link" Cssclass="btn btn-warning" CommandArgument='<%# Eval("id") %>' OnClick="link_Click" causesvalidation="false">edit</asp:LinkButton>
                                                <%--<asp:Button runat="server" id="gridEdit_btn" Text="Edit" Cssclass="btn btn-warning"  data-bs-toggle="modal" data-bs-target="#exampleModal"  data-backdrop="static" data-keyboard="false" CommandName="Select" CommandArgument="<%# Container.DataItemIndex %>" />--%>
                                                <asp:Button runat="server" Text="Del" Cssclass="btn btn-danger" CommandName="Delete"/>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:CommandField />
                                    </Columns>
                                    <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="12.5%" />
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:GridView>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="search_bar"/>
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </div>

                <!-- Modal -->
                <div class="modal fade" runat="server" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" >
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>

                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="3000"></asp:Timer>
                                    <div class="modal-body">
                                        <asp:TextBox ID="tbProduct" CssClass="form-control bg-red-200" runat="server" placeholder="product"></asp:TextBox>
                                        <div class="row mt-3">
                                            <div class="col d-inline-block">
                                                <asp:TextBox ID="tbProvider" CssClass="form-control" runat="server" placeholder="provider"></asp:TextBox>
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
                                                <asp:TextBox ID="tbMark" CssClass="form-control" runat="server" placeholder="mark"></asp:TextBox>
                                            </div>
                                            <div class="col d-inline-block">
                                                <asp:TextBox ID="tbFormat" CssClass="form-control" runat="server" placeholder="format"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="row mt-3">
                                            <div class="col d-inline-block">
                                                <asp:TextBox ID="tbPrice" CssClass="form-control" runat="server" placeholder="price"></asp:TextBox>
                                            </div>
                                            <div class="col d-inline-block">
                                                <asp:TextBox ID="tbDate" CssClass="form-control" runat="server" placeholder="date" TextMode="Date"></asp:TextBox>
                                            </div>
                                        </div>
                                        
                                        <hr />
                                        <div class="row mb-1">
                                            <asp:Label runat="server" id="lblError"></asp:Label>
                                        </div> 

                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                                    <%--<asp:AsyncPostBackTrigger ControlID="gridEdit_btn" EventName="Click" />--%>
                                    
                                </Triggers>
                            </asp:UpdatePanel>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <asp:Button type="button" ID="btnSave" runat="server" Text="Save changes" CssClass="btn btn-primary" OnClick="btnSave_Click"/>

                            </div>
                        </div>
                    </div>
                </div>
                <!-- fin_Modal -->
                <div id="myModal" class="modal" tabindex="-1" role="dialog">
                </div>
            </div>
        </form>
    </body>
</html>
