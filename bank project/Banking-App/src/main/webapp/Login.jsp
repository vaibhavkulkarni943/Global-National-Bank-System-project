<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Global National Bank | Login</title>
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
            font-family: 'Poppins', sans-serif;
        }

        body {
            background-color: #f0f4f8;
            color: var(--dark);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .navbar {
            background-color: white;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 1rem 5%;
            display: flex;
            justify-content: space-between;
            align-items: center;
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

        .main-content {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 2rem;
        }

        .login-container {
            background: white;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
            width: 100%;
            max-width: 500px;
            padding: 2.5rem;
            position: relative;
            overflow: hidden;
        }

        .login-header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .login-header i {
            font-size: 3rem;
            color: var(--primary);
            margin-bottom: 1rem;
        }

        .login-header h1 {
            font-size: 1.8rem;
            color: var(--dark);
            margin-bottom: 0.5rem;
        }

        .login-header p {
            color: #64748b;
            font-size: 0.9rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
            position: relative;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: var(--dark);
        }

        .input-field {
            position: relative;
        }

        .input-field i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #94a3b8;
        }

        .input-field input {
            width: 100%;
            padding: 12px 15px 12px 45px;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            font-size: 1rem;
            transition: all 0.3s;
        }

        .input-field input:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1);
        }

        .error-message {
            color: var(--error);
            font-size: 0.8rem;
            margin-top: 0.3rem;
            display: none;
        }

        .forgot-pin {
            text-align: right;
            margin: 1rem 0;
        }

        .forgot-pin a {
            color: var(--primary);
            text-decoration: none;
            font-size: 0.9rem;
        }

        .forgot-pin a:hover {
            text-decoration: underline;
        }

        .btn {
            width: 100%;
            padding: 12px;
            border-radius: 8px;
            font-weight: 500;
            font-size: 1rem;
            cursor: pointer;
            transition: all 0.3s;
            border: none;
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

        .divider {
            display: flex;
            align-items: center;
            margin: 1.5rem 0;
            color: #64748b;
            font-size: 0.9rem;
        }

        .divider::before,
        .divider::after {
            content: "";
            flex: 1;
            height: 1px;
            background: #e2e8f0;
            margin: 0 10px;
        }

        .signup-link {
            text-align: center;
            color: #64748b;
            font-size: 0.9rem;
        }

        .signup-link a {
            color: var(--primary);
            text-decoration: none;
            font-weight: 500;
        }

        .signup-link a:hover {
            text-decoration: underline;
        }
        .success-message {
    background-color: #f0fff4;
    border: 1px solid #c6f6d5;
    border-radius: 8px;
    padding: 1rem;
    margin-bottom: 1.5rem;
    text-align: center;
    color: #22543d;
}

.success-message i {
    color: #38a169;
    font-size: 2rem;
    margin-bottom: 0.5rem;
}

.success-message h3 {
    margin-bottom: 0.5rem;
}

.success-message p {
    margin-bottom: 0.3rem;
    font-size: 0.9rem;
}

.success-message strong {
    font-size: 1.1rem;
    color: var(--dark);
}

        .failed-message {
            color: var(--error);
            text-align: center;
            margin-bottom: 1.5rem;
            font-weight: 500;
        }

        footer {
            background-color: var(--dark);
            color: white;
            text-align: center;
            padding: 1.5rem;
            font-size: 0.9rem;
        }

        @media (max-width: 576px) {
            .login-container {
                padding: 1.5rem;
            }
            
            .login-header h1 {
                font-size: 1.5rem;
            }
            
            .nav-links {
                gap: 1rem;
            }
        }
    </style>
</head>
<body>
    <%@ include file="navbar.jsp" %>

    <div class="main-content">
        <div class="login-container">
            <div class="login-header">
                <i class="fas fa-unlock-alt"></i>
                <h1>Welcome Back</h1>
                <p>Sign in to access your Global National Bank account</p>
            </div>
<%
String successMessage = (String) session.getAttribute("Success");
Long newAccountNumber = (Long) session.getAttribute("NewAccountNumber");

if (successMessage != null) {
    session.removeAttribute("Success");
    session.removeAttribute("NewAccountNumber");
%>
    <div class="success-message">
        <i class="fas fa-check-circle"></i>
        <h3><%= successMessage %></h3>
        <% if (newAccountNumber != null) { %>
            <p>Your account number is: <strong><%= newAccountNumber %></strong></p>
            <p>Please login with your account number and PIN.</p>
        <% } %>
    </div>
<%
}
%>
            <form class="login-form" action="Login" method="post" id="loginForm">
                <div class="form-group">
                    <label for="account">Account Number</label>
                    <div class="input-field">
                        <i class="fas fa-user"></i>
                        <input type="text" id="account" name="acc" class="onlyNumbers" required maxlength="12">
                    </div>
                    <div class="error-message" id="accountError">Please enter a valid account number</div>
                </div>

                <div class="form-group">
                    <label for="pin">PIN</label>
                    <div class="input-field">
                        <i class="fas fa-lock"></i>
                        <input type="password" id="pin" name="pin" class="onlyNumbers" required maxlength="6">
                    </div>
                    <div class="error-message" id="pinError">PIN must be 4-6 digits</div>
                </div>

                <div class="forgot-pin">
                    <a href="Forget.jsp">Forgot your PIN?</a>
                </div>

                <button type="submit" class="btn btn-primary">Log In</button>

                <div class="divider">New to Global National?</div>

                <div class="signup-link">
                    Don't have an account? <a href="Signup.jsp">Sign up</a>
                </div>
            </form>
        </div>
    </div>

    <%@ include file="footer.jsp" %>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Number-only input validation
            document.querySelectorAll(".onlyNumbers").forEach(input => {
                input.addEventListener("input", function() {
                    this.value = this.value.replace(/[^0-9]/g, "");
                });
            });

            // Form validation
            const form = document.getElementById('loginForm');
            
            form.addEventListener('submit', function(event) {
                let isValid = true;
                
                // Validate account number
                const account = document.getElementById('account');
                const accountError = document.getElementById('accountError');
                if (account.value.trim() === '' || account.value.length < 8) {
                    accountError.style.display = 'block';
                    isValid = false;
                } else {
                    accountError.style.display = 'none';
                }
                
                // Validate PIN
                const pin = document.getElementById('pin');
                const pinError = document.getElementById('pinError');
                if (pin.value.trim() === '' || pin.value.length < 4) {
                    pinError.style.display = 'block';
                    isValid = false;
                } else {
                    pinError.style.display = 'none';
                }
                
                if (!isValid) {
                    event.preventDefault();
                }
            });
        });
    </script>
</body>
</html>