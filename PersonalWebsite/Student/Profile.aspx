<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="PersonalWebsite.Student.Profile" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Student Portfolio - Management Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    
    <!-- Bootstrap 5 CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Bootstrap Icons CDN -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" />
    <!-- AOS Scroll Animation CSS CDN -->
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet" />
    <!-- Custom CSS -->
    <link href="../CSS/site.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data" novalidate="novalidate">
        
        <!-- Navigation Bar -->
        <nav class="navbar navbar-expand-lg fixed-top custom-navbar">
            <div class="container">
                <a class="navbar-brand fw-bold brand-logo" href="#home">
                    <span class="logo-accent">&lt;</span>DEV PORTFOLIO<span class="logo-accent"> /&gt;</span>
                </a>
                <button class="navbar-toggler navbar-dark border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                
                <div class="collapse navbar-collapse justify-content-between" id="navbarNav">
                    <ul class="navbar-nav ms-auto align-items-center">
                        <li class="nav-item"><a class="nav-link nav-btn" href="#home">Home</a></li>
                        <li class="nav-item"><a class="nav-link nav-btn" href="#about">About</a></li>
                        <li class="nav-item"><a class="nav-link nav-btn" href="#education">Education</a></li>
                        <li class="nav-item"><a class="nav-link nav-btn" href="#skills">Skills & Hobbies</a></li>
                    </ul>

                    <div class="d-flex align-items-center gap-2 mt-2 mt-lg-0 ms-lg-4">
                        <a href="../Default.aspx" class="btn btn-outline-custom btn-sm">
                            <i class="bi bi-house me-1"></i> Public Home Page
                        </a>
                        
                        <asp:LinkButton ID="btnLogout" runat="server" OnClick="btnLogout_Click" CssClass="btn btn-outline-danger btn-sm" CausesValidation="false">
                            <i class="bi bi-box-arrow-right me-1"></i> Logout
                        </asp:LinkButton>
                    </div>
                </div>
            </div>
        </nav>

        <!-- Notification Alert Container -->
        <div class="container" style="margin-top: 20px;">
            <asp:Panel ID="pnlAlert" runat="server" Visible="false" CssClass="alert alert-info alert-dismissible fade show" role="alert">
                <asp:Label ID="lblAlertMsg" runat="server"></asp:Label>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </asp:Panel>
        </div>

        <!-- Home / Hero Section -->
        <section id="home" class="hero-section">
            <div class="container" data-aos="fade-up">
                <div class="row align-items-center">
                    
                    <div class="col-lg-7 col-md-6 order-2 order-md-1">
                        <h1 class="hero-title">Hello, I'm <asp:Label ID="lblFullName" runat="server" Text="Student Name"></asp:Label></h1>
                        
                        <p class="hero-subtitle">
                            I am a <span class="typing-container"><asp:Label ID="lblTitle" runat="server" Text="Student Developer"></asp:Label></span>
                        </p>
                        
                        <p class="lead text-secondary mt-3">
                            <asp:Label ID="lblHeroBio" runat="server" Text="No bio added yet. Click 'Edit Profile & Photo' below to customize your portfolio."></asp:Label>
                        </p>
                          
                        <!-- Student Action Buttons -->
                        <div class="mt-4 d-flex flex-wrap gap-2">
                            <button type="button" class="btn btn-primary-custom" data-bs-toggle="modal" data-bs-target="#editProfileModal">
                                <i class="bi bi-pencil-square me-1"></i> Edit Profile & Photo
                            </button>
                            <button type="button" class="btn btn-outline-custom" data-bs-toggle="modal" data-bs-target="#addEduModal">
                                <i class="bi bi-mortarboard me-1"></i> Add Education
                            </button>
                            <button type="button" class="btn btn-outline-custom" data-bs-toggle="modal" data-bs-target="#addSkillModal">
                                <i class="bi bi-tools me-1"></i> Add Skill / Hobby
                            </button>
                        </div>
                    </div>

                    <div class="col-lg-5 col-md-6 text-center order-1 order-md-2 mb-4 mb-md-0">
                        <div class="hero-img-wrapper ms-auto me-auto">
                            <asp:Image ID="imgProfile" runat="server" ImageUrl="../Image/ninja.jpg" CssClass="img-fluid hero-profile-img" AlternateText="Profile Picture" />
                        </div>
                    </div>

                </div>
            </div>
        </section>

        <!-- About Section -->
        <section id="about">
            <div class="container">
                <h2 class="section-title" data-aos="fade-right">About Me</h2>
                <div class="row g-4">
                    <div class="col-md-7" data-aos="fade-up" data-aos-delay="100">
                        <div class="custom-card">
                            <h3>Who I Am</h3>
                            <p class="mt-3">
                                <asp:Label ID="lblAboutBio" runat="server" Text="No bio added yet. Use the Edit Profile modal to add your bio description."></asp:Label>
                            </p>
                        </div>
                    </div>
                    <div class="col-md-5" data-aos="fade-up" data-aos-delay="200">
                        <div class="custom-card">
                            <div class="d-flex justify-content-between align-items-center">
                                <h3>Quick Info</h3>
                            </div>
                            <ul class="list-unstyled mt-3 mb-0">
                                <li class="mb-2"><strong>Status / Year:</strong> <asp:Label ID="lblYearLevel" runat="server" Text="N/A"></asp:Label></li>
                                <li class="mb-2"><strong>Email:</strong> <asp:Label ID="lblEmail" runat="server" Text="N/A"></asp:Label></li>
                                <li class="mb-2"><strong>Phone:</strong> <asp:Label ID="lblPhone" runat="server" Text="N/A"></asp:Label></li>
                                <li class="mb-2"><strong>Location:</strong> <asp:Label ID="lblAddress" runat="server" Text="N/A"></asp:Label></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Education Section -->
        <section id="education">
            <div class="container">
                <h2 class="section-title" data-aos="fade-right">Educational Attainment</h2>
                <div class="row g-4">
                    <asp:Repeater ID="rptEducationGroup" runat="server" OnItemDataBound="rptEducationGroup_ItemDataBound" OnItemCommand="rptEducationGroup_ItemCommand">
                        <ItemTemplate>
                            <div class="col-md-6" data-aos="fade-up">
                                <div class="custom-card position-relative">
                                    <div class="d-flex justify-content-between align-items-center mb-2">
                                        <span class="badge bg-info text-dark"><%# Eval("LevelCategory") %></span>
                                        <asp:LinkButton ID="btnDeleteEduGroup" runat="server" CommandName="DeleteGroup" CommandArgument='<%# Eval("EducationID") %>' CssClass="btn btn-sm btn-outline-danger py-0 px-2" OnClientClick="return confirm('Are you sure you want to delete this education block?');" CausesValidation="false">
                                            <i class="bi bi-trash"></i>
                                        </asp:LinkButton>
                                    </div>
                                    <h4 class="text-light fw-bold mb-3"><%# Eval("SchoolName") %></h4>
                                    
                                    <ul class="timeline-list">
                                     <asp:Repeater ID="rptEduItems" runat="server">
    <ItemTemplate>
        <li class="mb-3">
            <span class="badge bg-secondary mb-1">
                <%# Eval("YearStarted") %> - <%# Eval("YearEnded") != DBNull.Value ? Eval("YearEnded") : "Present" %>
            </span>
            
            <!-- Degree/Course o Strand -->
            <p class="mb-0 fw-bold text-info">
                <%# !string.IsNullOrEmpty(Eval("DegreeCourse").ToString()) ? Eval("DegreeCourse") : (Eval("Strand") != DBNull.Value ? Eval("Strand") + " Strand" : "") %>
                <%# !string.IsNullOrEmpty(Eval("Major").ToString()) ? " (Major in " + Eval("Major") + ")" : "" %>
            </p>

            <!-- Year Level at Section -->
            <p class="small text-light mb-0">
                <%# Eval("YearLevel") != DBNull.Value ? Eval("YearLevel") : "" %>
                <%# !string.IsNullOrEmpty(Eval("Section").ToString()) ? " [" + Eval("Section") + "]" : "" %>
            </p>

            <!-- Details / Honors -->
            <p class="small text-secondary mb-0"><%# Eval("Description") %></p>
        </li>
    </ItemTemplate>
