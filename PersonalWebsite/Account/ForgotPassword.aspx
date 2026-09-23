<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="PersonalWebsite.Account.ForgotPassword" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reset Password - Dev Portfolio</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" />
    
    <link href="../CSS/site.css" rel="stylesheet" type="text/css" />
    <!-- Nakakabit na ang ForgotPassword.css dito -->
    <link href="../CSS/ForgotPassword.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar fixed-top custom-navbar">
            <div class="container">
                <a class="navbar-brand fw-bold brand-logo" href="../Default.aspx">
                    <span class="logo-accent">&lt;</span>DEV PORTFOLIO<span class="logo-accent"> /&gt;</span>
                </a>
                <a href="Login.aspx" class="btn btn-outline-custom btn-sm">
                    <i class="bi bi-arrow-left me-1"></i> Back to Login
                </a>
            </div>
        </nav>

        <div class="login-section d-flex align-items-center justify-content-center" style="min-height: 80vh;">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 col-lg-5">
                        <div class="login-card">
                            <div class="text-center mb-4">
                                <h3 class="fw-bold text-light">Reset Password</h3>
                                <p class="text-secondary small">Enter your account email and your new password.</p>
                            </div>

                            <asp:Panel ID="pnlAlert" runat="server" Visible="false" CssClass="alert alert-danger py-2 small" role="alert">
                                <asp:Label ID="lblAlertMessage" runat="server"></asp:Label>
                            </asp:Panel>

                            <div class="mb-3">
                                <label class="form-label text-light small fw-bold">Registered Email</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="bi bi-envelope"></i></span>
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" Placeholder="name@example.com" Required="true"></asp:TextBox>
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label text-light small fw-bold">New Password</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="bi bi-key"></i></span>
                                    <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Enter new password" Required="true"></asp:TextBox>
                                </div>
                            </div>

                            <div class="mb-4">
                                <label class="form-label text-light small fw-bold">Confirm New Password</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="bi bi-key-fill"></i></span>
                                    <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Confirm new password" Required="true"></asp:TextBox>
                                </div>
                            </div>

                            <asp:Button ID="btnResetPassword" runat="server" Text="Update Password" OnClick="btnResetPassword_Click" CssClass="btn btn-primary-custom w-100 mb-3" />

                            <div class="text-center mt-2">
                                <a href="Login.aspx" class="text-info small text-decoration-none fw-bold">Remembered your password? Sign In</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>