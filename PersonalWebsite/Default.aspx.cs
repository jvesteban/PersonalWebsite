using System;
using System.Configuration;
using System.Data.SqlClient;

namespace PersonalWebsite
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Ibinalik ang Session Checking para sa Login/Logout controls
                if (Session["UserID"] != null)
                {
                    pnlGuestNav.Visible = false;
                    pnlUserNav.Visible = true;
                }
                else
                {
                    pnlGuestNav.Visible = true;
                    pnlUserNav.Visible = false;
                }
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtName.Text) ||
                string.IsNullOrWhiteSpace(txtEmail.Text) ||
                string.IsNullOrWhiteSpace(txtMessage.Text))
            {
                string scriptError = "Swal.fire({ title: 'Validation Error', text: 'Please fill in all required fields.', icon: 'warning', confirmButtonColor: '#38bdf8' });";
                ClientScript.RegisterStartupScript(this.GetType(), "alertError", scriptError, true);
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "INSERT INTO ContactMessages (SenderName, SenderEmail, MessageText, SentAt) VALUES (@Name, @Email, @Message, GETDATE())";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@Message", txtMessage.Text.Trim());

                    try
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();

                        txtName.Text = "";
                        txtEmail.Text = "";
                        txtMessage.Text = "";

                        string scriptSuccess = "Swal.fire({ title: 'Message Sent!', text: 'Thank you! Your message has been sent successfully.', icon: 'success', confirmButtonColor: '#38bdf8' });";
                        ClientScript.RegisterStartupScript(this.GetType(), "alertSuccess", scriptSuccess, true);
                    }
                    catch (Exception)
                    {
                        string scriptDbError = "Swal.fire({ title: 'Error', text: 'An error occurred while sending your message. Please try again.', icon: 'error', confirmButtonColor: '#38bdf8' });";
                        ClientScript.RegisterStartupScript(this.GetType(), "alertDbError", scriptDbError, true);
                    }
                }
            }
        }
    }
}