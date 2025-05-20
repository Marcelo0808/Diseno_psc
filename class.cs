using System;
using System.Net;
using System.Net.Mail;
using System.Threading;
 
public class EmailSender
{
    private const int MaxRetryAttempts = 3; // Número máximo de reintentos
    private const int RetryDelayMilliseconds = 2000; // Retardo entre intentos (en milisegundos)
 
    public void EnviarCorreo(string destino, string asunto, string cuerpo, int intentoActual = 1)
    {
        try
        {
            // Configuración del correo
            var mensaje = new MailMessage("tu_correo@dominio.com", destino, asunto, cuerpo);
            var clienteSmtp = new SmtpClient("smtp.dominio.com")
            {
                Credentials = new NetworkCredential("tu_correo@dominio.com", "tu_contraseña"),
                EnableSsl = true,
                Port = 587
            };
 
            // Enviar el correo
            clienteSmtp.Send(mensaje);
            Console.WriteLine("Correo enviado con éxito.");
        }
        catch (SmtpException ex)
        {
            Console.WriteLine($"Error al enviar correo: {ex.Message}");
 
            // Si el número de intentos ha sido alcanzado, no intentamos más
            if (intentoActual >= MaxRetryAttempts)
            {
                Console.WriteLine("Se ha alcanzado el número máximo de intentos. No se puede enviar el correo.");
                return;
            }
 
            // Esperar un tiempo antes de reintentar
            Console.WriteLine($"Reintentando en {RetryDelayMilliseconds / 1000} segundos...");
            Thread.Sleep(RetryDelayMilliseconds);
 
            // Reintentar llamando a la misma función, aumentando el número de intentos
            EnviarCorreo(destino, asunto, cuerpo, intentoActual + 1);
        }
        catch (Exception ex)
        {
            // Para otros errores generales, si no son SmtpException
            Console.WriteLine($"Se produjo un error inesperado: {ex.Message}");
        }
    }
}
 
public class Program
{
    public static void Main(string[] args)
    {
        var emailSender = new EmailSender();
        emailSender.EnviarCorreo("destinatar