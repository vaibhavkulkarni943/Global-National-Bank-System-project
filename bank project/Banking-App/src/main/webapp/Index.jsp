<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Global National Bank | Digital Banking</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #2563eb;
            --primary-dark: #1d4ed8;
            --secondary: #059669;
            --dark: #1e293b;
            --light: #f8fafc;
            --gold: #d4af37;
            --error: #dc2626;
            --success: #16a34a;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f0f4f8;
            color: var(--dark);
            line-height: 1.6;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .main-content {
            flex: 1;
            display: flex;
            align-items: center;
            padding: 2rem 5%;
            position: relative;
            overflow: hidden;
        }

        .hero {
            max-width: 1200px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 3rem;
            align-items: center;
        }

        .hero-content {
            z-index: 2;
        }

        .hero-title {
            font-size: 3rem;
            font-weight: 700;
            margin-bottom: 1.5rem;
            line-height: 1.2;
            color: var(--dark);
        }

        .hero-title span {
            color: var(--primary);
        }

        .hero-subtitle {
            font-size: 1.1rem;
            color: #64748b;
            margin-bottom: 2rem;
            max-width: 90%;
        }

        .action-buttons {
            display: flex;
            gap: 1rem;
            margin-bottom: 2rem;
        }

        .btn {
            padding: 0.8rem 1.5rem;
            border-radius: 50px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            text-decoration: none;
            border: none;
            font-size: 1rem;
        }

        .btn-primary {
            background-color: var(--primary);
            color: white;
        }

        .btn-primary:hover {
            background-color: var(--primary-dark);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(37, 99, 235, 0.3);
        }

        .btn-outline {
            background-color: transparent;
            color: var(--primary);
            border: 2px solid var(--primary);
        }

        .btn-outline:hover {
            background-color: rgba(37, 99, 235, 0.1);
            transform: translateY(-2px);
        }

        .features {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
            margin-top: 3rem;
        }

        .feature-card {
            background: white;
            padding: 1.5rem;
            border-radius: 12px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .feature-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }

        .feature-icon {
            font-size: 1.75rem;
            color: var(--primary);
            margin-bottom: 1rem;
        }

        .feature-title {
            font-weight: 600;
            margin-bottom: 0.5rem;
        }

        .feature-desc {
            color: #64748b;
            font-size: 0.9rem;
        }

        .hero-image {
            position: relative;
            z-index: 1;
        }

        .hero-image img {
            width: 100%;
            border-radius: 12px;
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1);
        }

        .shape {
            position: absolute;
            z-index: 0;
            opacity: 0.1;
        }

        .shape-1 {
            width: 300px;
            height: 300px;
            background: var(--primary);
            border-radius: 30% 70% 70% 30% / 30% 30% 70% 70%;
            top: 10%;
            left: -10%;
            animation: float 8s ease-in-out infinite;
        }

        .shape-2 {
            width: 200px;
            height: 200px;
            background: var(--secondary);
            border-radius: 60% 40% 30% 70% / 60% 30% 70% 40%;
            bottom: 10%;
            right: -5%;
            animation: float 6s ease-in-out infinite;
        }

        @keyframes float {
            0% {
                transform: translateY(0) rotate(0deg);
            }
            50% {
                transform: translateY(-20px) rotate(5deg);
            }
            100% {
                transform: translateY(0) rotate(0deg);
            }
        }


        @media (max-width: 768px) {
            .hero {
                grid-template-columns: 1fr;
                text-align: center;
            }
            
            .hero-subtitle {
                max-width: 100%;
                margin-left: auto;
                margin-right: auto;
            }
            
            .action-buttons {
                justify-content: center;
            }
            
            .nav-links {
                display: none;
            }
            
            .features {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
  <%@ include file="navbar.jsp" %>
    <div class="main-content">
        <div class="shape shape-1"></div>
        <div class="shape shape-2"></div>
        
        <div class="hero">
            <div class="hero-content">
                <h1 class="hero-title">Banking Made <span>Simple</span> & Secure</h1>
                <p class="hero-subtitle">Experience the future of digital banking with our cutting-edge platform designed for your financial success and peace of mind.</p>
                
                <div class="action-buttons">
                    <a href="Login.jsp" class="btn btn-primary">
                        <i class="fas fa-sign-in-alt"></i> Customer Login
                    </a>
                    <a href="Signup.jsp" class="btn btn-outline">
                        <i class="fas fa-user-plus"></i> Open Account
                    </a>
                </div>
                
                <div class="features">
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="fas fa-shield-alt"></i>
                        </div>
                        <h3 class="feature-title">Advanced Security</h3>
                        <p class="feature-desc">Military-grade encryption and multi-factor authentication to protect your assets.</p>
                    </div>
                    
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="fas fa-bolt"></i>
                        </div>
                        <h3 class="feature-title">Instant Transfers</h3>
                        <p class="feature-desc">Send and receive money in seconds, 24/7 with no hidden fees.</p>
                    </div>
                    
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="fas fa-headset"></i>
                        </div>
                        <h3 class="feature-title">24/7 Support</h3>
                        <p class="feature-desc">Our dedicated team is always ready to assist you with any questions.</p>
                    </div>
                </div>
            </div>
            
            <div class="hero-image">
                <img src="https://img.freepik.com/free-vector/mobile-banking-abstract-concept-illustration_335657-2167.jpg" alt="Digital Banking">
            </div>
        </div>
    </div>

       <%@ include file="footer.jsp" %> 

    <script>
        function exitApp() {
            if (confirm("Are you sure you want to exit?")) {
                alert("Thank you for visiting Global National Bank. Have a great day!");
            }
        }
    </script>
</body>
</html>