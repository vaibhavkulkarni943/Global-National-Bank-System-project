<%@page import="com.bank.dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Global National Bank | Reset PIN</title>
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

        .reset-container {
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
            padding: 2.5rem;
            max-width: 600px;
            margin: 2rem auto;
        }

        .reset-header {
            text-align: center;
            margin-bottom: 2rem;
            position: relative;
        }

        .reset-header i {
            font-size: 2.5rem;
            color: var(--primary);
            margin-bottom: 1rem;
        }

        .reset-header h1 {
            font-size: 1.8rem;
            color: var(--dark);
            margin-bottom: 0.5rem;
        }

        .reset-header p {
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

        .verification-info {
            background-color: #f8f9fa;
            border-radius: 8px;
            padding: 1.5rem;
            margin-bottom: 1.5rem;
        }

        .verification-item {
            display: flex;
            align-items: center;
            margin-bottom: 0.5rem;
        }

        .verification-item i {
            color: var(--success);
            margin-right: 0.5rem;
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
            .reset-container {
                padding: 1.5rem;
                margin: 1rem;
            }
            
            .reset-header h1 {
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
        <div class="reset-container">
            <div class="reset-header">
                <i class="fas fa-key"></i>
                <h1>Reset Your PIN</h1>
                <p>Secure your account with a new PIN</p>
            </div>

            <!-- Message -->
            <% String Message = (String)request.getAttribute("Mismatch"); %>
            <% String Fal = (String)request.getAttribute("None"); %>
            <% String Failed = (String)request.getAttribute("Failed"); %>
            
            <% if (Message != null || Fal != null || Failed != null) { %>
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <% if(Message != null) { %>
                        <%= Message %>
                        <% request.removeAttribute("Mismatch"); %>
                    <% } else if(Fal != null) { %>
                        <%= Fal %>
                        <% request.removeAttribute("None"); %>
                    <% } else if(Failed != null) { %>
                        <%= Failed %>
                        <% request.removeAttribute("Failed"); %>
                    <% } %>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            <% } %>

            <% Customer c = (Customer) session.getAttribute("uses"); %>
            <% if (c != null) { %>
                <div class="verification-info mb-4">
                    <h6 class="mb-3">Verification Information</h6>
                    <div class="verification-item">
                        <i class="fas fa-check-circle"></i>
                        <span>Logged in as: <%= c.getName() %></span>
                    </div>
                    <div class="verification-item">
                        <i class="fas fa-check-circle"></i>
                        <span>Account: ••••<%= String.valueOf(c.getACC_NO()).substring(Math.max(0, String.valueOf(c.getACC_NO()).length() - 4)) %></span>
                    </div>
                </div>

                <form class="needs-validation" action="Reset" method="post" novalidate>
                    <!-- Hidden fields for verification (not editable) -->
                    <input type="hidden" name="phone" value="<%= c.getPhone() %>">
                    <input type="hidden" name="mail" value="<%= c.getMail() %>">
                    
                    <!-- Display-only fields for user confirmation -->
                    <div class="mb-3">
                        <label class="form-label">Registered Phone</label>
                        <div class="form-control bg-light">
                            <i class="fas fa-mobile-alt me-2"></i>
                            ••••••••<%= String.valueOf(c.getPhone()).substring(Math.max(0, String.valueOf(c.getPhone()).length() - 2)) %>
                        </div>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">Registered Email</label>
                        <div class="form-control bg-light">
                            <i class="fas fa-envelope me-2"></i>
                            <%= c.getMail().replaceAll("(^[^@]{3}|(?!^)\\G)[^@]", "$1*") %>
                        </div>
                    </div>

                    <div class="form-floating mb-4 position-relative">
                        <i class="fas fa-lock input-icon"></i>
                        <input type="password" class="form-control onlyNumbers" id="newPin" name="pin" 
                               placeholder="New PIN" required minlength="4" maxlength="6"
                               pattern="[0-9]*" inputmode="numeric">
                        <label for="newPin">New PIN (4-6 digits)</label>
                        <div class="invalid-feedback">Please enter a valid PIN (4-6 digits)</div>
                    </div>

                    <div class="form-floating mb-4 position-relative">
                        <i class="fas fa-lock input-icon"></i>
                        <input type="password" class="form-control onlyNumbers" id="confirmPin" name="conform-pin" 
                               placeholder="Confirm PIN" required minlength="4" maxlength="6"
                               pattern="[0-9]*" inputmode="numeric">
                        <label for="confirmPin">Confirm New PIN</label>
                        <div class="invalid-feedback">PINs must match</div>
                    </div>

                    <div class="d-grid">
                        <button type="submit" class="btn btn-primary btn-lg">
                            <i class="fas fa-sync-alt me-2"></i> Reset PIN
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
                
                // Validate PIN match in real-time
                if (this.id === 'newPin' || this.id === 'confirmPin') {
                    validatePinMatch();
                }
            });
        });

        // Validate PIN match
        function validatePinMatch() {
            const newPin = document.getElementById('newPin');
            const confirmPin = document.getElementById('confirmPin');
            
            if (newPin.value && confirmPin.value) {
                if (newPin.value !== confirmPin.value) {
                    confirmPin.setCustomValidity("PINs must match");
                } else {
                    confirmPin.setCustomValidity("");
                }
            }
        }

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
    </script>
</body>
</html>