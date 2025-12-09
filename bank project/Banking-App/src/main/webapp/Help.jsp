<%@page import="com.bank.dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Global National Bank | Contact Us</title>
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

        .contact-container {
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
            padding: 2.5rem;
            max-width: 600px;
            margin: 2rem auto;
        }

        .contact-header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .contact-header i {
            font-size: 2.5rem;
            color: var(--primary);
            margin-bottom: 1rem;
        }

        .contact-header h1 {
            font-size: 1.8rem;
            color: var(--dark);
            margin-bottom: 0.5rem;
        }

        .contact-header p {
            color: #64748b;
            font-size: 0.9rem;
        }

        .user-info {
            background-color: #f8f9fa;
            border-radius: 8px;
            padding: 1.5rem;
            margin-bottom: 1.5rem;
        }

        .info-item {
            display: flex;
            align-items: center;
            margin-bottom: 0.5rem;
        }

        .info-item i {
            color: var(--primary);
            margin-right: 0.5rem;
            width: 20px;
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

        footer {
            background-color: var(--dark);
            color: white;
            text-align: center;
            padding: 1.5rem;
            margin-top: auto;
        }

        /* Alert message styling */
        .alert-message {
            position: fixed;
            top: 80px;
            right: 20px;
            z-index: 1000;
            max-width: 400px;
            animation: slideIn 0.5s, fadeOut 0.5s 4.5s;
        }

        @keyframes slideIn {
            from { transform: translateX(100%); }
            to { transform: translateX(0); }
        }

        @keyframes fadeOut {
            from { opacity: 1; }
            to { opacity: 0; }
        }

        /* Responsive adjustments */
        @media (max-width: 576px) {
            .contact-container {
                padding: 1.5rem;
                margin: 1rem;
            }
            
            .contact-header h1 {
                font-size: 1.5rem;
            }
            
            .alert-message {
                max-width: 90%;
                left: 5%;
                right: 5%;
            }
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container">
            <a class="navbar-brand logo" href="#">
                <img src="https://cdn-icons-png.flaticon.com/512/477/477103.png" alt="Bank Logo">
                <span class="logo-text">Global National</span>
            </a>
            <div class="d-flex align-items-center">
                <a href="User.jsp" class="btn btn-outline-primary">
                    <i class="fas fa-arrow-left me-1"></i> Back to Dashboard
                </a>
            </div>
        </div>
    </nav>

    <!-- Display success/error messages -->
    <% if (request.getAttribute("Success") != null) { %>
        <div class="alert alert-success alert-dismissible fade show alert-message" role="alert">
            <i class="fas fa-check-circle me-2"></i> <%= request.getAttribute("Success") %>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    <% } %>
    
    <% if (request.getAttribute("Error") != null) { %>
        <div class="alert alert-danger alert-dismissible fade show alert-message" role="alert">
            <i class="fas fa-exclamation-circle me-2"></i> <%= request.getAttribute("Error") %>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    <% } %>

    <!-- Main Content -->
    <div class="container my-4">
        <div class="contact-container">
            <div class="contact-header">
                <i class="fas fa-headset"></i>
                <h1>Contact Customer Support</h1>
                <p>We're here to help you with any questions or concerns</p>
            </div>

            <% Customer c = (Customer) session.getAttribute("uses"); %>
            <% if (c != null) { %>
                <div class="user-info">
                    <h6 class="mb-3">Your Information</h6>
                    <div class="info-item">
                        <i class="fas fa-user"></i>
                        <span><%= c.getName() %></span>
                    </div>
                    <div class="info-item">
                        <i class="fas fa-envelope"></i>
                        <span><%= c.getMail() %></span>
                    </div>
                    <div class="info-item">
                        <i class="fas fa-phone"></i>
                        <span>••••••••<%= String.valueOf(c.getPhone()).substring(Math.max(0, String.valueOf(c.getPhone()).length() - 2)) %></span>
                    </div>
                    <div class="info-item">
                        <i class="fas fa-id-card"></i>
                        <span>Account: ••••<%= String.valueOf(c.getACC_NO()).substring(Math.max(0, String.valueOf(c.getACC_NO()).length() - 4)) %></span>
                    </div>
                </div>

                <form id="contact-form" action="ContactSubmit" method="post">
                    <!-- Hidden fields with actual values -->
                    <input type="hidden" name="name" value="<%= c.getName() %>">
                    <input type="hidden" name="email" value="<%= c.getMail() %>">
                    <input type="hidden" name="phone" value="<%= c.getPhone() %>">
                    
                    <div class="mb-3">
                        <label for="subject" class="form-label">Subject</label>
                        <select class="form-select" id="subject" name="subject" required>
                            <option value="" selected disabled>Select a subject</option>
                            <option value="Account Inquiry">Account Inquiry</option>
                            <option value="Transaction Issue">Transaction Issue</option>
                            <option value="Card Problem">Card Problem</option>
                            <option value="Loan Information">Loan Information</option>
                            <option value="Other">Other</option>
                        </select>
                    </div>
                    
                    <div class="mb-3">
                        <label for="description" class="form-label">Description</label>
                        <textarea class="form-control" id="description" name="description" rows="5" 
                                  placeholder="Please describe your issue in detail..." required></textarea>
                    </div>
                    
                    <div class="d-flex justify-content-between">
                        <a href="User.jsp" class="btn btn-outline-primary">
                            <i class="fas fa-arrow-left me-1"></i> Cancel
                        </a>
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-paper-plane me-1"></i> Submit Request
                        </button>
                    </div>
                </form>
            <% } %>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer mt-auto">
        <div class="container">
            <p class="mb-0">By using this WebSite, you accept cookies. &copy; 2025 Global National Bank. All rights reserved.</p>
        </div>
    </footer>

    <% if (c == null) { %>
        <% session.setAttribute("Failed", "Session Expired"); %>
        <% response.sendRedirect("Login.jsp"); %>
    <% } %>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Auto-close alerts after 5 seconds
        document.addEventListener('DOMContentLoaded', function() {
            var alerts = document.querySelectorAll('.alert');
            alerts.forEach(function(alert) {
                setTimeout(function() {
                    var bsAlert = new bootstrap.Alert(alert);
                    bsAlert.close();
                }, 5000);
            });
        });
    </script>
</body>
</html>