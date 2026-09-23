<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="PersonalWebsite.Account.Register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up - Dev Portfolio</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" />
    
    <link href="../CSS/site.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/register.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar fixed-top custom-navbar">
            <div class="container">
                <!-- Brand Logo link pabalik sa Default.aspx -->
                <a class="navbar-brand fw-bold brand-logo" href="../Default.aspx">
                    <span class="logo-accent">&lt;</span>DEV PORTFOLIO<span class="logo-accent"> /&gt;</span>
                </a>
                <!-- Back to Home button link pabalik sa Default.aspx -->
                <a href="../Default.aspx" class="btn btn-outline-custom btn-sm">
                    <i class="bi bi-arrow-left me-1"></i> Back to Home
                </a>
            </div>
        </nav>

        <div class="login-section py-5">
            <div class="container">
                <div class="row align-items-center justify-content-between gy-5">
                    
                    <!-- Left Column: Info Text -->
                    <div class="col-lg-5 text-start login-welcome-text">
                        <span class="badge bg-outline-cyan mb-3 px-3 py-2">STUDENT REGISTRATION</span>
                        <h1 class="display-5 fw-bold text-light mb-3">Create Your Portfolio Account</h1>
                        <p class="lead text-secondary mb-4">
                            Join our platform to build, customize, and showcase your student portfolio. Fill in your details to set up your account profile instantly.
                        </p>

                        <div class="d-flex flex-column gap-3 mt-4">
                            <div class="d-flex align-items-start gap-3">
                                <div class="feature-icon-box"><i class="bi bi-person-vcard"></i></div>
                                <div>
                                    <h6 class="text-light mb-1 fw-bold">Personal Bio & Location</h6>
                                    <small class="text-secondary">Profile fields that populate your portfolio hero and about sections.</small>
                                </div>
                            </div>
                            <div class="d-flex align-items-start gap-3">
                                <div class="feature-icon-box"><i class="bi bi-mortarboard"></i></div>
                                <div>
                                    <h6 class="text-light mb-1 fw-bold">Educational Timeline</h6>
                                    <small class="text-secondary">Set up your current year level and school information dynamically.</small>
                                </div>
                            </div>
                            <div class="d-flex align-items-start gap-3">
                                <div class="feature-icon-box"><i class="bi bi-code-slash"></i></div>
                                <div>
                                    <h6 class="text-light mb-1 fw-bold">Skills & Hobbies Customization</h6>
                                    <small class="text-secondary">Easily modify tech stacks, tools, and personal interests anytime.</small>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Right Column: Registration Form Card -->
                    <div class="col-lg-7">
                        <div class="login-card p-4 p-md-5">
                            <div class="text-center mb-4">
                                <h3 class="fw-bold text-light">Sign Up</h3>
                                <p class="text-secondary small">Fill in your information to get started with your portfolio</p>
                            </div>

                            <asp:Panel ID="pnlAlert" runat="server" Visible="false" CssClass="alert alert-danger py-2 small" role="alert">
                                <asp:Label ID="lblErrorMessage" runat="server"></asp:Label>
                            </asp:Panel>

                            <!-- Name Fields Row -->
                            <div class="row g-2 mb-3">
                                <div class="col-md-4">
                                    <label class="form-label text-light small fw-bold">First Name</label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="bi bi-person"></i></span>
                                        <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" Placeholder="e.g. James" Required="true"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label text-light small fw-bold">Middle Name <span class="text-muted fw-normal">(Optional)</span></label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="bi bi-person"></i></span>
                                        <asp:TextBox ID="txtMiddleName" runat="server" CssClass="form-control" Placeholder="e.g. Benedict"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label text-light small fw-bold">Last Name</label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="bi bi-person"></i></span>
                                        <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" Placeholder="e.g. Esteban" Required="true"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <!-- Title & Year Level Row -->
                            <div class="row g-2 mb-3">
                                <div class="col-md-6">
                                    <label class="form-label text-light small fw-bold">Professional Title / Role</label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="bi bi-briefcase"></i></span>
                                        <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" Placeholder="e.g. Student / Web Developer"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label text-light small fw-bold">Year Level / Course Status</label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="bi bi-book"></i></span>
                                        <asp:TextBox ID="txtYearLevel" runat="server" CssClass="form-control" Placeholder="e.g. 3rd Year BSIT"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <!-- Contact Info Row -->
                            <div class="row g-2 mb-3">
                                <div class="col-md-6">
                                    <label class="form-label text-light small fw-bold">Email Address</label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="bi bi-envelope"></i></span>
                                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" Placeholder="name@example.com" Required="true"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label text-light small fw-bold">Phone Number</label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="bi bi-telephone"></i></span>
                                        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" Placeholder="e.g. 09123456789"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <!-- Address Field -->
                            <div class="mb-3">
                                <label class="form-label text-light small fw-bold">Address / Location</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="bi bi-geo-alt"></i></span>
                                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" Placeholder="e.g. Quezon City, Metro Manila"></asp:TextBox>
                                </div>
                            </div>

                            <!-- Passwords Row -->
                            <div class="row g-2 mb-4">
                                <div class="col-md-6">
                                    <label class="form-label text-light small fw-bold">Password</label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="bi bi-lock"></i></span>
                                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" Placeholder="••••••••" Required="true"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label text-light small fw-bold">Confirm Password</label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="bi bi-shield-lock"></i></span>
                                        <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" Placeholder="••••••••" Required="true"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <asp:Button ID="btnRegister" runat="server" Text="Create Account" OnClick="btnRegister_Click" CssClass="btn btn-primary-custom w-100 mb-3 py-2 fw-bold" />

                            <div class="text-center mt-3">
                                <span class="text-secondary small">Already have an account?</span>
                                <a href="Login.aspx" class="text-info small text-decoration-none fw-bold ms-1">Sign In</a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </form>
</body>
</html>