</asp:Repeater>
                                    </ul>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </section>

        <!-- Skills & Hobbies Section -->
        <section id="skills">
            <div class="container">
                <h2 class="section-title" data-aos="fade-right">Skills & Hobbies</h2>
                <div class="row g-4">
                    
                    <div class="col-md-7" data-aos="zoom-in" data-aos-delay="100">
                        <div class="custom-card">
                            <h4 class="mb-3">Technologies & Tools</h4>
                            <div class="d-flex flex-wrap gap-2">
                                <asp:Repeater ID="rptSkills" runat="server" OnItemCommand="rptSkills_ItemCommand">
                                    <ItemTemplate>
                                        <span class="skill-badge d-inline-flex align-items-center gap-2">
                                            <%# Eval("SkillName") %>
                                            <asp:LinkButton ID="btnDeleteSkill" runat="server" CommandName="DeleteSkill" CommandArgument='<%# Eval("SkillID") %>' CssClass="text-danger p-0 border-0 bg-transparent text-decoration-none" OnClientClick="return confirm('Delete skill?');" CausesValidation="false">&times;</asp:LinkButton>
                                        </span>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-5" data-aos="zoom-in" data-aos-delay="200">
                        <div class="custom-card">
                            <h4 class="mb-3">Hobbies & Interests</h4>
                            <div class="d-flex flex-column gap-3">
                                <asp:Repeater ID="rptHobbies" runat="server" OnItemCommand="rptHobbies_ItemCommand">
                                    <ItemTemplate>
                                        <div class="hobby-item d-flex align-items-center justify-content-between gap-3">
                                            <div class="d-flex align-items-center gap-3">
                                                <div class="hobby-icon-wrapper"><i class='<%# Eval("IconClass") %>'></i></div>
                                                <span><%# Eval("HobbyName") %></span>
                                            </div>
                                            <asp:LinkButton ID="btnDeleteHobby" runat="server" CommandName="DeleteHobby" CommandArgument='<%# Eval("HobbyID") %>' CssClass="btn btn-sm btn-outline-danger border-0" OnClientClick="return confirm('Delete hobby?');" CausesValidation="false">
                                                <i class="bi bi-trash"></i>
                                            </asp:LinkButton>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </section>

        <!-- Footer Section -->
        <footer class="custom-footer">
            <div class="container py-4">
                <div class="row align-items-center gy-3">
                    <div class="col-md-6 text-center text-md-start">
                        <a class="brand-logo text-decoration-none fw-bold" href="#home">
                            <span class="logo-accent">&lt;</span>DEV PORTFOLIO<span class="logo-accent"> /&gt;</span>
                        </a>
                        <p class="small text-secondary mt-1 mb-0">Student Account Managed Portfolio Page</p>
                    </div>
                    <div class="col-md-6 text-center text-md-end">
                        <a href="#home" class="btn-back-to-top text-decoration-none">
                            Back to Top <i class="bi bi-arrow-up-short"></i>
                        </a>
                    </div>
                </div>
                <hr class="border-secondary my-3 opacity-25" />
                <div class="text-center small text-secondary">
                    &copy; <%: DateTime.Now.Year %> Student Portfolio Manager. All rights reserved.
                </div>
            </div>
        </footer>

        <!-- MODAL 1: Edit Profile Details & Photo Upload -->
        <div class="modal fade" id="editProfileModal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content bg-dark text-light border-secondary">
                    <div class="modal-header border-secondary">
                        <h5 class="modal-title fw-bold text-info"><i class="bi bi-pencil-square me-2"></i>Edit My Profile & Quick Info</h5>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <div class="mb-3">
                            <label class="form-label text-secondary small fw-bold">Upload Profile Photo (.PNG, .JPG lang)</label>
                            <asp:FileUpload ID="fileUploadPhoto" runat="server" accept=".png, .jpg, .jpeg" CssClass="form-control bg-dark text-light border-secondary" />
                        </div>
                        <div class="mb-3">
                            <label class="form-label text-secondary small fw-bold">Full Name</label>
                            <asp:TextBox ID="txtEditFullName" runat="server" CssClass="form-control bg-dark text-light border-secondary"></asp:TextBox>
                        </div>
                        
                        <!-- Read-only Email Field -->
                        <div class="mb-3">
                            <label class="form-label text-secondary small fw-bold">
                                Email Address <i class="bi bi-lock-fill text-warning ms-1" title="Account Email (Locked)"></i>
                            </label>
                            <asp:TextBox ID="txtEditEmail" runat="server" TextMode="Email" ReadOnly="true" CssClass="form-control bg-secondary bg-opacity-25 text-secondary border-secondary" style="cursor: not-allowed;"></asp:TextBox>
                        </div>

                        <div class="mb-3">
                            <label class="form-label text-secondary small fw-bold">Professional Title</label>
                            <asp:TextBox ID="txtEditTitle" runat="server" CssClass="form-control bg-dark text-light border-secondary" Placeholder="e.g. Student / Web Developer"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label class="form-label text-secondary small fw-bold">Phone Number</label>
                            <asp:TextBox ID="txtEditPhone" runat="server" CssClass="form-control bg-dark text-light border-secondary"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label class="form-label text-secondary small fw-bold">Address / Location</label>
                            <asp:TextBox ID="txtEditAddress" runat="server" CssClass="form-control bg-dark text-light border-secondary"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label class="form-label text-secondary small fw-bold">Year Level / Status</label>
                            <asp:TextBox ID="txtEditYearLevel" runat="server" CssClass="form-control bg-dark text-light border-secondary" Placeholder="e.g. 3rd Year BSIT"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label class="form-label text-secondary small fw-bold">Bio Description</label>
                            <asp:TextBox ID="txtEditBio" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control bg-dark text-light border-secondary"></asp:TextBox>
                        </div>
                    </div>
                    <div class="modal-footer border-secondary">
                        <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">Cancel</button>
                        <asp:LinkButton ID="btnSaveProfile" runat="server" OnClick="btnSaveProfile_Click" CssClass="btn btn-primary-custom btn-sm" CausesValidation="false" OnClientClick="return allowSaveProfile();">
                            <i class="bi bi-check-circle me-1"></i> Save Changes
                        </asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>

        <!-- MODAL 2: Add Education Record (Dynamic Forms) -->
        <div class="modal fade" id="addEduModal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content bg-dark text-light border-secondary">
                    <div class="modal-header border-secondary">
                        <h5 class="modal-title fw-bold text-warning">
                            <i class="bi bi-mortarboard me-2"></i>Add Educational Attainment
                        </h5>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        
                        <!-- Section 1: School / Institution Information -->
                        <div class="row g-3 mb-3">
                            <div class="col-md-6">
                                <label class="form-label text-secondary small fw-bold">Education Level Category</label>
                                <asp:DropDownList ID="ddlEduLevel" runat="server" CssClass="form-select bg-dark text-light border-secondary" onchange="onEduLevelChange()">
                                    <asp:ListItem Value="College">College / Tertiary</asp:ListItem>
                                    <asp:ListItem Value="Senior High School">Senior High School (SHS)</asp:ListItem>
                                    <asp:ListItem Value="Junior High School">Junior High School (JHS)</asp:ListItem>
                                    <asp:ListItem Value="Elementary">Elementary Education</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label text-secondary small fw-bold">School / Institution Name</label>
                                <asp:TextBox ID="txtSchoolName" runat="server" CssClass="form-control bg-dark text-light border-secondary" Placeholder="e.g. Quezon City University"></asp:TextBox>
                            </div>
                        </div>

                        <hr class="border-secondary my-3" />

                        <!-- Section 2: Detailed Timeline Entries -->
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <div>
                                <h6 class="text-info fw-bold mb-0">Academic Details & Timeline</h6>
                                <small class="text-secondary">Fill in the required details based on your selected level.</small>
                            </div>
                            <button type="button" class="btn btn-outline-info btn-sm" onclick="addEduRow()">
                                <i class="bi bi-plus-circle me-1"></i> Add Entry
                            </button>
                        </div>

                        <!-- Dynamic Rows Container -->
                        <div id="eduRowsContainer"></div>

                    </div>
                    <div class="modal-footer border-secondary">
                        <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">Cancel</button>
                        <asp:Button ID="btnAddEducation" runat="server" Text="Save All Entries" OnClick="btnAddEducation_Click" CssClass="btn btn-warning btn-sm text-dark fw-bold" CausesValidation="false" />
                    </div>
                </div>
            </div>
        </div>

        <!-- MODAL 3: Add Skill & Hobby -->
        <div class="modal fade" id="addSkillModal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content bg-dark text-light border-secondary">
                    <div class="modal-header border-secondary">
                        <h5 class="modal-title fw-bold text-success"><i class="bi bi-tools me-2"></i>Add Skill / Hobby</h5>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <h6 class="text-info fw-bold mb-2">New Skill</h6>
                        <div class="input-group mb-4">
                            <asp:TextBox ID="txtNewSkill" runat="server" CssClass="form-control bg-dark text-light border-secondary" Placeholder="e.g. C# / Java / HTML"></asp:TextBox>
                            <asp:Button ID="btnAddSkill" runat="server" Text="Add Skill" OnClick="btnAddSkill_Click" CssClass="btn btn-outline-info" CausesValidation="false" />
                        </div>

                        <hr class="border-secondary" />

                        <h6 class="text-info fw-bold mb-2">New Hobby</h6>
                        <div class="mb-2">
                            <asp:TextBox ID="txtNewHobby" runat="server" CssClass="form-control bg-dark text-light border-secondary" Placeholder="e.g. Playing Basketball"></asp:TextBox>
                        </div>
                        <div class="input-group mb-3">
                            <span class="input-group-text bg-dark text-secondary border-secondary">Icon Class</span>
                            <asp:TextBox ID="txtHobbyIcon" runat="server" CssClass="form-control bg-dark text-light border-secondary" Placeholder="bi-dribbble"></asp:TextBox>
                            <asp:Button ID="btnAddHobby" runat="server" Text="Add Hobby" OnClick="btnAddHobby_Click" CssClass="btn btn-outline-success" CausesValidation="false" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script type="text/javascript">
        document.addEventListener("DOMContentLoaded", function () {
            var aosLib = window['AOS'];
            if (typeof aosLib !== 'undefined') {
                aosLib.init({ duration: 800, once: true });
            }

            // Kusa nitong i-initialize ang dynamic rows kapag na-load ang page
            onEduLevelChange();
        });

        function getSelectedEduLevel() {
            var ddl = document.getElementById('<%= ddlEduLevel.ClientID %>') || document.getElementById('ddlEduLevel');
            return ddl ? ddl.value : 'College';
        }

        function onEduLevelChange() {
            var container = document.getElementById("eduRowsContainer");
            container.innerHTML = ""; // I-clear ang lumang mga rows
            addEduRow(); // Mag-insert ng bagong dynamic form row para sa napiling education level
        }

        function addEduRow() {
            var container = document.getElementById("eduRowsContainer");
            var level = getSelectedEduLevel();
            var div = document.createElement("div");
            div.className = "edu-row border border-secondary p-3 rounded mb-3 bg-dark-subtle position-relative";

            var htmlContent = `<button type="button" class="btn-close btn-close-white position-absolute top-0 end-0 m-2" onclick="this.parentElement.remove()"></button>`;

            if (level === "College") {
                htmlContent += `
                    <div class="row g-2 mb-2">
                        <div class="col-md-6">
                            <label class="form-label text-secondary small fw-bold mb-1">Degree / Course</label>
                            <input type="text" name="txtDegreeCourse[]" class="form-control form-control-sm bg-dark text-light border-secondary" placeholder="e.g. BS in Information Technology" required />
                        </div>
                        <div class="col-md-6">
                            <label class="form-label text-secondary small fw-bold mb-1">Major <span class="fw-normal text-muted">(Optional)</span></label>
                            <input type="text" name="txtMajor[]" class="form-control form-control-sm bg-dark text-light border-secondary" placeholder="e.g. Network & Security / Web Dev" />
                        </div>
                    </div>
                    <div class="row g-2 mb-2">
                        <div class="col-md-6">
                            <label class="form-label text-secondary small fw-bold mb-1">Year Level</label>
                            <input type="text" name="txtYearLevel[]" class="form-control form-control-sm bg-dark text-light border-secondary" placeholder="e.g. 3rd Year / Graduated" />
                        </div>
                        <div class="col-md-6">
                            <label class="form-label text-secondary small fw-bold mb-1">Section</label>
                            <input type="text" name="txtSection[]" class="form-control form-control-sm bg-dark text-light border-secondary" placeholder="e.g. SBIT-3A" />
                        </div>
                    </div>
                `;
            } 
            else if (level === "Senior High School") {
                htmlContent += `
                    <div class="row g-2 mb-2">
                        <div class="col-md-6">
                            <label class="form-label text-secondary small fw-bold mb-1">Strand / Track</label>
                            <input type="text" name="txtStrand[]" class="form-control form-control-sm bg-dark text-light border-secondary" placeholder="e.g. STEM / TVL-ICT / ABM" required />
                        </div>
                        <div class="col-md-3">
                            <label class="form-label text-secondary small fw-bold mb-1">Grade Level</label>
                            <input type="text" name="txtYearLevel[]" class="form-control form-control-sm bg-dark text-light border-secondary" placeholder="e.g. Grade 12" />
                        </div>
                        <div class="col-md-3">
                            <label class="form-label text-secondary small fw-bold mb-1">Section</label>
                            <input type="text" name="txtSection[]" class="form-control form-control-sm bg-dark text-light border-secondary" placeholder="e.g. 12-A" />
                        </div>
                    </div>
                `;
            } 
            else if (level === "Junior High School") {
                htmlContent += `
                    <div class="row g-2 mb-2">
                        <div class="col-md-6">
                            <label class="form-label text-secondary small fw-bold mb-1">Grade Level</label>
                            <input type="text" name="txtYearLevel[]" class="form-control form-control-sm bg-dark text-light border-secondary" placeholder="e.g. Grade 10 / Complete JHS" required />
                        </div>
                        <div class="col-md-6">
                            <label class="form-label text-secondary small fw-bold mb-1">Section</label>
                            <input type="text" name="txtSection[]" class="form-control form-control-sm bg-dark text-light border-secondary" placeholder="e.g. 10-Einstein" />
                        </div>
                    </div>
                `;
            } 
            else if (level === "Elementary") {
                htmlContent += `
                    <div class="row g-2 mb-2">
                        <div class="col-md-6">
                            <label class="form-label text-secondary small fw-bold mb-1">Grade Level Status</label>
                            <input type="text" name="txtYearLevel[]" class="form-control form-control-sm bg-dark text-light border-secondary" placeholder="e.g. Grade 6 / Elementary Graduate" required />
                        </div>
                        <div class="col-md-6">
                            <label class="form-label text-secondary small fw-bold mb-1">Section</label>
                            <input type="text" name="txtSection[]" class="form-control form-control-sm bg-dark text-light border-secondary" placeholder="e.g. Grade 6 - Mabini" />
                        </div>
                    </div>
                `;
            }

            // Karaniwang School Year at Details
            htmlContent += `
                <div class="row g-2 mb-2">
                    <div class="col-md-6">
                        <label class="form-label text-secondary small fw-bold mb-1">Start Year</label>
                        <input type="number" name="txtYearStarted[]" class="form-control form-control-sm bg-dark text-light border-secondary" placeholder="e.g. 2021" min="1900" max="2099" required />
                    </div>
                    <div class="col-md-6">
                        <label class="form-label text-secondary small fw-bold mb-1">End Year <span class="fw-normal text-muted">(Leave blank if Present)</span></label>
                        <input type="number" name="txtYearEnded[]" class="form-control form-control-sm bg-dark text-light border-secondary" placeholder="e.g. 2025" min="1900" max="2099" />
                    </div>
                </div>
                <div>
                    <label class="form-label text-secondary small fw-bold mb-1">Honors / Achievements / Details <span class="fw-normal text-muted">(Optional)</span></label>
                    <input type="text" name="txtEduDesc[]" class="form-control form-control-sm bg-dark text-light border-secondary" placeholder="e.g. With Honors, Academic Excellence Awardee" />
                </div>
            `;

            div.innerHTML = htmlContent;
            container.appendChild(div);
        }

        function allowSaveProfile() {
            var requiredInputs = document.querySelectorAll('#addEduModal [required]');
            requiredInputs.forEach(function (input) {
                input.removeAttribute('required');
            });
            return true;
        }
    </script>
</body>
</html>