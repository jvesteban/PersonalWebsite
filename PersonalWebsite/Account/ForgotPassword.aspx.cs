using System;
using System.Configuration;
using System.Data.SqlClient;

namespace PersonalWebsite.Account
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnResetPassword_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string newPassword = txtNewPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();

            // Validation: Siguraduhing nagtutugma ang mga password
            if (newPassword != confirmPassword)
            {
                ShowAlert("Passwords do not match.", false);
                return;
            }

            var connSetting = ConfigurationManager.ConnectionStrings["MyDbConn"];
            if (connSetting == null)
            {
                ShowAlert("Connection string 'MyDbConn' is missing in Web.config.", false);
                return;
            }

            string connStr = connSetting.ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                // SQL query para i-check muna kung umiiral ang Email at papalitan ang Password
                string checkQuery = "SELECT COUNT(*) FROM Users WHERE Email = @Email";
                string updateQuery = "UPDATE Users SET Password = @Password WHERE Email = @Email";

                try
                {
                    conn.Open();

                    // Step 1: Check kung may kaparehong email sa database
                    using (SqlCommand checkCmd = new SqlCommand(checkQuery, conn))
                    {
                        checkCmd.Parameters.AddWithValue("@Email", email);
                        int count = Convert.ToInt32(checkCmd.ExecuteScalar());

                        if (count == 0)
                        {
                            ShowAlert("No account found with this email address.", false);
                            return;
                        }
                    }

                    // Step 2: I-update ang password ng user
                    using (SqlCommand updateCmd = new SqlCommand(updateQuery, conn))
                    {
                        updateCmd.Parameters.AddWithValue("@Email", email);
                        updateCmd.Parameters.AddWithValue("@Password", newPassword);

                        int rowsAffected = updateCmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            // Kapag matagumpay, i-redirect pabalik sa Login Page na may success message
                            Response.Redirect("Login.aspx?registered=true");
                        }
                        else
                        {
                            ShowAlert("Failed to update password. Please try again.", false);
                        }
                    }
                }
                catch (Exception ex)
                {
                    ShowAlert("Database Error: " + ex.Message, false);
                }
            }
        }

        private void ShowAlert(string message, bool isSuccess)
        {
            pnlAlert.Visible = true;
            pnlAlert.CssClass = isSuccess ? "alert alert-success py-2 small" : "alert alert-danger py-2 small";
            lblAlertMessage.Text = message;
        }
    }
}