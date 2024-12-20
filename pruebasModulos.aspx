<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ModulosAutenticacion1.aspx.cs" Inherits="CasaToro.Portal.Comisiones.Views.Account.ModulosAutenticacion1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            background-image: url("../../Images/imagen_fondo.jpg");
            background-size: cover;
            background-repeat: no-repeat;
        }

        .login-container {
            position: absolute;
            top: 0;
            bottom: 0;
            right: 0;
            width: 35%;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            background: rgba(255, 255, 255, 0.45);
        }

        .login-box {
            width: 100%;
            padding: 30px;
            text-align: center;
            background: rgba(0, 0, 255, 0);
        }

            .login-box img {
                width: 80%;
                margin-bottom: 30px;
            }

            .login-box h3 {
                margin-bottom: 20px;
                font-size: 20px;
            }

            .login-box p {
                margin-bottom: 25px;
                font-size: 14px;
                color: #6c757d;
            }

            .login-box .form-group {
                margin-bottom: 15px;
            }

            .login-box .fa {
                position: absolute;
                left: 5px;
                top: 75%;
                transform: translateY(-50%);
            }

        .max-inputLogin {
            border-radius: 10px;
            padding: 2px 15px 2px 30px !important;
            font-size: 15px !important;
        }

        .login-group {
            position: relative;
            display: inline-block;
            width: 70%;
            margin-bottom: 30px;
        }

        .login-box label {
            text-align: left;
            width: 100%;
            font-size: 14px;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .riTextBox {
            max-width: 100% !important;
        }

        .btn_login {
            border-radius: 5px;
            max-width: 60%;
            cursor: pointer;
            padding: 10px 0 !important;
            background-color: #55C1FF !important;
            border-color: #0076FD !important;
            color: white !important;
            font-size: 15px !important;
            background-image: none !important;
            box-shadow: 0px 4px 4px 0px rgb(0, 0, 0, 0.35);
        }

        .back-image {
            display: none;
        }

        @media (max-width: 768px) {
            .login-container {
                width: 100%;
                bottom: 10%;
            }

            .login-box {
                width: 70%;
                background-color: white;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
            }

            .back-image {
                display: block;
                transform: rotate(30deg);
            }
        }

        footer {
            display: none;
        }

        .IconoExternos {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 0;
            top: 10px;
            position: fixed;
            width: 40px;
            height: 40px;
            bottom: 20px;
            right: auto;
            left: 20px;
            background-color: #dfdfdf;
            color: #939393;
            border-radius: 50px;
            text-align: center;
            font-size: 20px;
            z-index: 9999;
            cursor: pointer;
        }

        /* Works on Firefox */
       /* * {
            scrollbar-color: #D9D9D9 #ffff;
            scrollbar-width: thin;
        }*/

            /* Works on Chrome, Edge, and Safari */
            *::-webkit-scrollbar {
                width: 7px;
            }

            *::-webkit-scrollbar-track {
                background: #F2F5FC;
                border-radius: 15px;
            }

            *::-webkit-scrollbar-button:increment, *::-webkit-scrollbar-button {
                display: none;
            }

            *::-webkit-scrollbar-thumb {
                background-color: #D9D9D9;
                border-radius: 15px;
                /*border: 3px solid orange;*/
            }

        .ExternosContent {
            position: absolute;
            display: flex;
            flex-direction: column;
            margin: 5px;
            top: 50px;
            left: 20px;
            width: 30%;
            height: 60%;
            background-color: #F2F5FC;
            border: 1px solid #B5B5B5;
            border-radius: 15px;
        }

            .ExternosContent .rtsImg {
                width: 15px !important;
            }

            .ExternosContent .RadTabStrip_Bootstrap .rtsLink {
                display: flex;
                justify-content: center;
                align-items: center;
                padding: 0px !important;
            }

            .ExternosContent .RadTabStrip .rtsLevel {
                display: flex;
                justify-content: center;
            }

            .ExternosContent .RadTabStripTop_Bootstrap .rtsLevel1 .rtsUL {
                border: 1px solid #dedede;
                border-radius: 15px;
            }

            .ExternosContent .RadTabStripTop_Bootstrap .rtsLevel1 .rtsFirst .rtsLink {
                border-radius: 15px 0 0 15px;
            }

            .ExternosContent .RadTabStripTop_Bootstrap .rtsLevel1 .rtsLink {
                border-radius: 0;
            }

            .ExternosContent .RadTabStripTop_Bootstrap .rtsLevel1 .rtsLast .rtsLink {
                border-radius: 0 15px 15px 0;
            }

        .Btn-content {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .container-modulos {
            background-size: cover;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-content: center;
            width: 100%;
            height: 100%;
            margin-right: auto;
            margin-left: auto;
            padding: 20px 12px;
        }

        .container-items {
            position: relative;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            width: 100px;
        }

        .Btn-content {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

            .Btn-content:hover {
                animation: animate 2s linear infinite;
            }

        .btn-circle {
            display: flex;
            justify-content: end;
            align-items: baseline;
            width: 80px;
            height: 40px;
            border-style: none;
            border-radius: 10px;
            transition: 1s;
            transform-style: preserve-3d;
        }

        .Image {
            width: 80px;
            height: 40px;
            border-radius: 0px;
            font-size: 7px;
        }

        .Label {
            margin-top: 7px;
            margin-bottom: 2px;
            font-size: 7px;
            color: #148EA7;
            text-transform: uppercase;
            text-align: center;
            overflow-wrap: break-word;
        }

        .tabStrip {
            height: 20%;
            display: flex;
            justify-content: center;
            align-items: center;
        }
    </style>
    <div class="IconoExternos">
        <i class="fa fa-th" aria-hidden="true"></i>
    </div>
    <div class="ExternosContent">
        <div class="tabStrip">
            <telerik:RadTabStrip ID="RadTabStrip_Categorias" runat="server"
                Skin="Bootstrap" MultiPageID="RadMultiPage_Categorias">
            </telerik:RadTabStrip>
        </div>
        <div style="overflow-y: auto;">
            <telerik:RadMultiPage runat="server" ID="RadMultiPage_Categorias" SelectedIndex="0">
            </telerik:RadMultiPage>
        </div>
    </div>
    <img src="../../Images/imagen_fondo.jpg" alt="imagen fondo" class="back-image" />
    <div class="login-container">
        <div class="login-box">
            <img src="../../Images/Logo_USC_login_sf.png" alt="Logo">

            <h3>BIENVENIDO AL PSC</h3>

            <div class="login-group">
                <asp:Label runat="server" for="Identificacion">Ingrese su Usuario:</asp:Label>
                <telerik:RadNumericTextBox
                    ID="Identificacion"
                    Width="100%"
                    Skin="Silk"
                    NumberFormat-DecimalDigits="0"
                    NumberFormat-GroupSeparator=""
                    runat="server" CssClass="max-inputLogin" />
                <i class="fa fa-user fa-lg fa-fw" aria-hidden="true"></i>
            </div>

            <telerik:RadButton
                ID="btnLogin"
                Text="Iniciar Sesión"
                Skin="Silk"
                CssClass="btn_login"
                Width="60%"
                AutoPostBack="true"
                ValidationGroup="login"
                OnClick="BtnLogin_Click"
                runat="server">
            </telerik:RadButton>
            <div class="container-validacion">
                <asp:RequiredFieldValidator ID="valObligatorio" CssClass="validation_login" Display="Dynamic" ControlToValidate="Identificacion"
                    ErrorMessage="Error: Campo Requerido" ValidationGroup="login" runat="server"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="valExpresion" CssClass="validation_login" Display="Dynamic" ControlToValidate="Identificacion"
                    ErrorMessage="Error: Cant. caracteres permitida (Min.5 Max.15)" ValidationGroup="login"
                    ValidationExpression="^[0-9]{5,15}$" runat="server"></asp:RegularExpressionValidator>
            </div>
            <telerik:RadNotification ID="RadNotification_Mensajes" Animation="FlyIn" CloseButtonToolTip="Cerrar" EnableRoundedCorners="True"
                EnableShadow="True" Position="Center" Skin="Silk" Title="Mensaje del Sistema"
                Width="30%" AutoCloseDelay="5000" TitleIcon="none" runat="server">
            </telerik:RadNotification>
        </div>
    </div>
</asp:Content>
