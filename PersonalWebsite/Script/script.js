document.addEventListener("DOMContentLoaded", function () {

    // 1. TYPING EFFECT FOR HERO SECTION
    const roles = [
        "Front-End Developer",
        "ASP.NET & C# Developer",
        "Java Programmer",
        "UI/UX Enthusiast"
    ];
    let roleIndex = 0;
    let charIndex = 0;
    let isDeleting = false;
    const typingElement = document.getElementById("typing-text");

    function typeEffect() {
        if (!typingElement) return;

        const currentRole = roles[roleIndex];

        if (isDeleting) {
            typingElement.textContent = currentRole.substring(0, charIndex - 1);
            charIndex--;
        } else {
            typingElement.textContent = currentRole.substring(0, charIndex + 1);
            charIndex++;
        }

        let typeSpeed = isDeleting ? 50 : 100;

        if (!isDeleting && charIndex === currentRole.length) {
            typeSpeed = 2000;
            isDeleting = true;
        } else if (isDeleting && charIndex === 0) {
            isDeleting = false;
            roleIndex = (roleIndex + 1) % roles.length;
            typeSpeed = 500;
        }

        setTimeout(typeEffect, typeSpeed);
    }

    typeEffect();


    // 2. ACTIVE NAVBAR LINK ON SCROLL & AUTO-CLOSE MOBILE MENU
    const sections = document.querySelectorAll("section");
    const navLinks = document.querySelectorAll(".navbar-nav .nav-link[href^='#']");
    const navbarCollapse = document.getElementById("navbarNav");

    if (sections.length > 0 && navLinks.length > 0) {
        window.addEventListener("scroll", () => {
            let current = "";
            sections.forEach(section => {
                const sectionTop = section.offsetTop - 120;
                if (window.pageYOffset >= sectionTop) {
                    current = section.getAttribute("id");
                }
            });

            navLinks.forEach(link => {
                link.classList.remove("active-nav");
                if (link.getAttribute("href") === `#${current}`) {
                    link.classList.add("active-nav");
                }
            });
        });
    }

    navLinks.forEach(link => {
        link.addEventListener("click", () => {
            if (navbarCollapse && navbarCollapse.classList.contains("show")) {
                var bsCollapse = bootstrap.Collapse.getInstance(navbarCollapse);
                if (!bsCollapse) {
                    bsCollapse = new bootstrap.Collapse(navbarCollapse, { toggle: false });
                }
                bsCollapse.hide();
            }
        });
    });


    // 3. AUTO-CLEANUP FOR BOOTSTRAP MODAL BACKDROP AFTER POSTBACK
    const modals = document.querySelectorAll('.modal');
    modals.forEach(function (m) {
        if (typeof bootstrap !== 'undefined' && bootstrap.Modal) {
            var modalInstance = bootstrap.Modal.getInstance(m);
            if (modalInstance) {
                modalInstance.hide();
            }
        }
    });

    const backdrops = document.querySelectorAll('.modal-backdrop');
    backdrops.forEach(function (b) { b.remove(); });
    document.body.classList.remove('modal-open');
    document.body.style.overflow = '';
    document.body.style.paddingRight = '';
});