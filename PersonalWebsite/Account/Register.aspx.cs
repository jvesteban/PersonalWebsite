using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;

namespace PersonalWebsite.Account
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                pnlAlert.Visible = false;
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string firstName = txtFirstName.Text.Trim();
            string middleName = txtMiddleName.Text.Trim();
            string lastName = txtLastName.Text.Trim();

            string fullName = string.IsNullOrEmpty(middleName)
                ? $"{firstName} {lastName}"
                : $"{firstName} {middleName} {lastName}";

            string title = txtTitle.Text.Trim();
            string yearLevel = txtYearLevel.Text.Trim();
            string email = txtEmail.Text.Trim();
            string phone = txtPhone.Text.Trim();
            string address = txtAddress.Text.Trim();
            string password = txtPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();

            if (password != confirmPassword)
            {
                ShowError("Passwords do not match. Please re-enter.");
                return;
            }

            var connSetting = ConfigurationManager.ConnectionStrings["MyDbConn"];
            if (connSetting == null)
            {
                ShowError("Database connection string is missing in Web.config.");
                return;
            }

            string connStr = connSetting.ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                try
                {
                    conn.Open();

                    // 1. Check for Duplicate Email
                    string checkEmailQuery = "SELECT COUNT(*) FROM Users WHERE Email = @Email";
                    using (SqlCommand checkCmd = new SqlCommand(checkEmailQuery, conn))
                    {
                        checkCmd.Parameters.AddWithValue("@Email", email);
                        int count = Convert.ToInt32(checkCmd.ExecuteScalar());

                        if (count > 0)
                        {
                            ShowError("Email address is already registered. Please sign in instead.");
                            return;
                        }
                    }

                    // 2. Insert User Record
                    string insertUserQuery = @"
                        INSERT INTO Users (FullName, Email, Password, Role, IsActive)
                        VALUES (@FullName, @Email, @Password, 'User', 1);
                        SELECT SCOPE_IDENTITY();";

                    int newUserId = 0;
                    using (SqlCommand insertCmd = new SqlCommand(insertUserQuery, conn))
                    {
                        insertCmd.Parameters.AddWithValue("@FullName", fullName);
                        insertCmd.Parameters.AddWithValue("@Email", email);
                        insertCmd.Parameters.AddWithValue("@Password", password);

                        newUserId = Convert.ToInt32(insertCmd.ExecuteScalar());
                    }

                    // 3. Insert Detailed Personal Info
                    string insertProfileQuery = @"
                        INSERT INTO PersonalInfo (UserID, Title, YearLevelStatus, Phone, Address)
                        VALUES (@UserID, @Title, @YearLevelStatus, @Phone, @Address)";

                    using (SqlCommand profileCmd = new SqlCommand(insertProfileQuery, conn))
                    {
                        profileCmd.Parameters.AddWithValue("@UserID", newUserId);
                        profileCmd.Parameters.AddWithValue("@Title", string.IsNullOrEmpty(title) ? "Student Developer" : title);
                        profileCmd.Parameters.AddWithValue("@YearLevelStatus", string.IsNullOrEmpty(yearLevel) ? (object)DBNull.Value : yearLevel);
                        profileCmd.Parameters.AddWithValue("@Phone", string.IsNullOrEmpty(phone) ? (object)DBNull.Value : phone);
                        profileCmd.Parameters.AddWithValue("@Address", string.IsNullOrEmpty(address) ? (object)DBNull.Value : address);

                        profileCmd.ExecuteNonQuery();
                    }

                    // 4. Send Welcome Email Notification
                    SendWelcomeEmail(email, fullName);

                    Response.Redirect("Login.aspx?registered=true");
                }
                catch (Exception ex)
                {
                    ShowError("Registration Error: " + ex.Message);
                }
            }
        }

        private void SendWelcomeEmail(string recipientEmail, string recipientName)
        {
            try
            {
                string senderEmail = ConfigurationManager.AppSettings["SenderEmail"];
                string senderPassword = ConfigurationManager.AppSettings["SenderAppPassword"];

                if (string.IsNullOrEmpty(senderEmail) || string.IsNullOrEmpty(senderPassword))
                {
                    return;
                }

                MailMessage mail = new MailMessage();
                mail.From = new MailAddress(senderEmail, "Dev Portfolio System");
                mail.To.Add(recipientEmail);
                mail.Subject = "Welcome to Dev Portfolio Platform!";

                mail.Body = $@"
                    <h2>Hello {recipientName},</h2>
                    <p>Thank you for registering your student account at <strong>Dev Portfolio</strong>!</p>
                    <p>Your account is now active. You can sign in anytime to customize and display your personal bio, educational background, skills, and hobbies.</p>
                    <br/>
                    <p>Best regards,<br/><strong>Dev Portfolio Team</strong></p>";

                mail.IsBodyHtml = true;

                SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                smtp.Credentials = new NetworkCredential(senderEmail, senderPassword);
                smtp.EnableSsl = true;

                smtp.Send(mail);
            }
            catch
            {
                // Silent fail so email issues won't break registration
            }
        }

        private void ShowError(string message)
        {
            pnlAlert.Visible = true;
            lblErrorMessage.Text = message;
        }
    }
}