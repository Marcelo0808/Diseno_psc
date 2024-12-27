<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="wuc_Modulos2.ascx.cs" Inherits="CasaToro.Portal.Comisiones.Views.Account.wuc_Modulos2" %>
<div id="btn-left">
    <i class="fa fa-caret-left" aria-hidden="true"></i>
</div>
<div class="container-modulos">
    <asp:ListView runat="server" ID="ListView_Modulos">
        <ItemTemplate>
            <div class="container-items">
                <div class="Btn-content">
                    <div>
                        <telerik:RadButton ID="RadButton_Modulos" runat="server" CssClass="btn-circle" ButtonType="LinkButton"
                            AutoPostBack="false" EnableEmbeddedSkins="false" ToolTip='<%#Eval("Modulos.NombreModulo") %>'
                            NavigateUrl='<%#Eval("Modulos.UrlModulo") %>' Target='<%#Eval("Modulos.Target") %>'>
                            <ContentTemplate>
                            </ContentTemplate>
                        </telerik:RadButton>
                    </div>
                    <telerik:RadToolTip TargetControlID="HyperLink_Images" Text='<%#Eval("Modulos.NombreModulo") %>' runat="server" Position="TopCenter" RenderMode="Lightweight" ShowEvent="OnMouseOver" EnableShadow="true">
                    </telerik:RadToolTip>
                    <div style="position: absolute; height: 100%">
                        <asp:HyperLink ID="HyperLink_Images" runat="server" NavigateUrl='<%#Eval("Modulos.UrlModulo") %>' Target='<%#Eval("Modulos.Target") %>'>
                                <img src="../../Images/Modulo/<%#Eval("Modulos.CodigoModulo") %>.png?<%#Guid.NewGuid() %>" class="Image" alt="<%#Eval("Modulos.NombreModulo") %>" /> <%--GARANTIZA EL REFRESH DE LA IMAGEN--%>
                        </asp:HyperLink>
                    </div>
                </div>
                <div class="Label">
                    <asp:Label Text='<%#Eval("Modulos.NombreModulo") %>' runat="server" Font-Bold="true" />
                </div>
            </div>
        </ItemTemplate>
    </asp:ListView>
</div>
<div id="btn-right">
    <i class="fa fa-caret-right" aria-hidden="true"></i>
</div>