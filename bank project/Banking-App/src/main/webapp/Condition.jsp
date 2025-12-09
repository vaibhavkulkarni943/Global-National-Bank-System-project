<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Global National Bank | Terms & Conditions</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #2563eb;
            --primary-dark: #1d4ed8;
            --secondary: #059669;
            --dark: #1e293b;
            --light: #f8fafc;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f0f4f8;
            color: var(--dark);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .navbar {
            background-color: white;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .logo img {
            height: 40px;
        }

        .logo-text {
            font-weight: 700;
            font-size: 1.5rem;
            background: linear-gradient(to right, var(--primary), var(--secondary));
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
        }

        .terms-container {
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
            padding: 2.5rem;
            margin: 2rem auto;
            max-width: 900px;
        }

        .terms-header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .terms-header h1 {
            font-size: 2rem;
            color: var(--primary);
            margin-bottom: 1rem;
        }

        .terms-header p {
            color: #64748b;
            font-size: 1rem;
        }

        .terms-content h2 {
            font-size: 1.5rem;
            color: var(--dark);
            margin-top: 2rem;
            margin-bottom: 1rem;
            padding-bottom: 0.5rem;
            border-bottom: 2px solid #e2e8f0;
        }

        .terms-content h3 {
            font-size: 1.2rem;
            color: var(--dark);
            margin-top: 1.5rem;
            margin-bottom: 0.75rem;
        }

        .terms-content p {
            margin-bottom: 1rem;
            line-height: 1.6;
        }

        .terms-content ul, .terms-content ol {
            margin-bottom: 1.5rem;
            padding-left: 1.5rem;
        }

        .terms-content li {
            margin-bottom: 0.5rem;
        }

        .btn-primary {
            background-color: var(--primary);
            border-color: var(--primary);
        }

        .btn-primary:hover {
            background-color: var(--primary-dark);
            border-color: var(--primary-dark);
        }

        .btn-outline-primary {
            color: var(--primary);
            border-color: var(--primary);
        }

        .btn-outline-primary:hover {
            background-color: var(--primary);
            border-color: var(--primary);
        }

        #backToTop {
            position: fixed;
            bottom: 20px;
            right: 20px;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background-color: var(--primary);
            color: white;
            border: none;
            display: none;
            align-items: center;
            justify-content: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            z-index: 99;
        }

        #backToTop:hover {
            background-color: var(--primary-dark);
        }

        footer {
            background-color: var(--dark);
            color: white;
            text-align: center;
            padding: 1.5rem;
            margin-top: auto;
        }

        @media (max-width: 768px) {
            .terms-container {
                padding: 1.5rem;
                margin: 1rem;
            }
            
            .terms-header h1 {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <!-- Navbar -->
  <%@ include file="navbar.jsp" %>
    <!-- Main Content -->
    <div class="container my-4">
        <div class="terms-container">
            <div class="terms-header">
                <h1><i class="fas fa-file-contract me-2"></i> Terms & Conditions</h1>
                <p>Last updated: March 9, 2025</p>
            </div>

            <div class="terms-content">
                <p>Welcome to Global National Bank! Please read these Terms and Conditions carefully before using our banking services, including our website and mobile app. By accessing or using our services, you agree to be bound by these Terms and Conditions.</p>

                <h2><i class="fas fa-piggy-bank me-2"></i> 1. Account Services</h2>
                <p>These terms govern your use of Global National Bank accounts, including checking, savings, and loan accounts.</p>
                <ul>
                    <li><i class="fas fa-check-circle text-success me-2"></i> Account opening and maintenance</li>
                    <li><i class="fas fa-check-circle text-success me-2"></i> Deposits and withdrawals</li>
                    <li><i class="fas fa-check-circle text-success me-2"></i> Electronic fund transfers</li>
                    <li><i class="fas fa-check-circle text-success me-2"></i> Statements and transaction history</li>
                    <li><i class="fas fa-check-circle text-success me-2"></i> Fees and charges</li>
                    <li><i class="fas fa-check-circle text-success me-2"></i> Account closure</li>
                </ul>

                <h2><i class="fas fa-mobile-alt me-2"></i> 2. Online and Mobile Banking</h2>
                <p>By using our online and mobile banking services, you agree to the following:</p>
                <ul>
                    <li>Maintaining the confidentiality of your login credentials</li>
                    <li>Responsibility for all transactions conducted through your account</li>
                    <li>Compliance with security measures</li>
                    <li>Acceptance of electronic communication</li>
                </ul>

                <h2><i class="fas fa-hand-holding-usd me-2"></i> 3. Loan Services</h2>
                <p>If you apply for or obtain a loan from Global National Bank, additional terms will apply.</p>
                <ul>
                    <li>Loan applications and approvals</li>
                    <li>Repayment terms and schedules</li>
                    <li>Interest rates and fees</li>
                    <li>Default and collection procedures</li>
                </ul>

                <h2><i class="fas fa-credit-card me-2"></i> 4. Card Services</h2>
                <p>These terms govern your use of Global National Bank debit cards, credit cards, and other payment cards.</p>
                <ul>
                    <li>Card issuance and activation</li>
                    <li>Authorized card use</li>
                    <li>Liability for unauthorized transactions</li>
                    <li>Cardholder responsibilities</li>
                </ul>

                <h2><i class="fas fa-shield-alt me-2"></i> 5. Privacy and Security</h2>
                <p>We are committed to protecting your privacy and the security of your financial information. Our <a href="#" class="text-primary">Privacy Policy</a> explains how we collect, use, and share your information.</p>

                <h2><i class="fas fa-copyright me-2"></i> 6. Intellectual Property</h2>
                <p>All content on our website and mobile app, including logos, trademarks, and software, is the property of Global National Bank.</p>

                <h2><i class="fas fa-exclamation-triangle me-2"></i> 7. Disclaimer</h2>
                <p>Our services are provided "as is" without any warranties, express or implied. We do not guarantee uninterrupted or error-free service.</p>

                <h2><i class="fas fa-balance-scale me-2"></i> 8. Limitation of Liability</h2>
                <p>Global National Bank will not be liable for any indirect, incidental, special, or consequential damages arising from your use of our services.</p>

                <h2><i class="fas fa-gavel me-2"></i> 9. Governing Law</h2>
                <p>These Terms and Conditions are governed by the laws of India.</p>

                <h2><i class="fas fa-sync-alt me-2"></i> 10. Changes to these Terms</h2>
                <p>We may update these Terms and Conditions from time to time. Notice of changes will be provided as required by law.</p>

                <h2><i class="fas fa-headset me-2"></i> 11. Contact Us</h2>
                <p>If you have any questions, please contact us at:</p>
                <ul>
                    <li><i class="fas fa-phone me-2"></i> +1 (800) 123-4567</li>
                    <li><i class="fas fa-envelope me-2"></i> support@globalnational.com</li>
                    <li><i class="fas fa-map-marker-alt me-2"></i> 123 Banking Street, Financial District, Mumbai, India</li>
                </ul>

                <div class="d-flex justify-content-between mt-5">
                    <a href="Signup.jsp" class="btn btn-outline-primary">
                        <i class="fas fa-arrow-left me-1"></i> Back to Sign Up
                    </a>
                    <button class="btn btn-primary" onclick="window.scrollTo({top: 0, behavior: 'smooth'})">
                        <i class="fas fa-arrow-up me-1"></i> Back to Top
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <%@ include file="footer.jsp" %> 
    <!-- Back to Top Button -->
    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Back to top button
        window.onscroll = function() {
            const backToTopButton = document.getElementById("backToTop");
            if (document.body.scrollTop > 200 || document.documentElement.scrollTop > 200) {
                backToTopButton.style.display = "flex";
            } else {
                backToTopButton.style.display = "none";
            }
        };

        // Smooth scrolling for anchor links
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                document.querySelector(this.getAttribute('href')).scrollIntoView({
                    behavior: 'smooth'
                });
            });
        });
    </script>
</body>
</html>