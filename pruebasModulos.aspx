<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ModulosAutenticacion2.aspx.cs" Inherits="CasaToro.Portal.Comisiones.Views.Account.ModulosAutenticacion2" %>

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

            .login-box label {
                text-align: left;
                width: 100%;
                font-size: 14px;
                margin-bottom: 5px;
                font-weight: bold;
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

        footer {
            display: none;
        }

        .ExternosContent {
            position: fixed;
            display: flex;
            flex-direction: column;
            bottom: 2%;
            width: calc(100% - 35%);
            border-radius: 15px;
            align-items: center;
            justify-content: center;
            z-index: 1;
            isolation: isolate;
        }

        /*Estilo para el tabStrip*/
        .tabStrip {
            width: 100%;
            height: 10%;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 8px 8px 0 0;
        }

            .tabStrip .RadTabStrip {
                margin: 0 auto;
                display: flex;
                justify-content: space-between;
                background-color: #ffffff32;
                backdrop-filter: blur(10px);
                box-shadow: 0px 1px 10px 0px rgba(71, 71, 71, 0.8);
                border-radius: 10px 10px 0px 0px;
            }

                .tabStrip .RadTabStrip .rtsLevel1 {
                    display: flex;
                    width: 100%;
                    justify-content: space-between;
                }

                    .tabStrip .RadTabStrip .rtsLevel1 .rtsLI {
                        flex: 1;
                        text-align: center;
                        list-style: none;
                    }

                        .tabStrip .RadTabStrip .rtsLevel1 .rtsLI a {
                            display: block;
                            width: 100%;
                            padding: 0.5rem;
                            font-size: 14px;
                            text-decoration: none;
                            color: #333;
                            transition: all 0.2s ease-in-out;
                        }

                            .tabStrip .RadTabStrip .rtsLevel1 .rtsLI a:hover {
                                background-color: #67676732;
                                backdrop-filter: blur(10px);
                            }

                        .tabStrip .RadTabStrip .rtsLevel1 .rtsLI .rtsImg {
                            display: block;
                            margin: 0 auto;
                            width: 15px;
                            height: 15px;
                        }

                        .tabStrip .RadTabStrip .rtsLevel1 .rtsLI .rtsTxt {
                            display: none !important;
                        }

        /*Contenedor para los módulos*/
        .MultiPage {
            flex: 1;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            overflow: hidden;
            gap: 1rem;
            background-color: #ffffff32;
            backdrop-filter: blur(10px);
            box-shadow: 0px 1px 10px 0px rgba(71, 71, 71, 0.8);
            width: 95%;
            border-radius: 10px 10px 0px 0px;
        }

            .MultiPage .container-modulos {
                position: relative;
                background-size: cover;
                display: flex;
                flex-wrap: nowrap;
                justify-content: center;
                height: 100%;
                margin-right: auto;
                margin-left: auto;
                overflow-x: auto;
                scroll-behavior: smooth;
            }

        .container-items {
            position: relative;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            width: 100px;
            transition: transform 0.2s ease-in-out;
            z-index: 1;
        }

            .container-items:hover {
                transform: scale(1.2);
                z-index: 9999 !important;
            }

            .container-items a {
                display: flex;
                width: 100%;
                height: 100%;
                justify-content: center;
                align-items: center;
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
            width: 60vw;
            height: 60vw;
            max-width: 60px;
            max-height: 60px;
            border-style: none;
            border-radius: 10px;
            transition: 2s;
        }

        .Image {
            position: relative;
            width: 8vw;
            text-align: center;
            height: auto;
            max-width: 80px;
            max-height: 40px;
            border-radius: 0px;
            font-size: 7px;
            z-index: 1;
            transition: transform 0.2s ease-in-out;
        }

        *::-webkit-scrollbar {
            width: 0.1px;
            height: 5px;
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
        }

        .Label {
            position: absolute;
            left: 0px;
            margin-top: 7px;
            margin-bottom: 2px;
            font-size: 0.7rem;
            color: #148EA7;
            text-transform: uppercase;
            text-align: center;
            overflow-wrap: break-word;
            opacity: 0;
            transition: opacity 0.2s ease-in-out, transform 0.2s ease-in-out;
        }

        #btn-left {
            position: absolute;
            left: 0;
            top: 50%;
            transform: translateY(-50%);
            z-index: 10;
        }

        #btn-right {
            position: absolute;
            right: 0;
            top: 50%;
            transform: translateY(-50%);
            z-index: 10;
        }

        @media (max-width: 768px) {
            .body-content {
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
            }

            .login-container {
                background: none;
                width: 100%;
                bottom: 10%;
                height: 80vh;
            }

            .ExternosContent {
                width: 100% !important;
            }

            .login-box {
                width: 70%;
                background-color: white;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
            }
        }
    </style>
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
    <div class="ExternosContent">
        <div class="tabStrip">
            <telerik:RadTabStrip ID="RadTabStrip_Categorias" runat="server" SelectedIndex="0"
                Skin="Bootstrap" MultiPageID="RadMultiPage_Categorias">
            </telerik:RadTabStrip>
        </div>
        <div class="MultiPage">
            <telerik:RadMultiPage runat="server" ID="RadMultiPage_Categorias" SelectedIndex="0">
            </telerik:RadMultiPage>
        </div>
    </div>
    <script>
        document.addEventListener("DOMContentLoaded", () => {
            const contenedor = document.querySelector(".container-modulos")
            const btnLeft = document.getElementById("btn-left")
            const btnRight = document.getElementById("btn-right")
            const ancho = document.querySelector(".container-items").offsetWidth
            if (btnLeft) {
                console.log("Existe el elemento ")
                btnLeft.addEventListener("click", () => {
                    console.log("Se ha hecho un click izquierdo")
                    contenedor.scrollBy({ left: -ancho, behavior: "smooth" })
                })
            }

            if (btnRight) {
                btnRight.addEventListener("click", () => {
                    console.log("Se ha hecho un click izquierdo")
                    contenedor.scrollBy({ left: ancho, behavior: "smooth" })
                })
            }

            function actualizarVisibilidadBotones() {
                console.log("contenedor scrollleft ", contenedor.scrollLeft)
                btnLeft.style.display = contenedor.scrollLeft > 0 ? "block" : "none"
                console.log("contenedor clientWicth", contenedor.clientWidth)
                console.log("contenedor scrollWidth ", contenedor.scrollWidth)
                btnRight.style.display = contenedor.scrollLeft + contenedor.clientWidth < contenedor.scrollWidth ? "block" : "none"
            }

            actualizarVisibilidadBotones()

            contenedor.addEventListener("scroll", actualizarVisibilidadBotones);
        })
        btnExternos = document.querySelector(".IconoExternos");
        contenidoExternos = document.querySelector(".ExternosContent");
        if (btnExternos && contenidoExternos) {
            btnExternos.addEventListener("click", (event) => {
                event.stopPropagation()
                contenidoExternos.classList.toggle("show")
            })
            document.addEventListener("click", (event) => {
                if (contenidoExternos.classList.contains("show") && !contenidoExternos.contains(event.target) && !btnExternos.contains(event.target)) {
                    contenidoExternos.classList.remove("show");
                }
            })
        }

    </script>
</asp:Content>
