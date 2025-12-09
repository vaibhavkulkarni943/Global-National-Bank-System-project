<%@page import="com.bank.dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Global National Bank | Deposit</title>
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

        .deposit-container {
            background: white;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
            width: 100%;
            max-width: 600px;
            padding: 2.5rem;
            position: relative;
            overflow: hidden;
        }

        .deposit-header {
            text-align: center;
            margin-bottom: 2rem;
            position: relative;
        }

        .deposit-header i {
            font-size: 2.5rem;
            color: var(--primary);
            margin-bottom: 1rem;
        }

        .deposit-header h1 {
            font-size: 1.8rem;
            color: var(--dark);
            margin-bottom: 0.5rem;
        }

        .deposit-header p {
            color: #64748b;
            font-size: 0.9rem;
        }

        .back-btn {
            position: absolute;
            top: 0;
            left: 0;
            color: var(--dark);
            font-size: 1.5rem;
            transition: color 0.3s;
        }

        .back-btn:hover {
            color: var(--primary);
        }

        .payment-methods {
            display: flex;
            gap: 1rem;
            margin-bottom: 1.5rem;
            border-bottom: 1px solid #e2e8f0;
            padding-bottom: 1.5rem;
        }

        .payment-tab {
            flex: 1;
            text-align: center;
            padding: 0.75rem;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s;
            border: 1px solid #e2e8f0;
        }

        .payment-tab.active {
            border-color: var(--primary);
            background-color: rgba(37, 99, 235, 0.1);
        }

        .payment-tab i {
            font-size: 1.5rem;
            margin-bottom: 0.5rem;
            color: var(--primary);
        }

        .payment-content {
            display: none;
        }

        .payment-content.active {
            display: block;
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

        .card-row {
            display: flex;
            gap: 1rem;
        }

        .card-row .form-group {
            flex: 1;
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

        footer {
            background-color: var(--dark);
            color: white;
            text-align: center;
            padding: 1.5rem;
            font-size: 0.9rem;
        }

        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 1000;
            justify-content: center;
            align-items: center;
        }

        .modal-content {
            background-color: white;
            padding: 2rem;
            border-radius: 8px;
            max-width: 400px;
            width: 90%;
            text-align: center;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .modal h3 {
            margin-bottom: 1.5rem;
        }

        .modal .failed {
            color: var(--error);
        }

        .modal button {
            padding: 8px 20px;
            border-radius: 6px;
            background-color: var(--primary);
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .modal button:hover {
            background-color: var(--primary-dark);
        }

        @media (max-width: 576px) {
            .deposit-container {
                padding: 1.5rem;
            }
            
            .deposit-header h1 {
                font-size: 1.5rem;
            }
            
            .payment-methods {
                flex-direction: column;
            }
            
            .card-row {
                flex-direction: column;
                gap: 0;
            }
        }
    </style>
</head>
<body>
    <nav class="navbar">
        <div class="logo">
            <img src="https://cdn-icons-png.flaticon.com/512/477/477103.png" alt="Bank Logo">
            <span class="logo-text">Global National</span>
        </div>
        <div class="nav-links">
            <a href="User.jsp"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
        </div>
    </nav>

    <!-- Message Handling -->
    <% String Message = (String)request.getAttribute("Error"); %>
    <% String Fal = (String)request.getAttribute("None"); %>
    
    <% if (Message != null || Fal != null) { %>
    <div class="modal" id="successModal">
        <div class="modal-content"> 
            <% if(Message != null) { %>
                <h3 class="failed"><%=Message%></h3>
                <br>
                <button class="fail" onclick="closeModal()">OK</button>
                <% request.removeAttribute("Error"); %>
            <% } %>
            
            <% if(Fal != null) { %>
                <h3 class="failed"><%=Fal%></h3>
                <br>
                <button class="fail" onclick="closeModal()">OK</button>
                <% request.removeAttribute("None"); %>
            <% } %>
        </div>
    </div>
    <% } %>
    
    <% Customer c = (Customer)session.getAttribute("uses"); %>
    <% if(c == null) { %>
        <% request.setAttribute("Failed", "Session Expired"); %>
        <% response.sendRedirect("Login.jsp"); %>
    <% } else { %>
        <div class="main-content">
            <div class="deposit-container">
                <div class="deposit-header">
                    <a href="User.jsp" class="back-btn"><i class="fas fa-arrow-left"></i></a>
                    <i class="fas fa-money-bill-wave"></i>
                    <h1>Deposit Funds</h1>
                    <p>Add money to your account using your preferred payment method</p>
                </div>
                
                <div class="payment-methods">
                    <div class="payment-tab active" onclick="switchTab('bank')">
                        <i class="fas fa-building-columns"></i>
                        <div>Bank Transfer</div>
                    </div>
                    <div class="payment-tab" onclick="switchTab('card')">
                        <i class="fas fa-credit-card"></i>
                        <div>Card Payment</div>
                    </div>
                </div>
                
                <!-- Bank Transfer Form -->
                <form class="payment-content active" id="bank-form" action="Deposit" method="post">
                    <div class="form-group">
                        <label for="amount">Deposit Amount</label>
                        <div class="input-field">
                            <i class="fas fa-rupee-sign"></i>
                            <input type="text" id="amount" name="balance" required 
                                   oninput="this.value = this.value.replace(/[^0-9]/g, '')">
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary">Deposit Funds</button>
                </form>
                
                <!-- Card Payment Form (Front-end only) -->
                <form class="payment-content" id="card-form">
                    <div class="form-group">
                        <label for="card-number">Card Number</label>
                        <div class="input-field">
                            <i class="fas fa-credit-card"></i>
                            <input type="text" id="card-number" placeholder="1234 5678 9012 3456" 
                                   maxlength="19" required oninput="formatCardNumber(this)">
                        </div>
                    </div>
                    
                    <div class="card-row">
                        <div class="form-group">
                            <label for="expiry">Expiry Date</label>
                            <div class="input-field">
                                <i class="fas fa-calendar-alt"></i>
                                <input type="text" id="expiry" placeholder="MM/YY" 
                                       maxlength="5" required oninput="formatExpiry(this)">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="cvv">CVV</label>
                            <div class="input-field">
                                <i class="fas fa-lock"></i>
                                <input type="text" id="cvv" placeholder="123" 
                                       maxlength="3" required oninput="this.value = this.value.replace(/[^0-9]/g, '')">
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="card-amount">Deposit Amount</label>
                        <div class="input-field">
                            <i class="fas fa-rupee-sign"></i>
                            <input type="text" id="card-amount" required 
                                   oninput="this.value = this.value.replace(/[^0-9]/g, '')">
                        </div>
                    </div>
                    
                    <button type="button" class="btn btn-primary" onclick="validateCardPayment()">
                        Process Payment
                    </button>
                </form>
            </div>
        </div>
    <% } %>
    
    <footer>
        By using this WebSite, you accept cookies. &copy; 2025 Global National Bank. All rights reserved.
    </footer>

    <script>
        // Show modal if there are messages
        function showModal() {
            const modal = document.getElementById("successModal");
            if (modal) modal.style.display = "flex";
        }

        function closeModal() {
            const modal = document.getElementById("successModal");
            if (modal) modal.style.display = "none";
        }

        window.onload = function() {
            <% if (Fal != null || Message != null) { %>
                showModal();
            <% } %>
        };

        // Payment method tabs
        function switchTab(method) {
            document.querySelectorAll('.payment-tab').forEach(tab => {
                tab.classList.remove('active');
            });
            document.querySelectorAll('.payment-content').forEach(content => {
                content.classList.remove('active');
            });
            
            if (method === 'bank') {
                document.querySelector('.payment-tab:nth-child(1)').classList.add('active');
                document.getElementById('bank-form').classList.add('active');
            } else {
                document.querySelector('.payment-tab:nth-child(2)').classList.add('active');
                document.getElementById('card-form').classList.add('active');
            }
        }

        // Card number formatting
        function formatCardNumber(input) {
            // Remove all non-digits
            let value = input.value.replace(/\D/g, '');
            
            // Add space after every 4 digits
            value = value.replace(/(\d{4})(?=\d)/g, '$1 ');
            
            // Limit to 16 digits + 3 spaces
            if (value.length > 19) {
                value = value.substring(0, 19);
            }
            
            input.value = value;
        }

        // Expiry date formatting
        function formatExpiry(input) {
            let value = input.value.replace(/\D/g, '');
            
            if (value.length > 2) {
                value = value.substring(0, 2) + '/' + value.substring(2, 4);
            }
            
            if (value.length > 5) {
                value = value.substring(0, 5);
            }
            
            input.value = value;
        }

        // Card payment validation (front-end only)
        function validateCardPayment() {
            const cardNumber = document.getElementById('card-number').value.replace(/\s/g, '');
            const expiry = document.getElementById('expiry').value;
            const cvv = document.getElementById('cvv').value;
            const amount = document.getElementById('card-amount').value;
            
            // Simple validation
            if (cardNumber.length !== 16) {
                alert('Please enter a valid 16-digit card number');
                return;
            }
            
            if (!expiry.match(/^\d{2}\/\d{2}$/)) {
                alert('Please enter a valid expiry date (MM/YY)');
                return;
            }
            
            if (cvv.length !== 3) {
                alert('Please enter a valid 3-digit CVV');
                return;
            }
            
            if (!amount || parseInt(amount) <= 0) {
                alert('Please enter a valid deposit amount');
                return;
            }
            
            // In a real application, you would process the payment here
            alert('This is a demo. Card payments are not actually processed.\n\n' +
                  'Deposit amount: ₹' + amount + '\n' +
                  'Card ending in: ' + cardNumber.substring(12));
        }
    </script>
</body>
</html>