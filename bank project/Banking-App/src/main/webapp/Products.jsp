<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Global National Bank | Products</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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

        .nav-links {
            display: flex;
            gap: 1.5rem;
        }

        .nav-links a {
            text-decoration: none;
            color: var(--dark);
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            transition: color 0.3s;
        }

        .nav-links a:hover {
            color: var(--primary);
        }

        .products-container {
            padding: 2rem 0;
            flex: 1;
        }

        .products-header {
            text-align: center;
            margin-bottom: 3rem;
        }

        .products-header h1 {
            font-size: 2.5rem;
            color: var(--primary);
            margin-bottom: 1rem;
        }

        .products-header p {
            color: #64748b;
            font-size: 1.1rem;
            max-width: 700px;
            margin: 0 auto;
        }

        .product-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 1rem;
        }

        .product-card {
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }

        .product-icon {
            background-color: var(--primary);
            color: white;
            font-size: 2rem;
            padding: 1.5rem;
            text-align: center;
        }

        .product-content {
            padding: 1.5rem;
        }

        .product-content h3 {
            font-size: 1.3rem;
            margin-bottom: 0.75rem;
            color: var(--dark);
        }

        .product-content p {
            color: #64748b;
            margin-bottom: 1.5rem;
            line-height: 1.6;
        }

        .product-link {
            display: inline-flex;
            align-items: center;
            color: var(--primary);
            font-weight: 500;
            text-decoration: none;
            transition: color 0.3s;
        }

        .product-link:hover {
            color: var(--primary-dark);
        }

        .product-link i {
            margin-left: 0.5rem;
            transition: transform 0.3s;
        }

        .product-link:hover i {
            transform: translateX(3px);
        }

        footer {
            background-color: var(--dark);
            color: white;
            text-align: center;
            padding: 1.5rem;
            margin-top: auto;
        }

        @media (max-width: 768px) {
            .products-header h1 {
                font-size: 2rem;
            }
            
            .nav-links {
                gap: 1rem;
            }
        }

        @media (max-width: 576px) {
            .products-header h1 {
                font-size: 1.7rem;
            }
            
            .product-cards {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container">
            <div class="logo">
                <img src="https://cdn-icons-png.flaticon.com/512/477/477103.png" alt="Bank Logo">
                <span class="logo-text">Global National</span>
            </div>
            <div class="nav-links">
                <a href="Index.jsp"><i class="fas fa-home"></i> Home</a>
                <a href="Condition.jsp"><i class="fas fa-university"></i> About</a>
                <a href="#" class="active"><i class="fas fa-credit-card"></i> Products</a>
                <a href="Contact.jsp"><i class="fas fa-phone-alt"></i> Contact</a>
            </div>
        </div>
    </nav>

    <div class="products-container">
        <div class="products-header">
            <h1><i class="fas fa-credit-card me-2"></i> Our Banking Products</h1>
            <p>Discover financial solutions designed to help you achieve your goals and secure your future</p>
        </div>

        <div class="product-cards">
            <!-- Personal Banking -->
            <div class="product-card">
                <div class="product-icon">
                    <i class="fas fa-user-tie"></i>
                </div>
                <div class="product-content">
                    <h3>Personal Banking</h3>
                    <p>Manage your everyday finances with our range of personal accounts, credit cards, and digital banking services.</p>
                    <a href="#" class="product-link">
                        Learn more <i class="fas fa-chevron-right"></i>
                    </a>
                </div>
            </div>

            <!-- Savings Accounts -->
            <div class="product-card">
                <div class="product-icon">
                    <i class="fas fa-piggy-bank"></i>
                </div>
                <div class="product-content">
                    <h3>Savings Accounts</h3>
                    <p>Grow your money with competitive interest rates and flexible saving options for all your financial goals.</p>
                    <a href="#" class="product-link">
                        Learn more <i class="fas fa-chevron-right"></i>
                    </a>
                </div>
            </div>

            <!-- Loans -->
            <div class="product-card">
                <div class="product-icon">
                    <i class="fas fa-hand-holding-usd"></i>
                </div>
                <div class="product-content">
                    <h3>Loans</h3>
                    <p>Personal, home, auto, and education loans with competitive rates and flexible repayment options.</p>
                    <a href="#" class="product-link">
                        Learn more <i class="fas fa-chevron-right"></i>
                    </a>
                </div>
            </div>

            <!-- Credit Cards -->
            <div class="product-card">
                <div class="product-icon">
                    <i class="fas fa-credit-card"></i>
                </div>
                <div class="product-content">
                    <h3>Credit Cards</h3>
                    <p>Rewards, cashback, and travel benefits with our range of credit cards to suit your lifestyle.</p>
                    <a href="#" class="product-link">
                        Learn more <i class="fas fa-chevron-right"></i>
                    </a>
                </div>
            </div>

            <!-- Investments -->
            <div class="product-card">
                <div class="product-icon">
                    <i class="fas fa-chart-line"></i>
                </div>
                <div class="product-content">
                    <h3>Investments</h3>
                    <p>Grow your wealth with our investment products including mutual funds, fixed deposits, and retirement plans.</p>
                    <a href="#" class="product-link">
                        Learn more <i class="fas fa-chevron-right"></i>
                    </a>
                </div>
            </div>

            <!-- Business Banking -->
            <div class="product-card">
                <div class="product-icon">
                    <i class="fas fa-briefcase"></i>
                </div>
                <div class="product-content">
                    <h3>Business Banking</h3>
                    <p>Tailored financial solutions for businesses of all sizes, from startups to established enterprises.</p>
                    <a href="#" class="product-link">
                        Learn more <i class="fas fa-chevron-right"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="footer.jsp" %> 

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>