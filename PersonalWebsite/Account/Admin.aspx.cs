using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace PersonalWebsite.Account
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Security check: Siguraduhing Admin lang ang makakapasok
            if (Session["UserRole"] == null || Session["UserRole"].ToString() != "Admin")
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                if (Session["FullName"] != null)
                {
                    lblAdminName.Text = Session["FullName"].ToString();
                }

                LoadDashboardData();
                LoadVisitorMessages();
            }
        }

        private void LoadDashboardData()
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                try
                {
                    conn.Open();

                    // 1. Fetch Live Statistics
                    string statsQuery = @"
                        SELECT 
                            COUNT(*) AS TotalStudents,
                            SUM(CASE WHEN IsActive = 1 THEN 1 ELSE 0 END) AS ActiveUsers,
                            SUM(CASE WHEN IsActive = 0 THEN 1 ELSE 0 END) AS InactiveUsers
                        FROM Users WHERE Role = 'User';

                        SELECT COUNT(*) AS ProfilesCount FROM PersonalInfo;";

                    using (SqlCommand cmd = new SqlCommand(statsQuery, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                lblTotalStudents.Text = reader["TotalStudents"].ToString();
                                lblActiveUsers.Text = reader["ActiveUsers"].ToString();
                                lblInactiveUsers.Text = reader["InactiveUsers"].ToString();
                            }

                            if (reader.NextResult() && reader.Read())
                            {
                                lblProfilesCount.Text = reader["ProfilesCount"].ToString();
                            }
                        }
                    }

                    // 2. Load User List into GridView
                    string usersQuery = "SELECT UserID, FullName, Email, IsActive FROM Users WHERE Role = 'User' ORDER BY CreatedAt DESC";
                    using (SqlDataAdapter da = new SqlDataAdapter(usersQuery, conn))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        gvUsers.DataSource = dt;
                        gvUsers.DataBind();
                    }
                }
                catch (Exception)
                {
                    // Handle DB Errors
                }
            }
        }

        private void LoadVisitorMessages()
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT MessageID, SenderName, SenderEmail, MessageText, SentAt FROM ContactMessages ORDER BY SentAt DESC";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    try
                    {
                        conn.Open();
                        SqlDataReader reader = cmd.ExecuteReader();
                        gvMessages.DataSource = reader;
                        gvMessages.DataBind();
                    }
                    catch (Exception)
                    {
                        // Handle DB Errors
                    }
                }
            }
        }

        protected void gvUsers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ToggleStatus")
            {
                string[] args = e.CommandArgument.ToString().Split('|');
                int userId = Convert.ToInt32(args[0]);
                bool currentStatus = Convert.ToBoolean(args[1]);
                bool newStatus = !currentStatus;

                string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string updateQuery = "UPDATE Users SET IsActive = @NewStatus WHERE UserID = @UserID";
                    using (SqlCommand cmd = new SqlCommand(updateQuery, conn))
                    {
                        cmd.Parameters.AddWithValue("@NewStatus", newStatus ? 1 : 0);
                        cmd.Parameters.AddWithValue("@UserID", userId);

                        conn.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                // Refresh dashboard counters & table view
                LoadDashboardData();
            }
        }

        protected void gvMessages_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteMessage")
            {
                int messageId = Convert.ToInt32(e.CommandArgument);
                string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = "DELETE FROM ContactMessages WHERE MessageID = @MessageID";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@MessageID", messageId);

                        try
                        {
                            conn.Open();
                            cmd.ExecuteNonQuery();
                            LoadVisitorMessages(); // Refresh message list after delete
                        }
                        catch (Exception)
                        {
                            // Handle DB Errors
                        }
                    }
                }
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("../Default.aspx");
        }
    }
}