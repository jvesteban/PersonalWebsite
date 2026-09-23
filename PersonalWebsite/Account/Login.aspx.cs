using System;
using System.Configuration;
using System.Data.SqlClient;

namespace PersonalWebsite.Account
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["registered"] == "true")
                {
                    pnlAlert.CssClass = "alert alert-success py-2 small";
                    ShowError("Account created successfully! You can now sign in.");
                }

                if (Session["UserID"] != null && Session["UserRole"] != null)
                {
                    RedirectUserByRole(Session["UserRole"].ToString());
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            var connSetting = ConfigurationManager.ConnectionStrings["MyDbConn"];

            if (connSetting == null)
            {
                ShowError("Connection string 'MyDbConn' is missing in Web.config.");
                return;
            }

            string connStr = connSetting.ConnectionString;
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT UserID, FullName, Role, IsActive FROM Users WHERE LOWER(LTRIM(RTRIM(Email))) = LOWER(@Email) AND Password = @Password";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Password", password);

                    try
                    {
                        conn.Open();
                        SqlDataReader reader = cmd.ExecuteReader();

                        if (reader.Read())
                        {
                            bool isActive = Convert.ToBoolean(reader["IsActive"]);

                            if (!isActive)
                            {
                                pnlAlert.CssClass = "alert alert-danger py-2 small";
                                ShowError("Your account is currently deactivated. Please contact the administrator.");
                                return;
                            }

                            Session["UserID"] = reader["UserID"].ToString();
                            Session["FullName"] = reader["FullName"].ToString();
                            Session["UserRole"] = reader["Role"].ToString();

                            RedirectUserByRole(reader["Role"].ToString());
                        }
                        else
                        {
                            pnlAlert.CssClass = "alert alert-danger py-2 small";
                            ShowError("Invalid Email or Password. Please try again.");
                        }
                    }
                    catch (Exception ex)
                    {
                        pnlAlert.CssClass = "alert alert-danger py-2 small";
                        ShowError("Database Error: " + ex.Message);
                    }
                }
            }
        }

        private void RedirectUserByRole(string role)
        {
            if (role == "Admin")
            {
                Response.Redirect("Admin.aspx");
            }
            else
            {
                // Ibinalik papunta sa Profile Manager Page
                Response.Redirect("../Student/Profile.aspx");
            }
        }

        private void ShowError(string message)
        {
            pnlAlert.Visible = true;
            lblErrorMessage.Text = message;
        }
    }
}