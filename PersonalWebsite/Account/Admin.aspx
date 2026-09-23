<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="PersonalWebsite.Account.Admin" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard - Dev Portfolio</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    
    <!-- Bootstrap 5 CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Bootstrap Icons CDN -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" />
    
    <!-- Shared Custom CSS -->
    <link href="../CSS/site.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/admin.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        
        <!-- Header Navigation -->
        <nav class="navbar fixed-top custom-navbar">
            <div class="container">
                <a class="navbar-brand fw-bold brand-logo" href="Admin.aspx">
                    <span class="logo-accent">&lt;</span>ADMIN DASHBOARD<span class="logo-accent"> /&gt;</span>
                </a>
                <div class="d-flex align-items-center gap-3">
                    <span class="text-light small">Welcome, <strong class="text-info"><asp:Label ID="lblAdminName" runat="server" Text="Administrator"></asp:Label></strong></span>
                    <asp:LinkButton ID="btnLogout" runat="server" OnClick="btnLogout_Click" CssClass="btn btn-outline-danger btn-sm" CausesValidation="false">
                        <i class="bi bi-box-arrow-right me-1"></i> Logout
                    </asp:LinkButton>
                </div>
            </div>
        </nav>

        <!-- Main Content Area -->
        <div class="container admin-container" style="margin-top: 90px; padding-bottom: 50px;">
            
            <div class="d-flex justify-content-between align-items-center mb-4">
                <div>
                    <h2 class="fw-bold text-light mb-1">System Monitoring & Analytics</h2>
                    <p class="text-secondary small mb-0">Real-time statistics on registered users, active accounts, and platform metrics.</p>
                </div>
            </div>

            <!-- Dynamic Statistic Cards Overview -->
            <div class="row g-4 mb-4">
                <div class="col-md-3">
                    <div class="card-metric border-start border-info border-4 bg-dark text-light p-3 rounded">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <small class="text-secondary text-uppercase fw-bold">Total Students</small>
                                <h3 class="fw-bold text-light mt-1 mb-0"><asp:Label ID="lblTotalStudents" runat="server" Text="0" ClientIDMode="Static"></asp:Label></h3>
                            </div>
                            <div class="feature-icon-box text-info fs-3"><i class="bi bi-people"></i></div>
                        </div>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="card-metric border-start border-success border-4 bg-dark text-light p-3 rounded">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <small class="text-secondary text-uppercase fw-bold">Active Users</small>
                                <h3 class="fw-bold text-light mt-1 mb-0"><asp:Label ID="lblActiveUsers" runat="server" Text="0" ClientIDMode="Static"></asp:Label></h3>
                            </div>
                            <div class="feature-icon-box text-success fs-3"><i class="bi bi-person-check"></i></div>
                        </div>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="card-metric border-start border-warning border-4 bg-dark text-light p-3 rounded">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <small class="text-secondary text-uppercase fw-bold">Inactive Users</small>
                                <h3 class="fw-bold text-light mt-1 mb-0"><asp:Label ID="lblInactiveUsers" runat="server" Text="0" ClientIDMode="Static"></asp:Label></h3>
                            </div>
                            <div class="feature-icon-box text-warning fs-3"><i class="bi bi-person-slash"></i></div>
                        </div>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="card-metric border-start border-primary border-4 bg-dark text-light p-3 rounded">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <small class="text-secondary text-uppercase fw-bold">Profiles Setup</small>
                                <h3 class="fw-bold text-light mt-1 mb-0"><asp:Label ID="lblProfilesCount" runat="server" Text="0" ClientIDMode="Static"></asp:Label></h3>
                            </div>
                            <div class="feature-icon-box text-primary fs-3"><i class="bi bi-pencil-square"></i></div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Visual Analytics Graphs Section -->
            <div class="row g-4 mb-4">
                <div class="col-lg-7">
                    <div class="card-metric bg-dark text-light p-4 rounded h-100 border border-secondary">
                        <h5 class="fw-bold text-light mb-3"><i class="bi bi-bar-chart-line me-2 text-info"></i>System Activity Breakdown</h5>
                        <div style="position: relative; height:260px;">
                            <canvas id="barChartMetrics"></canvas>
                        </div>
                    </div>
                </div>

                <div class="col-lg-5">
                    <div class="card-metric bg-dark text-light p-4 rounded h-100 border border-secondary">
                        <h5 class="fw-bold text-light mb-3"><i class="bi bi-pie-chart me-2 text-info"></i>User Status Ratio</h5>
                        <div style="position: relative; height:260px;">
                            <canvas id="pieChartStatus"></canvas>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Live User Management Table Section -->
            <div class="row g-4 mb-4">
                <div class="col-12">
                    <div class="card-metric bg-dark text-light p-4 rounded border border-secondary">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h5 class="fw-bold text-light mb-0"><i class="bi bi-people me-2 text-info"></i>Registered Student Accounts</h5>
                            <span class="badge bg-success admin-badge-stat">Live Monitoring</span>
                        </div>
                        
                        <div class="table-responsive">
                            <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" 
                                CssClass="table table-dark table-hover align-middle mb-0" GridLines="None"
                                OnRowCommand="gvUsers_RowCommand">
                                <Columns>
                                    <asp:BoundField DataField="FullName" HeaderText="STUDENT NAME" ItemStyle-CssClass="fw-semibold text-light" />
                                    <asp:BoundField DataField="Email" HeaderText="EMAIL ADDRESS" ItemStyle-CssClass="text-secondary" />
                                    
                                    <asp:TemplateField HeaderText="ACCOUNT STATUS">
                                        <ItemTemplate>
                                            <span class='<%# Convert.ToBoolean(Eval("IsActive")) ? "badge bg-success" : "badge bg-danger" %>'>
                                                <%# Convert.ToBoolean(Eval("IsActive")) ? "Active" : "Inactive" %>
                                            </span>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="ACTION" ItemStyle-CssClass="text-end">
                                        <ItemTemplate>
                                            <asp:Button ID="btnToggleStatus" runat="server" 
                                                CommandName="ToggleStatus" 
                                                CommandArgument='<%# Eval("UserID") + "|" + Eval("IsActive") %>'
                                                Text='<%# Convert.ToBoolean(Eval("IsActive")) ? "Deactivate" : "Activate" %>' 
                                                CssClass='<%# Convert.ToBoolean(Eval("IsActive")) ? "btn btn-outline-warning btn-sm" : "btn btn-outline-success btn-sm" %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Visitor Messages Inbox Section -->
            <div class="row g-4">
                <div class="col-12">
                    <div class="card-metric bg-dark text-light p-4 rounded border border-secondary">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h5 class="fw-bold text-light mb-0">
                                <i class="bi bi-envelope-open me-2 text-info"></i>Visitor Messages Inbox
                            </h5>
                            <span class="badge bg-primary">Inquiries & Feedback</span>
                        </div>
                        
                        <div class="table-responsive">
                            <asp:GridView ID="gvMessages" runat="server" AutoGenerateColumns="False" 
                                CssClass="table table-dark table-hover align-middle mb-0" GridLines="None"
                                OnRowCommand="gvMessages_RowCommand" EmptyDataText="No messages received yet.">
                                <Columns>
                                    <asp:BoundField DataField="SenderName" HeaderText="SENDER NAME" ItemStyle-CssClass="fw-semibold text-light" />
                                    <asp:BoundField DataField="SenderEmail" HeaderText="EMAIL ADDRESS" ItemStyle-CssClass="text-info" />
                                    <asp:BoundField DataField="MessageText" HeaderText="MESSAGE" ItemStyle-CssClass="text-secondary" />
                                    <asp:BoundField DataField="SentAt" HeaderText="DATE SENT" DataFormatString="{0:MMM dd, yyyy hh:mm tt}" ItemStyle-CssClass="text-secondary small" />

                                    <asp:TemplateField HeaderText="ACTION" ItemStyle-CssClass="text-end">
                                        <ItemTemplate>
                                            <asp:Button ID="btnDeleteMsg" runat="server" 
                                                CommandName="DeleteMessage" 
                                                CommandArgument='<%# Eval("MessageID") %>'
                                                Text="Delete" 
                                                OnClientClick="return confirm('Are you sure you want to delete this message?');"
                                                CssClass="btn btn-outline-danger btn-sm" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </form>

    <!-- JS CDNs -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <!-- Inline Script para sigurado 100% na mag-re-render ang charts nang walang TypeScript/VS errors -->
    <script type="text/javascript">
        window.addEventListener("load", function () {
            var lblTotal = document.getElementById("lblTotalStudents");
            var lblActive = document.getElementById("lblActiveUsers");
            var lblInactive = document.getElementById("lblInactiveUsers");
            var lblProfiles = document.getElementById("lblProfilesCount");

            var ChartClass = window['Chart'];

            if (lblTotal && lblActive && lblInactive && lblProfiles && typeof ChartClass !== 'undefined') {

                var totalStudents = parseInt(lblTotal.innerText) || 0;
                var activeUsers = parseInt(lblActive.innerText) || 0;
                var inactiveUsers = parseInt(lblInactive.innerText) || 0;
                var profilesCount = parseInt(lblProfiles.innerText) || 0;

                // 1. Bar Chart Overview
                var elBar = document.getElementById('barChartMetrics');
                if (elBar && 'getContext' in elBar) {
                    var canvasBar = elBar;
                    var ctxBar = canvasBar.getContext('2d');
                    new ChartClass(ctxBar, {
                        type: 'bar',
                        data: {
                            labels: ['Total Students', 'Active Users', 'Inactive Users', 'Profiles Created'],
                            datasets: [{
                                label: 'Metrics Count',
                                data: [totalStudents, activeUsers, inactiveUsers, profilesCount],
                                backgroundColor: [
                                    'rgba(13, 202, 240, 0.7)',
                                    'rgba(25, 135, 84, 0.7)',
                                    'rgba(255, 193, 7, 0.7)',
                                    'rgba(13, 110, 253, 0.7)'
                                ],
                                borderColor: [
                                    '#0dcaf0',
                                    '#198754',
                                    '#ffc107',
                                    '#0d6efd'
                                ],
                                borderWidth: 1
                            }]
                        },
                        options: {
                            responsive: true,
                            maintainAspectRatio: false,
                            plugins: { legend: { display: false } },
                            scales: {
                                y: { beginAtZero: true, grid: { color: 'rgba(255,255,255,0.1)' }, ticks: { color: '#ccc' } },
                                x: { grid: { display: false }, ticks: { color: '#ccc' } }
                            }
                        }
                    });
                }

                // 2. Doughnut Chart Status Ratio
                var elPie = document.getElementById('pieChartStatus');
                if (elPie && 'getContext' in elPie) {
                    var canvasPie = elPie;
                    var ctxPie = canvasPie.getContext('2d');
                    new ChartClass(ctxPie, {
                        type: 'doughnut',
                        data: {
                            labels: ['Active Users', 'Inactive Users'],
                            datasets: [{
                                data: [activeUsers, inactiveUsers],
                                backgroundColor: ['#198754', '#ffc107'],
                                borderWidth: 0
                            }]
                        },
                        options: {
                            responsive: true,
                            maintainAspectRatio: false,
                            plugins: {
                                legend: { labels: { color: '#ccc' }, position: 'bottom' }
                            }
                        }
                    });
                }
            }
        });
    </script>
</body>
</html>