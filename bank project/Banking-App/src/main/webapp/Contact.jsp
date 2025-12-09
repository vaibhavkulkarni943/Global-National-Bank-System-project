<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Global National Bank | Contact Us</title>
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

        .contact-container {
            flex: 1;
            padding: 3rem 0;
        }

        .contact-header {
            text-align: center;
            margin-bottom: 3rem;
        }

        .contact-header h1 {
            font-size: 2.5rem;
            color: var(--primary);
            margin-bottom: 1rem;
        }

        .contact-header p {
            color: #64748b;
            font-size: 1.1rem;
            max-width: 700px;
            margin: 0 auto;
        }

        .contact-content {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 1rem;
        }

        .contact-info {
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 2rem;
        }

        .contact-info h2 {
            font-size: 1.5rem;
            margin-bottom: 1.5rem;
            color: var(--dark);
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .contact-info h2 i {
            color: var(--primary);
        }

        .info-item {
            display: flex;
            align-items: flex-start;
            margin-bottom: 1.5rem;
            gap: 1rem;
        }

        .info-item i {
            color: var(--primary);
            font-size: 1.2rem;
            margin-top: 0.2rem;
        }

        .info-content h4 {
            font-size: 1.1rem;
            margin-bottom: 0.25rem;
            color: var(--dark);
        }

        .info-content p, .info-content a {
            color: #64748b;
            margin-bottom: 0;
            line-height: 1.6;
            text-decoration: none;
        }

        .info-content a:hover {
            color: var(--primary);
            text-decoration: underline;
        }

        .contact-form {
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 2rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: var(--dark);
        }

        .form-group input,
        .form-group textarea,
        .form-group select {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            font-family: 'Poppins', sans-serif;
            transition: border-color 0.3s;
        }

        .form-group input:focus,
        .form-group textarea:focus,
        .form-group select:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1);
        }

        .form-group textarea {
            min-height: 150px;
            resize: vertical;
        }

        .btn-primary {
            background-color: var(--primary);
            border-color: var(--primary);
            padding: 0.75rem 1.5rem;
            font-weight: 500;
            transition: all 0.3s;
        }

        .btn-primary:hover {
            background-color: var(--primary-dark);
            border-color: var(--primary-dark);
            transform: translateY(-2px);
        }

        footer {
            background-color: var(--dark);
            color: white;
            text-align: center;
            padding: 1.5rem;
            margin-top: auto;
        }

        @media (max-width: 768px) {
            .contact-header h1 {
                font-size: 2rem;
            }
            
            .nav-links {
                gap: 1rem;
            }
        }

        @media (max-width: 576px) {
            .contact-header h1 {
                font-size: 1.7rem;
            }
            
            .contact-content {
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
                <a href="Products.jsp"><i class="fas fa-credit-card"></i> Products</a>
                <a href="#" class="active"><i class="fas fa-phone-alt"></i> Contact</a>
            </div>
        </div>
    </nav>

    <div class="contact-container">
        <div class="contact-header">
            <h1><i class="fas fa-headset me-2"></i> Contact Us</h1>
            <p>We're here to help you with any questions or concerns. Reach out to our team through any of these channels.</p>
        </div>

        <div class="contact-content">
            <div class="contact-info">
                <h2><i class="fas fa-map-marker-alt"></i> Our Locations</h2>
                
                <div class="info-item">
                    <i class="fas fa-building"></i>
                    <div class="info-content">
                        <h4>Headquarters</h4>
                        <p>123 Banking Street, Financial District, Mumbai, India 400001</p>
                    </div>
                </div>

                <div class="info-item">
                    <i class="fas fa-clock"></i>
                    <div class="info-content">
                        <h4>Working Hours</h4>
                        <p>Monday to Friday: 9:00 AM - 5:00 PM<br>
                        Saturday: 9:00 AM - 1:00 PM<br>
                        Sunday: Closed</p>
                    </div>
                </div>

                <h2><i class="fas fa-phone-volume"></i> Contact Methods</h2>
                
                <div class="info-item">
                    <i class="fas fa-phone"></i>
                    <div class="info-content">
                        <h4>Customer Service</h4>
                        <p><a href="tel:+18001234567">+1 (800) 123-4567</a></p>
                    </div>
                </div>

                <div class="info-item">
                    <i class="fas fa-envelope"></i>
                    <div class="info-content">
                        <h4>Email Support</h4>
                        <p><a href="mailto:support@globalnational.com">support@globalnational.com</a></p>
                    </div>
                </div>

                <div class="info-item">
                    <i class="fas fa-comment-dots"></i>
                    <div class="info-content">
                        <h4>Live Chat</h4>
                        <p>Available during working hours through our mobile app</p>
                    </div>
                </div>
            </div>

            <div class="contact-form">
                <h2><i class="fas fa-paper-plane"></i> Send Us a Message</h2>
                <form action="ContactSubmit" method="post">
                    <div class="form-group">
                        <label for="name">Full Name</label>
                        <input type="text" id="name" name="name" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="email">Email Address</label>
                        <input type="email" id="email" name="email" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="phone">Phone Number</label>
                        <input type="tel" id="phone" name="phone">
                    </div>
                    
                    <div class="form-group">
                        <label for="subject">Subject</label>
                        <select id="subject" name="subject" required>
                            <option value="" disabled selected>Select a subject</option>
                            <option value="Account Inquiry">Account Inquiry</option>
                            <option value="Loan Information">Loan Information</option>
                            <option value="Card Services">Card Services</option>
                            <option value="Technical Support">Technical Support</option>
                            <option value="Feedback">Feedback</option>
                            <option value="Other">Other</option>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label for="message">Message</label>
                        <textarea id="message" name="message" required></textarea>
                    </div>
                    
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-paper-plane me-1"></i> Send Message
                    </button>
                </form>
            </div>
        </div>
    </div>

      <%@ include file="footer.jsp" %> 

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>