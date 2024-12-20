<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="wuc_Modulos1.ascx.cs" Inherits="CasaToro.Portal.Comisiones.Views.Account.wuc_Modulos1" %>
<div class="container-modulos">
    <asp:ListView runat="server" ID="ListView_Modulos">
        <ItemTemplate>
            <div class="container-items">
                <div class="Btn-content">
                    <div style="position: static; z-index: 1">
                        <telerik:RadButton ID="RadButton_Modulos" runat="server" CssClass="btn-circle" ButtonType="LinkButton"
                            AutoPostBack="false" EnableEmbeddedSkins="false" ToolTip='<%#Eval("Modulos.NombreModulo") %>'
                            NavigateUrl='<%#Eval("Modulos.UrlModulo") %>' Target='<%#Eval("Modulos.Target") %>'>
                            <ContentTemplate>
                            </ContentTemplate>
                        </telerik:RadButton>
                    </div>
                    <div style="position: absolute; z-index: 2;">
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