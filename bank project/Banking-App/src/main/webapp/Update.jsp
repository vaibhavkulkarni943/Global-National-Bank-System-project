<%@page import="com.bank.dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Global National Bank | Update Account</title>
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
            --error: #dc2626;
            --success: #16a34a;
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

        .update-container {
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
            padding: 2.5rem;
            max-width: 600px;
            margin: 2rem auto;
        }

        .update-header {
            text-align: center;
            margin-bottom: 2rem;
            position: relative;
        }

        .update-header i {
            font-size: 2.5rem;
            color: var(--primary);
            margin-bottom: 1rem;
        }

        .update-header h1 {
            font-size: 1.8rem;
            color: var(--dark);
            margin-bottom: 0.5rem;
        }

        .update-header p {
            color: #64748b;
            font-size: 0.9rem;
        }

        .form-floating .form-control {
            padding-left: 3rem;
        }

        .input-icon {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: #94a3b8;
            z-index: 5;
        }

        .btn-primary {
            background-color: var(--primary);
            border-color: var(--primary);
        }

        .btn-primary:hover {
            background-color: var(--primary-dark);
            border-color: var(--primary-dark);
        }

        footer {
            background-color: var(--dark);
            color: white;
            text-align: center;
            padding: 1.5rem;
            margin-top: auto;
        }

        /* Custom floating label animation */
        .form-floating label {
            padding-left: 3rem;
            transition: all 0.2s ease-in-out;
        }

        .form-floating > .form-control:focus ~ label,
        .form-floating > .form-control:not(:placeholder-shown) ~ label,
        .form-floating > .form-select ~ label {
            transform: scale(0.85) translateY(-0.8rem) translateX(-2.2rem);
            opacity: 0.8;
            color: var(--primary);
        }

        /* Modal styles */
        .modal-content {
            border-radius: 12px;
        }

        .modal-header {
            border-bottom: none;
        }

        .modal-footer {
            border-top: none;
        }

        .text-success {
            color: var(--success) !important;
        }

        .text-danger {
            color: var(--error) !important;
        }

        /* Responsive adjustments */
        @media (max-width: 576px) {
            .update-container {
                padding: 1.5rem;
                margin: 1rem;
            }
            
            .update-header h1 {
                font-size: 1.5rem;
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

    <!-- Main Content -->
    <div class="container my-4">
        <div class="update-container">
            <div class="update-header">
                <i class="fas fa-user-edit"></i>
                <h1>Update Account Details</h1>
                <p>Keep your information up to date for better banking experience</p>
            </div>

            <!-- Message -->
            <% String Fail = (String) request.getAttribute("Fail"); %>
            <% if (Fail != null) { %>
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <%= Fail %>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <% request.removeAttribute("Fail"); %>
            <% } %>

            <% Customer c = (Customer) session.getAttribute("uses"); %>
            <% if (c != null) { %>
                <form class="password-holder" action="New" method="post">
                    <div class="form-floating mb-4 position-relative">
                        <i class="fas fa-user input-icon"></i>
                        <input type="text" class="form-control" id="name" name="name" 
                               placeholder="Name" value="<%= c.getName() %>" required>
                        <label for="name">Full Name</label>
                    </div>

                    <div class="form-floating mb-4 position-relative">
                        <i class="fas fa-mobile-alt input-icon"></i>
                        <input type="tel" class="form-control onlyNumbers" id="phone" name="phone" 
                               placeholder="Phone" value="<%= c.getPhone() %>" required
                               maxlength="10" minlength="10">
                        <label for="phone">Phone Number</label>
                        <div class="invalid-feedback">Please enter a valid 10-digit phone number</div>
                    </div>

                    <div class="form-floating mb-4 position-relative">
                        <i class="fas fa-envelope input-icon"></i>
                        <input type="email" class="form-control" id="email" name="mail" 
                               placeholder="Email" value="<%= c.getMail() %>" required>
                        <label for="email">Email Address</label>
                        <div class="invalid-feedback">Please enter a valid email address</div>
                    </div>

                    <div class="d-grid">
                        <button type="submit" class="btn btn-primary btn-lg">
                            <i class="fas fa-save me-2"></i> Update Account
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

    <!-- Session Check -->
    <% if (c == null) { %>
        <% session.setAttribute("Failed", "Session Expired"); %>
        <% response.sendRedirect("Login.jsp"); %>
    <% } %>

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Number-only input validation
        document.querySelectorAll(".onlyNumbers").forEach(input => {
            input.addEventListener("input", function() {
                this.value = this.value.replace(/[^0-9]/g, "");
            });
        });

        // Form validation
        (function() {
            'use strict'
            
            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            const forms = document.querySelectorAll('.needs-validation')
            
            // Loop over them and prevent submission
            Array.from(forms).forEach(form => {
                form.addEventListener('submit', event => {
                    if (!form.checkValidity()) {
                        event.preventDefault()
                        event.stopPropagation()
                    }
                    
                    form.classList.add('was-validated')
                }, false)
            })
        })();

        // Show modal if there are messages
        <% if (Fail != null) { %>
            document.addEventListener('DOMContentLoaded', function() {
                var alert = new bootstrap.Alert(document.querySelector('.alert'));
            });
        <% } %>
    </script>
</body>
</html>