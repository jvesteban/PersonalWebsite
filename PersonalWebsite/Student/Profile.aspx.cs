using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI.WebControls;

namespace PersonalWebsite.Student
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("~/Account/Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadStudentData();
            }
        }

        private int GetUserId()
        {
            return Convert.ToInt32(Session["UserID"]);
        }

        private string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        }

        private void LoadStudentData()
        {
            int userId = GetUserId();
            using (SqlConnection conn = new SqlConnection(GetConnectionString()))
            {
                try
                {
                    conn.Open();

                    // 1. Fetch User & Personal Info
                    string query = @"
                        SELECT u.FullName, u.Email, p.Title, p.Bio, p.YearLevelStatus, p.Phone, p.Address, p.ProfileImage
                        FROM Users u
                        LEFT JOIN PersonalInfo p ON u.UserID = p.UserID
                        WHERE u.UserID = @UserID";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@UserID", userId);
                        SqlDataReader reader = cmd.ExecuteReader();

                        if (reader.Read())
                        {
                            string fullName = reader["FullName"].ToString();
                            string email = reader["Email"].ToString();
                            string title = reader["Title"] != DBNull.Value && !string.IsNullOrEmpty(reader["Title"].ToString()) ? reader["Title"].ToString() : "Student Developer";
                            string bio = reader["Bio"] != DBNull.Value && !string.IsNullOrEmpty(reader["Bio"].ToString()) ? reader["Bio"].ToString() : "No bio added yet.";
                            string yearLevel = reader["YearLevelStatus"] != DBNull.Value && !string.IsNullOrEmpty(reader["YearLevelStatus"].ToString()) ? reader["YearLevelStatus"].ToString() : "N/A";
                            string phone = reader["Phone"] != DBNull.Value && !string.IsNullOrEmpty(reader["Phone"].ToString()) ? reader["Phone"].ToString() : "N/A";
                            string address = reader["Address"] != DBNull.Value && !string.IsNullOrEmpty(reader["Address"].ToString()) ? reader["Address"].ToString() : "N/A";

                            string rawImg = reader["ProfileImage"] != DBNull.Value ? reader["ProfileImage"].ToString() : "";
                            string imgUrl = !string.IsNullOrEmpty(rawImg) ? "../" + rawImg : "../Image/ninja.jpg";

                            lblFullName.Text = fullName;
                            lblEmail.Text = email;
                            lblTitle.Text = title;
                            lblHeroBio.Text = bio;
                            lblAboutBio.Text = bio;
                            lblYearLevel.Text = yearLevel;
                            lblPhone.Text = phone;
                            lblAddress.Text = address;
                            imgProfile.ImageUrl = imgUrl + "?t=" + DateTime.Now.Ticks;

                            txtEditFullName.Text = fullName;
                            txtEditEmail.Text = email; // Populates read-only email field
                            txtEditTitle.Text = title;
                            txtEditYearLevel.Text = yearLevel != "N/A" ? yearLevel : "";
                            txtEditPhone.Text = phone != "N/A" ? phone : "";
                            txtEditAddress.Text = address != "N/A" ? address : "";
                            txtEditBio.Text = bio;
                        }
                        reader.Close();
                    }

                    // 2. Fetch Grouped Education Categories
                    using (SqlDataAdapter daEdu = new SqlDataAdapter("SELECT EducationID, LevelCategory, SchoolName FROM Education WHERE UserID = @UserID ORDER BY EducationID DESC", conn))
                    {
                        daEdu.SelectCommand.Parameters.AddWithValue("@UserID", userId);
                        DataTable dtEdu = new DataTable();
                        daEdu.Fill(dtEdu);
                        rptEducationGroup.DataSource = dtEdu;
                        rptEducationGroup.DataBind();
                    }

                    // 3. Fetch Skills
                    using (SqlDataAdapter daSkills = new SqlDataAdapter("SELECT * FROM Skills WHERE UserID = @UserID", conn))
                    {
                        daSkills.SelectCommand.Parameters.AddWithValue("@UserID", userId);
                        DataTable dtSkills = new DataTable();
                        daSkills.Fill(dtSkills);
                        rptSkills.DataSource = dtSkills;
                        rptSkills.DataBind();
                    }

                    // 4. Fetch Hobbies
                    using (SqlDataAdapter daHobbies = new SqlDataAdapter("SELECT * FROM Hobbies WHERE UserID = @UserID", conn))
                    {
                        daHobbies.SelectCommand.Parameters.AddWithValue("@UserID", userId);
                        DataTable dtHobbies = new DataTable();
                        daHobbies.Fill(dtHobbies);
                        rptHobbies.DataSource = dtHobbies;
                        rptHobbies.DataBind();
                    }
                }
                catch (Exception ex)
                {
                    ShowAlert("Error loading profile: " + ex.Message);
                }
            }
        }

        protected void rptEducationGroup_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView drv = (DataRowView)e.Item.DataItem;
                int educationId = Convert.ToInt32(drv["EducationID"]);

                Repeater rptEduItems = (Repeater)e.Item.FindControl("rptEduItems");

                using (SqlConnection conn = new SqlConnection(GetConnectionString()))
                {
                    string query = "SELECT * FROM EducationItems WHERE EducationID = @EducationID ORDER BY YearStarted DESC";
                    using (SqlDataAdapter da = new SqlDataAdapter(query, conn))
                    {
                        da.SelectCommand.Parameters.AddWithValue("@EducationID", educationId);
                        DataTable dtItems = new DataTable();
                        da.Fill(dtItems);
                        rptEduItems.DataSource = dtItems;
                        rptEduItems.DataBind();
                    }
                }
            }
        }

        protected void btnSaveProfile_Click(object sender, EventArgs e)
        {
            try
            {
                int userId = GetUserId();
                if (userId <= 0)
                {
                    ShowAlert("Error: Session expired o walang UserID.");
                    return;
                }

                string photoPath = null;
                HttpPostedFile postedFile = null;

                if (fileUploadPhoto.HasFile)
                {
                    postedFile = fileUploadPhoto.PostedFile;
                }
                else if (Request.Files.Count > 0)
                {
                    for (int i = 0; i < Request.Files.Count; i++)
                    {
                        if (Request.Files[i].ContentLength > 0 && !string.IsNullOrEmpty(Request.Files[i].FileName))
                        {
                            postedFile = Request.Files[i];
                            break;
                        }
                    }
                }

                if (postedFile != null && postedFile.ContentLength > 0)
                {
                    string extension = Path.GetExtension(postedFile.FileName).ToLower();

                    if (extension == ".png" || extension == ".jpg" || extension == ".jpeg")
                    {
                        string uploadDir = Server.MapPath("~/Uploads/");
                        if (!Directory.Exists(uploadDir))
                        {
                            Directory.CreateDirectory(uploadDir);
                        }

                        string fileName = "profile_" + userId + "_" + DateTime.Now.Ticks + extension;
                        string fullPath = Path.Combine(uploadDir, fileName);

                        postedFile.SaveAs(fullPath);
                        photoPath = "Uploads/" + fileName;
                    }
                    else
                    {
                        ShowAlert("May Maling Format: Tanging .PNG, .JPG, at .JPEG lang ang pwedeng i-upload.");
                        return;
                    }
                }

                using (SqlConnection conn = new SqlConnection(GetConnectionString()))
                {
                    conn.Open();

                    // 1. Update FullName PULONG (INALIS ANG EMAIL SA UPDATE QUERY)
                    string updateUserQuery = "UPDATE Users SET FullName = @FullName WHERE UserID = @UserID";
                    using (SqlCommand cmdUser = new SqlCommand(updateUserQuery, conn))
                    {
                        cmdUser.Parameters.AddWithValue("@FullName", !string.IsNullOrEmpty(txtEditFullName.Text) ? txtEditFullName.Text.Trim() : "");
                        cmdUser.Parameters.AddWithValue("@UserID", userId);
                        cmdUser.ExecuteNonQuery();
                    }
                    Session["FullName"] = txtEditFullName.Text.Trim();

                    // 2. Upsert sa PersonalInfo Table
                    string updateQuery = @"
                        IF EXISTS (SELECT 1 FROM PersonalInfo WHERE UserID = @UserID)
                        BEGIN
                            UPDATE PersonalInfo 
                            SET Title = @Title, 
                                Bio = @Bio, 
                                YearLevelStatus = @YearLevelStatus, 
                                Phone = @Phone, 
                                Address = @Address,
                                ProfileImage = COALESCE(@ProfileImage, ProfileImage)
                            WHERE UserID = @UserID;
                        END
                        ELSE
                        BEGIN
                            INSERT INTO PersonalInfo (UserID, Title, Bio, YearLevelStatus, Phone, Address, ProfileImage)
                            VALUES (@UserID, @Title, @Bio, @YearLevelStatus, @Phone, @Address, @ProfileImage);
                        END";

                    using (SqlCommand cmd = new SqlCommand(updateQuery, conn))
                    {
                        cmd.Parameters.AddWithValue("@UserID", userId);
                        cmd.Parameters.AddWithValue("@Title", !string.IsNullOrEmpty(txtEditTitle.Text) ? txtEditTitle.Text.Trim() : "");
                        cmd.Parameters.AddWithValue("@Bio", !string.IsNullOrEmpty(txtEditBio.Text) ? txtEditBio.Text.Trim() : "");
                        cmd.Parameters.AddWithValue("@YearLevelStatus", !string.IsNullOrEmpty(txtEditYearLevel.Text) ? txtEditYearLevel.Text.Trim() : "");
                        cmd.Parameters.AddWithValue("@Phone", !string.IsNullOrEmpty(txtEditPhone.Text) ? txtEditPhone.Text.Trim() : "");
                        cmd.Parameters.AddWithValue("@Address", !string.IsNullOrEmpty(txtEditAddress.Text) ? txtEditAddress.Text.Trim() : "");
                        cmd.Parameters.AddWithValue("@ProfileImage", (object)photoPath ?? DBNull.Value);

                        cmd.ExecuteNonQuery();
                    }
                }

                ShowAlert("Profile details and Photo updated successfully!");
                LoadStudentData();
            }
            catch (Exception ex)
            {
                ShowAlert("DATABASE / SYSTEM ERROR: " + ex.Message);
            }
        }

        protected void btnAddEducation_Click(object sender, EventArgs e)
        {
            string level = ddlEduLevel.SelectedValue;
            string schoolName = txtSchoolName.Text.Trim();

            if (string.IsNullOrEmpty(schoolName))
            {
                ShowAlert("Please enter the School Name.");
                return;
            }

            string[] courses = Request.Form.GetValues("txtDegreeCourse[]");
            string[] majors = Request.Form.GetValues("txtMajor[]");
            string[] strands = Request.Form.GetValues("txtStrand[]");
            string[] yearLevels = Request.Form.GetValues("txtYearLevel[]");
            string[] sections = Request.Form.GetValues("txtSection[]");
            string[] yearsStarted = Request.Form.GetValues("txtYearStarted[]");
            string[] yearsEnded = Request.Form.GetValues("txtYearEnded[]");
            string[] descriptions = Request.Form.GetValues("txtEduDesc[]");

            if (yearsStarted == null || yearsStarted.Length == 0)
            {
                ShowAlert("Please add at least one timeline entry.");
                return;
            }

            using (SqlConnection conn = new SqlConnection(GetConnectionString()))
            {
                conn.Open();
                SqlTransaction trans = conn.BeginTransaction();

                try
                {
                    int educationId = 0;
                    string insertEduQuery = @"
                        INSERT INTO Education (UserID, LevelCategory, SchoolName) 
                        VALUES (@UserID, @LevelCategory, @SchoolName);
                        SELECT SCOPE_IDENTITY();";

                    using (SqlCommand cmd = new SqlCommand(insertEduQuery, conn, trans))
                    {
                        cmd.Parameters.AddWithValue("@UserID", GetUserId());
                        cmd.Parameters.AddWithValue("@LevelCategory", level);
                        cmd.Parameters.AddWithValue("@SchoolName", schoolName);
                        educationId = Convert.ToInt32(cmd.ExecuteScalar());
                    }

                    int totalEntries = yearsStarted.Length;

                    for (int i = 0; i < totalEntries; i++)
                    {
                        string course = courses != null && i < courses.Length ? courses[i].Trim() : "";
                        string major = majors != null && i < majors.Length ? majors[i].Trim() : "";
                        string strand = strands != null && i < strands.Length ? strands[i].Trim() : "";
                        string yearLvl = yearLevels != null && i < yearLevels.Length ? yearLevels[i].Trim() : "";
                        string sec = sections != null && i < sections.Length ? sections[i].Trim() : "";
                        string desc = descriptions != null && i < descriptions.Length ? descriptions[i].Trim() : "";

                        string finalDegreeCourse = course;
                        if (string.IsNullOrEmpty(finalDegreeCourse))
                        {
                            if (!string.IsNullOrEmpty(strand))
                            {
                                finalDegreeCourse = strand + " Strand";
                            }
                            else
                            {
                                finalDegreeCourse = level;
                            }
                        }

                        int.TryParse(yearsStarted[i], out int yrStarted);

                        object yrEndedObj = DBNull.Value;
                        if (yearsEnded != null && i < yearsEnded.Length && !string.IsNullOrEmpty(yearsEnded[i]) && int.TryParse(yearsEnded[i], out int yrEnded))
                        {
                            yrEndedObj = yrEnded;
                        }

                        string insertItemQuery = @"
                            INSERT INTO EducationItems (EducationID, DegreeCourse, Major, Strand, YearLevel, Section, YearStarted, YearEnded, Description)
                            VALUES (@EducationID, @DegreeCourse, @Major, @Strand, @YearLevel, @Section, @YearStarted, @YearEnded, @Description);";

                        using (SqlCommand cmdItem = new SqlCommand(insertItemQuery, conn, trans))
                        {
                            cmdItem.Parameters.AddWithValue("@EducationID", educationId);
                            cmdItem.Parameters.AddWithValue("@DegreeCourse", finalDegreeCourse);
                            cmdItem.Parameters.AddWithValue("@Major", string.IsNullOrEmpty(major) ? (object)DBNull.Value : major);
                            cmdItem.Parameters.AddWithValue("@Strand", string.IsNullOrEmpty(strand) ? (object)DBNull.Value : strand);
                            cmdItem.Parameters.AddWithValue("@YearLevel", string.IsNullOrEmpty(yearLvl) ? (object)DBNull.Value : yearLvl);
                            cmdItem.Parameters.AddWithValue("@Section", string.IsNullOrEmpty(sec) ? (object)DBNull.Value : sec);
                            cmdItem.Parameters.AddWithValue("@YearStarted", yrStarted);
                            cmdItem.Parameters.AddWithValue("@YearEnded", yrEndedObj);
                            cmdItem.Parameters.AddWithValue("@Description", string.IsNullOrEmpty(desc) ? (object)DBNull.Value : desc);

                            cmdItem.ExecuteNonQuery();
                        }
                    }

                    trans.Commit();
                    txtSchoolName.Text = "";
                    ShowAlert("Educational attainment added successfully!");
                    LoadStudentData();
                }
                catch (Exception ex)
                {
                    trans.Rollback();
                    ShowAlert("Error adding education entries: " + ex.Message);
                }
            }
        }

        protected void rptEducationGroup_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "DeleteGroup")
            {
                int eduId = Convert.ToInt32(e.CommandArgument);
                using (SqlConnection conn = new SqlConnection(GetConnectionString()))
                {
                    string query = "DELETE FROM Education WHERE EducationID = @EducationID AND UserID = @UserID";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@EducationID", eduId);
                        cmd.Parameters.AddWithValue("@UserID", GetUserId());
                        conn.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
                ShowAlert("Education entry deleted!");
                LoadStudentData();
            }
        }

        protected void btnAddSkill_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtNewSkill.Text.Trim())) return;

            using (SqlConnection conn = new SqlConnection(GetConnectionString()))
            {
                string query = "INSERT INTO Skills (UserID, SkillName, ProficiencyLevel, Category) VALUES (@UserID, @SkillName, 80, 'Technical')";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@UserID", GetUserId());
                    cmd.Parameters.AddWithValue("@SkillName", txtNewSkill.Text.Trim());

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            txtNewSkill.Text = "";
            ShowAlert("Skill added!");
            LoadStudentData();
        }

        protected void rptSkills_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "DeleteSkill")
            {
                int skillId = Convert.ToInt32(e.CommandArgument);
                using (SqlConnection conn = new SqlConnection(GetConnectionString()))
                {
                    string query = "DELETE FROM Skills WHERE SkillID = @SkillID AND UserID = @UserID";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@SkillID", skillId);
                        cmd.Parameters.AddWithValue("@UserID", GetUserId());
                        conn.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
                ShowAlert("Skill removed!");
                LoadStudentData();
            }
        }

        protected void btnAddHobby_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtNewHobby.Text.Trim())) return;

            using (SqlConnection conn = new SqlConnection(GetConnectionString()))
            {
                string query = "INSERT INTO Hobbies (UserID, HobbyName, IconClass) VALUES (@UserID, @HobbyName, @IconClass)";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@UserID", GetUserId());
                    cmd.Parameters.AddWithValue("@HobbyName", txtNewHobby.Text.Trim());
                    cmd.Parameters.AddWithValue("@IconClass", string.IsNullOrEmpty(txtHobbyIcon.Text.Trim()) ? "bi-star" : txtHobbyIcon.Text.Trim());

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            txtNewHobby.Text = "";
            txtHobbyIcon.Text = "";
            ShowAlert("Hobby added!");
            LoadStudentData();
        }

        protected void rptHobbies_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "DeleteHobby")
            {
                int hobbyId = Convert.ToInt32(e.CommandArgument);
                using (SqlConnection conn = new SqlConnection(GetConnectionString()))
                {
                    string query = "DELETE FROM Hobbies WHERE HobbyID = @HobbyID AND UserID = @UserID";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@HobbyID", hobbyId);
                        cmd.Parameters.AddWithValue("@UserID", GetUserId());
                        conn.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
                ShowAlert("Hobby removed!");
                LoadStudentData();
            }
        }

        private void ShowAlert(string msg)
        {
            pnlAlert.Visible = true;
            lblAlertMsg.Text = msg;
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.RemoveAll();
            Session.Abandon();

            if (Request.Cookies[".ASPXAUTH"] != null)
            {
                HttpCookie authCookie = new HttpCookie(".ASPXAUTH");
                authCookie.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(authCookie);
            }

            if (Request.Cookies["ASP.NET_SessionId"] != null)
            {
                HttpCookie sessionCookie = new HttpCookie("ASP.NET_SessionId");
                sessionCookie.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(sessionCookie);
            }

            Response.Redirect("~/Default.aspx", true);
        }
    }
}