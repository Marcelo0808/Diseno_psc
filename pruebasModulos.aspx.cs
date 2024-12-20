using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CasaToro.Portal.Comisiones.BLL.BusinessLogic;
using CasaToro.Portal.Comisiones.ENL.Entities;
using Tecnobiometric.Web.Security;
using Microsoft.Ajax.Utilities;
using System.Diagnostics.Metrics;
using Telerik.Web.UI;

namespace CasaToro.Portal.Comisiones.Views.Account
{
    public partial class ModulosAutenticacion1 : System.Web.UI.Page
    {
        ModulosBL modulosBL;
        ErrorLog errorLog;
        protected void Page_Load(object sender, EventArgs e)
        {
            //SOLUCIONA EL PROBLEMA DEL LOGUEO INTERMITENTE :(
            Session["DummySession"] = "DummySession";
            MigracionAzure();
            GetModulos();
        }

        private void GetModulos()
        {
            try
            {
                modulosBL = new ModulosBL();
                var modulos = modulosBL.GetEmpleadosModulos(1070969343);
                var categorias = modulos.DistinctBy(c => new { c.Modulos.CodigoCategoria, c.Modulos.ModulosCategorias.Categoria }).OrderBy(c => c.Modulos.ModulosCategorias.Prioridad).ToList();
                foreach (var item in categorias)
                {
                    RadTab tab = new RadTab();
                    tab.ToolTip = item.Modulos.ModulosCategorias.Categoria;
                    tab.ImageUrl = "~/Images/Modulo/Categorias/" + item.Modulos.CodigoCategoria.ToString() + ".png";
                    this.RadTabStrip_Categorias.Tabs.Add(tab);
                    RadPageView pageView = new RadPageView();
                    UserControl uc = (UserControl)Page.LoadControl("wuc_Modulos.ascx");
                    ListView ListView_Modulos = (ListView)uc.FindControl("ListView_Modulos");
                    ListView_Modulos.DataSource = modulos.Where(db => db.Modulos.CodigoCategoria == item.Modulos.CodigoCategoria).OrderBy(db => db.Modulos.Prioridad).ThenBy(db => db.Modulos.CodigoModulo);
                    ListView_Modulos.DataBind();
                    pageView.Controls.Add(uc);
                    this.RadMultiPage_Categorias.PageViews.Add(pageView);
                }
            }
            catch (DALException ex)
            {
                GenerarNotificacion("ERROR:" + ex.Message, "DENY");
            }

            catch (BLLException ex)
            {
                GenerarNotificacion("ERROR: " + ex.Message, "DENY");
            }

            catch (Exception ex)
            {
                errorLog = new ErrorLog();
                errorLog.errorPresentado("Class: " + System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName + " - Method: " + System.Reflection.MethodBase.GetCurrentMethod().Name, ex.Message);
                GenerarNotificacion("ERROR: " + ex.Message, "DENY");
            }
        }

        private void MigracionAzure()
        {
            string url = Request.Url.ToString();
            if (
                DateTime.Now > new DateTime(2022, 4, 9, 12, 30, 0)
                &&
                DateTime.Now < new DateTime(2022, 4, 10, 18, 0, 0)
                )
            {
                this.Identificacion.Enabled = false;
                this.btnLogin.Enabled = false;

                this.RadNotification_Mensajes.Text = "EN ESTE MOMENTO EL PSC SE ENCUENTRA EN MANTENIMIENTO.<BR/>ESTAMOS TRABAJANDO PARA MEJORAR SU EXPERIENCIA DE USUARIO!";
                this.RadNotification_Mensajes.ContentIcon = "WARNING";
                this.RadNotification_Mensajes.Show();
            }
            else
            {
                this.Identificacion.Enabled = true;
                this.btnLogin.Enabled = true;
            }
        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            try
            {

                modulosBL = new ModulosBL();

                //var Activo = pscBL.GetUsuarios(Identificacion.Text);
                var Activo = modulosBL.GetEmpleadosByCodigo(Convert.ToInt64(Identificacion.Text));

                if (Activo != null)
                {
                    Session["CedulaMyApp"] = Identificacion.Text;
                    this.Response.Redirect("LoginPre1", false);
                }
                else
                {
                    Session["CedulaMyApp"] = 0;
                    this.RadNotification_Mensajes.Text = "EL USUARIO NO SE ENCUENTRA REGISTRADO, <BR/>INTENTE DE NUEVO.";
                    this.RadNotification_Mensajes.ContentIcon = "WARNING";
                    this.RadNotification_Mensajes.Show();
                }

            }
            catch (DALException ex)
            {
                GenerarNotificacion("ERROR: " + ex.Message, "DENY");
            }

            catch (BLLException ex)
            {
                GenerarNotificacion("ERROR: " + ex.Message, "DENY");
            }

            catch (Exception ex)
            {
                GenerarNotificacion("ERROR: " + new GLOBALException().GetException(ex, "UI"), "DENY");
            }
        }

        private void GenerarNotificacion(string notificationText, string notificationIcon)
        {
            this.RadNotification_Mensajes.Text = notificationText;
            this.RadNotification_Mensajes.ContentIcon = notificationIcon;
            this.RadNotification_Mensajes.Show();
        }
    }
}