using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Service
{
    public class EmailService
    {
        private readonly MailSettings _mailSettings;

        public EmailService(IOptions<MailSettings> mailSettings)
        {
            _mailSettings = mailSettings.Value;
        }
        public async Task SendEmailAsync(string toEmail, string subject, string messageBody)
        {
            var mailMessage = new MailMessage
            {
                From = new MailAddress(_mailSettings.SmtpUser, "AdminQuitQ"),
                Subject = subject,
                Body = messageBody,
                IsBodyHtml = true
            };
            mailMessage.To.Add(toEmail);

            using var smtpClient = new SmtpClient(_mailSettings.SmtpServer, _mailSettings.SmtpPort)
            {
                Credentials = new NetworkCredential(_mailSettings.SmtpUser, _mailSettings.SmtpPass),
                EnableSsl = true
            };

            await smtpClient.SendMailAsync(mailMessage);
        }
    }
    public class MailSettings
    {
        public string SmtpServer { get; set; }
        public int SmtpPort { get; set; }
        public string SmtpUser { get; set; }
        public string SmtpPass { get; set; }
    }
}
