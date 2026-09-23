<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PersonalWebsite.Account.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign In - Dev Portfolio</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" />
    
    <link href="../CSS/site.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/login.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar fixed-top custom-navbar">
            <div class="container">
                <a class="navbar-brand fw-bold brand-logo" href="../Default.aspx">
                    <span class="logo-accent">&lt;</span>DEV PORTFOLIO<span class="logo-accent"> /&gt;</span>
                </a>
                <a href="../Default.aspx" class="btn btn-outline-custom btn-sm">
                    <i class="bi bi-arrow-left me-1"></i> Back to Home
                </a>
            </div>
        </nav>

        <div class="login-section">
            <div class="container">
                <div class="row align-items-center justify-content-between gy-5">
                    <div class="col-lg-6 text-start login-welcome-text">
                        <span class="badge bg-outline-cyan mb-3 px-3 py-2">PORTFOLIO SYSTEM ACCESS</span>
                        <h1 class="display-5 fw-bold text-light mb-3">Authentication Required</h1>
                        <p class="lead text-secondary mb-4">
                            Welcome to the personal website platform. Please sign in to your account to view the full website content and manage your personal profile.
                        </p>

                        <div class="d-flex flex-column gap-3 mt-4">
                            <div class="d-flex align-items-start gap-3">
                                <div class="feature-icon-box"><i class="bi bi-lock-fill"></i></div>
                                <div>
                                    <h6 class="text-light mb-1 fw-bold">Sign-In Protected Access</h6>
                                    <small class="text-secondary">Users must sign in first before they can view the entire portfolio website and its dynamic features.</small>
                                </div>
                            </div>
                            <div class="d-flex align-items-start gap-3">
                                <div class="feature-icon-box"><i class="bi bi-person-plus-fill"></i></div>
                                <div>
                                    <h6 class="text-light mb-1 fw-bold">New User Registration</h6>
                                    <small class="text-secondary">If your account does not exist in the database yet, you can easily sign up for a new account.</small>
                                </div>
                            </div>
                            <div class="d-flex align-items-start gap-3">
                                <div class="feature-icon-box"><i class="bi bi-person-gear"></i></div>
                                <div>
                                    <h6 class="text-light mb-1 fw-bold">Profile Management</h6>
                                    <small class="text-secondary">Registered users have the ability to view and modify their personal information anytime.</small>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-5">
                        <div class="login-card">
                            <div class="text-center mb-4">
                                <h3 class="fw-bold text-light">Sign In</h3>
                                <p class="text-secondary small">Enter your credentials to access the site</p>
                            </div>

                            <asp:Panel ID="pnlAlert" runat="server" Visible="false" CssClass="alert alert-danger py-2 small" role="alert">
                                <asp:Label ID="lblErrorMessage" runat="server"></asp:Label>
                            </asp:Panel>

                            <div class="mb-3">
                                <label class="form-label text-light small fw-bold">Email Address</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="bi bi-envelope"></i></span>
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" Placeholder="name@example.com" Required="true"></asp:TextBox>
                                </div>
                            </div>

                            <div class="mb-4">
                                <div class="d-flex justify-content-between align-items-center mb-1">
                                    <label class="form-label text-light small fw-bold mb-0">Password</label>
                                    <a href="ForgotPassword.aspx" class="text-info small text-decoration-none">Forgot Password?</a>
                                </div>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="bi bi-lock"></i></span>
                                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" Placeholder="••••••••" Required="true"></asp:TextBox>
                                </div>
                            </div>

                            <asp:Button ID="btnLogin" runat="server" Text="Sign In" OnClick="btnLogin_Click" CssClass="btn btn-primary-custom w-100 mb-3" />

                            <div class="text-center mt-3">
                                <span class="text-secondary small">Don't have an account?</span>
                                <a href="Register.aspx" class="text-info small text-decoration-none fw-bold ms-1">Sign Up First</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>