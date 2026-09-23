<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PersonalWebsite.Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>James Benedict M. Esteban - Personal Website</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    
    <!-- Bootstrap 5 CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Bootstrap Icons CDN -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" />
    <!-- AOS Scroll Animation CSS CDN -->
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet" />
    <!-- SweetAlert2 CDN -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    
    <!-- Custom CSS -->
    <link href="CSS/site.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        
        <!-- Navigation Bar -->
        <nav class="navbar navbar-expand-lg fixed-top custom-navbar">
            <div class="container">
                <a class="navbar-brand fw-bold brand-logo" href="#home">
                    <span class="logo-accent">&lt;</span>DEV PORTFOLIO<span class="logo-accent"> /&gt;</span>
                </a>
                <button class="navbar-toggler navbar-dark border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                
                <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                    <ul class="navbar-nav align-items-center">
                        <li class="nav-item"><a class="nav-link nav-btn" href="#home">Home</a></li>
                        <li class="nav-item"><a class="nav-link nav-btn" href="#about">About</a></li>
                        <li class="nav-item"><a class="nav-link nav-btn" href="#education">Education</a></li>
                        <li class="nav-item"><a class="nav-link nav-btn" href="#skills">Skills & Hobbies</a></li>
                        <li class="nav-item"><a class="nav-link nav-btn" href="#contact">Contact</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Home / Hero Section -->
        <section id="home" class="hero-section">
            <div class="container" data-aos="fade-up">
                <div class="row align-items-center">
                    <div class="col-lg-7 col-md-6 order-2 order-md-1">
                        <h1 class="hero-title">Hello, I'm James Benedict M. Esteban</h1>
                        <p class="hero-subtitle">
                            I am a <span id="typing-text" class="typing-container"></span>
                        </p>
                        <p class="lead text-secondary mt-3">
                            Crafting responsive, modern user interfaces and dynamic web experiences powered by Front-End technologies, ASP.NET Web Forms, C#, and Java.
                        </p>
                        <div class="mt-4 d-flex align-items-center gap-3">
                            <a href="#contact" class="btn btn-primary-custom">Get in Touch</a>
                            <a href="#about" class="btn btn-outline-custom">Learn More</a>
                        </div>
                    </div>
                    <div class="col-lg-5 col-md-6 text-center order-1 order-md-2 mb-4 mb-md-0">
                        <div class="hero-img-wrapper">
                            <img src="Image/ninja.jpg" alt="Profile Picture" class="img-fluid hero-profile-img" />
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
                                I am a passionate Front-End Developer with a strong focus on UI/UX design, creating clean, intuitive, and responsive web interfaces. I am a quick learner and highly adaptable, able to easily pick up new technologies, tools, and design trends to solve front-end challenges effectively.
                            </p>
                        </div>
                    </div>
                    <div class="col-md-5" data-aos="fade-up" data-aos-delay="200">
                        <div class="custom-card">
                            <h3>Quick Info</h3>
                            <ul class="list-unstyled mt-3 mb-0">
                                <li class="mb-2"><strong>Location:</strong> Quezon City, Philippines</li>
                                <li class="mb-2"><strong>Email:</strong> jeyvee.mabbayad0012@gmail.com</li>
                                <li class="mb-2"><strong>Status:</strong> Available for Projects</li>
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
                    <!-- College Level Card -->
                    <div class="col-md-6" data-aos="fade-up" data-aos-delay="100">
                        <div class="custom-card d-flex gap-4 align-items-start">
                            <img src="Image/qculogo.png" alt="College Logo" class="school-logo mt-1" />
                            <div>
                                <h4 class="text-light fw-bold mb-3">Quezon City University (QCU)</h4>
                                <ul class="timeline-list">
                                    <li class="mb-3">
                                        <span class="badge bg-secondary mb-1">2026 - 2027</span>
                                        <p class="mb-0 fw-bold text-info">BS in Information Technology</p>
                                        <p class="small text-light mb-0">3rd Year College</p>
                                    </li>
                                    <li class="mb-3">
                                        <span class="badge bg-secondary mb-1">2025 - 2026</span>
                                        <p class="mb-0 fw-bold text-info">BS in Information Technology</p>
                                        <p class="small text-light mb-0">2nd Year College</p>
                                    </li>
                                    <li class="mb-3">
                                        <span class="badge bg-secondary mb-1">2024 - 2025</span>
                                        <p class="mb-0 fw-bold text-info">BS in Information Technology</p>
                                        <p class="small text-light mb-0">1st Year College</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <!-- Senior High School Card -->
                    <div class="col-md-6" data-aos="fade-up" data-aos-delay="200">
                        <div class="custom-card d-flex gap-4 align-items-start">
                            <img src="Image/slshslogo.png" alt="SLSHS Logo" class="school-logo mt-1" />
                            <div>
                                <h4 class="text-light fw-bold mb-3">Sta Lucia Senior High School (SLSHS)</h4>
                                <ul class="timeline-list">
                                    <li class="mb-3">
                                        <span class="badge bg-secondary mb-1">2023 - 2024</span>
                                        <p class="mb-0 fw-bold text-info">TVL - Information and Communications Technology (ICT)</p>
                                        <p class="small text-light mb-0">Grade 12</p>
                                    </li>
                                    <li class="mb-3">
                                        <span class="badge bg-secondary mb-1">2022 - 2023</span>
                                        <p class="mb-0 fw-bold text-info">TVL - Information and Communications Technology (ICT)</p>
                                        <p class="small text-light mb-0">Grade 11</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <!-- Junior High School Card -->
                    <div class="col-md-6" data-aos="fade-up" data-aos-delay="300">
                        <div class="custom-card d-flex gap-4 align-items-start">
                            <img src="Image/slhslogo.png" alt="SLHS Logo" class="school-logo mt-1" />
                            <div>
                                <h4 class="text-light fw-bold mb-3">Sta Lucia High School (SLHS)</h4>
                                <ul class="timeline-list">
                                    <li class="mb-3">
                                        <span class="badge bg-secondary mb-1">2020 - 2021</span>
                                        <p class="mb-0 fw-bold text-info">Junior High School</p>
                                        <p class="small text-light mb-0">Grade 10</p>
                                    </li>
                                    <li class="mb-3">
                                        <span class="badge bg-secondary mb-1">2019 - 2020</span>
                                        <p class="mb-0 fw-bold text-info">Junior High School</p>
                                        <p class="small text-light mb-0">Grade 9</p>
                                    </li>
                                    <li class="mb-3">
                                        <span class="badge bg-secondary mb-1">2018 - 2019</span>
                                        <p class="mb-0 fw-bold text-info">Junior High School</p>
                                        <p class="small text-light mb-0">Grade 8</p>
                                    </li>
                                    <li class="mb-3">
                                        <span class="badge bg-secondary mb-1">2017 - 2018</span>
                                        <p class="mb-0 fw-bold text-info">Junior High School</p>
                                        <p class="small text-light mb-0">Grade 7</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <!-- Elementary Education Card -->
                    <div class="col-md-6" data-aos="fade-up" data-aos-delay="400">
                        <div class="custom-card">
                            <h4 class="text-light fw-bold mb-3">Elementary Education</h4>
                            <div class="d-flex gap-4 align-items-start mb-4">
                                <img src="Image/rlsneslogo.png" alt="RLSNES Logo" class="school-logo mt-1" />
                                <div>
                                    <h6 class="text-light fw-bold mb-2">RLSNES</h6>
                                    <ul class="timeline-list">
                                        <li class="mb-3">
                                            <span class="badge bg-secondary mb-1">2016 - 2017</span>
                                            <p class="mb-0 fw-bold text-info">Elementary Education</p>
                                            <p class="small text-light mb-0">Grade 6</p>
                                        </li>
                                        <li class="mb-3">
                                            <span class="badge bg-secondary mb-1">2015 - 2016</span>
                                            <p class="mb-0 fw-bold text-info">Elementary Education</p>
                                            <p class="small text-light mb-0">Grade 5</p>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="d-flex gap-4 align-items-start">
                                <img src="Image/sgeslogo.png" alt="SGES Logo" class="school-logo mt-1" />
                                <div>
                                    <h6 class="text-light fw-bold mb-2">SGES</h6>
                                    <ul class="timeline-list">
                                        <li class="mb-3">
                                            <span class="badge bg-secondary mb-1">2014 - 2015</span>
                                            <p class="mb-0 fw-bold text-info">Elementary Education</p>
                                            <p class="small text-light mb-0">Grade 4</p>
                                        </li>
                                        <li class="mb-3">
                                            <span class="badge bg-secondary mb-1">2013 - 2014</span>
                                            <p class="mb-0 fw-bold text-info">Elementary Education</p>
                                            <p class="small text-light mb-0">Grade 3</p>
                                        </li>
                                        <li class="mb-3">
                                            <span class="badge bg-secondary mb-1">2012 - 2013</span>
                                            <p class="mb-0 fw-bold text-info">Elementary Education</p>
                                            <p class="small text-light mb-0">Grade 2</p>
                                        </li>
                                        <li class="mb-3">
                                            <span class="badge bg-secondary mb-1">2011 - 2012</span>
                                            <p class="mb-0 fw-bold text-info">Elementary Education</p>
                                            <p class="small text-light mb-0">Grade 1</p>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>

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
                            <div>
                                <span class="skill-badge">C#</span>
                                <span class="skill-badge">Java</span>
                                <span class="skill-badge">ASP.NET Web Forms</span>
                                <span class="skill-badge">HTML5</span>
                                <span class="skill-badge">CSS3</span>
                                <span class="skill-badge">JavaScript</span>
                                <span class="skill-badge">Bootstrap 5</span>
                                <span class="skill-badge">UI/UX Design</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5" data-aos="zoom-in" data-aos-delay="200">
                        <div class="custom-card">
                            <h4 class="mb-3">Hobbies & Interests</h4>
                            <div class="d-flex flex-column gap-3">
                                <div class="hobby-item d-flex align-items-center gap-3">
                                    <div class="hobby-icon-wrapper"><i class="bi bi-dribbble"></i></div>
                                    <span>Playing Basketball</span>
                                </div>
                                <div class="hobby-item d-flex align-items-center gap-3">
                                    <div class="hobby-icon-wrapper"><i class="bi bi-music-note-beamed"></i></div>
                                    <span>Listening to Music</span>
                                </div>
                                <div class="hobby-item d-flex align-items-center gap-3">
                                    <div class="hobby-icon-wrapper"><i class="bi bi-activity"></i></div>
                                    <span>Gym Workout</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Contact Section -->
        <section id="contact" class="contact-section">
            <div class="container">
                <h2 class="section-title" data-aos="fade-right">Get In Touch</h2>
                <div class="row g-4 justify-content-center">
                    <div class="col-lg-5" data-aos="fade-right" data-aos-delay="100">
                        <div class="custom-card d-flex flex-column justify-content-between h-100">
                            <div>
                                <h4 class="text-light fw-bold mb-4">Let's Connect</h4>
                                <p class="text-secondary small mb-4">
                                    I am always open to discussing new web development projects, creative design ideas, or opportunities to be part of your vision.
                                </p>
                                <div class="contact-info-list d-flex flex-column gap-3 mb-4">
                                    <div class="contact-info-item d-flex align-items-center gap-3">
                                        <div class="contact-icon-box"><i class="bi bi-geo-alt-fill"></i></div>
                                        <div>
                                            <span class="text-secondary small d-block">Location</span>
                                            <strong class="text-light">Quezon City, Philippines</strong>
                                        </div>
                                    </div>
                                    <div class="contact-info-item d-flex align-items-center gap-3">
                                        <div class="contact-icon-box"><i class="bi bi-envelope-open-fill"></i></div>
                                        <div>
                                            <span class="text-secondary small d-block">Email Me</span>
                                            <a href="mailto:jeyvee.mabbayad0012@gmail.com" class="text-light text-decoration-none fw-bold contact-link">
                                                jeyvee.mabbayad0012...
                                            </a>
                                        </div>
                                    </div>
                                    <div class="contact-info-item d-flex align-items-center gap-3">
                                        <div class="contact-icon-box"><i class="bi bi-briefcase-fill"></i></div>
                                        <div>
                                            <span class="text-secondary small d-block">Status</span>
                                            <span class="badge bg-success-subtle text-success border border-success-subtle px-2 py-1">Available for Projects</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <hr class="border-secondary opacity-25 my-3" />
                                <span class="text-secondary small d-block mb-2">Follow My Socials:</span>
                                <div class="d-flex gap-2">
                                    <a href="https://github.com/jvesteban" target="_blank" class="social-icon" title="GitHub"><i class="bi bi-github"></i></a>
                                    <a href="https://www.facebook.com/jkringg1229" target="_blank" class="social-icon" title="Facebook"><i class="bi bi-facebook"></i></a>
                                    <a href="https://www.instagram.com/jv.e12/?hl=en" target="_blank" class="social-icon" title="Instagram"><i class="bi bi-instagram"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-7" data-aos="fade-left" data-aos-delay="200">
                        <div class="custom-card">
                            <h4 class="text-light fw-bold mb-4"><i class="bi bi-send-fill text-info me-2"></i>Send a Message</h4>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label text-secondary small fw-bold">YOUR NAME</label>
                                    <div class="input-group">
                                        <span class="input-group-text custom-input-group-text"><i class="bi bi-person"></i></span>
                                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control custom-input" Placeholder="e.g. John Doe"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label text-secondary small fw-bold">YOUR EMAIL</label>
                                    <div class="input-group">
                                        <span class="input-group-text custom-input-group-text"><i class="bi bi-envelope"></i></span>
                                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control custom-input" TextMode="Email" Placeholder="e.g. john@example.com"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <label class="form-label text-secondary small fw-bold">MESSAGE</label>
                                    <div class="input-group">
                                        <span class="input-group-text custom-input-group-text align-items-start pt-2"><i class="bi bi-chat-dots"></i></span>
                                        <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control custom-input" Placeholder="Write your message here..."></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-12 mt-4">
                                    <asp:Button ID="btnSend" runat="server" Text="Send Message" OnClick="btnSend_Click" CssClass="btn btn-primary-custom w-100 py-2 fs-6 fw-bold" />
                                </div>
                                <div class="col-12">
                                    <asp:Label ID="lblStatus" runat="server" CssClass="d-block mt-2 text-center fw-bold"></asp:Label>
                                </div>
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
                    <div class="col-md-4 text-center text-md-start">
                        <a class="brand-logo text-decoration-none fw-bold" href="#home">
                            <span class="logo-accent">&lt;</span>DEV PORTFOLIO<span class="logo-accent"> /&gt;</span>
                        </a>
                        <p class="small text-secondary mt-1 mb-0">Designed & Built by James Benedict Esteban</p>
                    </div>
                    <div class="col-md-4 text-center">
                        <div class="social-links d-flex justify-content-center gap-3">
                            <a href="https://github.com/jvesteban" target="_blank" class="social-icon" title="GitHub"><i class="bi bi-github"></i></a>
                            <a href="mailto:jeyvee.mabbayad0012@gmail.com" class="social-icon" title="Email Me"><i class="bi bi-envelope-fill"></i></a>
                            <a href="https://www.facebook.com/jkringg1229" target="_blank" class="social-icon" title="Facebook"><i class="bi bi-facebook"></i></a>
                            <a href="https://www.instagram.com/jv.e12/?hl=en" target="_blank" class="social-icon" title="Instagram"><i class="bi bi-instagram"></i></a>
                        </div>
                    </div>
                    <div class="col-md-4 text-center text-md-end">
                        <a href="#home" class="btn-back-to-top text-decoration-none">
                            Back to Top <i class="bi bi-arrow-up-short"></i>
                        </a>
                    </div>
                </div>
                <hr class="border-secondary my-3 opacity-25" />
                <div class="text-center small text-secondary">
                    &copy; <%: DateTime.Now.Year %> James Benedict M. Esteban. All rights reserved.
                </div>
            </div>
        </footer>

    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script type="text/javascript">
        document.addEventListener("DOMContentLoaded", function () {
            var aosLib = window['AOS'];
            if (typeof aosLib !== 'undefined') {
                aosLib.init({ duration: 800, once: true });
            }
        });
    </script>
    <script src="Script/script.js"></script>
</body>
</html>