<%@page import="com.bank.dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Global National Bank | Transfer Funds</title>
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

        .transfer-container {
            background: white;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
            width: 100%;
            max-width: 600px;
            padding: 2.5rem;
            position: relative;
        }

        .transfer-header {
            text-align: center;
            margin-bottom: 2rem;
            position: relative;
        }

        .transfer-header i {
            font-size: 2.5rem;
            color: var(--primary);
            margin-bottom: 1rem;
        }

        .transfer-header h1 {
            font-size: 1.8rem;
            color: var(--dark);
            margin-bottom: 0.5rem;
        }

        .transfer-header p {
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

        .balance-info {
            background-color: #f0f4f8;
            padding: 1rem;
            border-radius: 8px;
            margin-bottom: 1.5rem;
            display: flex;
            justify-content: space-between;
        }

        .balance-info span {
            font-weight: 600;
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

        .btn-primary:disabled {
            background-color: #94a3b8;
            cursor: not-allowed;
            transform: none;
            box-shadow: none;
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
            .transfer-container {
                padding: 1.5rem;
            }
            
            .transfer-header h1 {
                font-size: 1.5rem;
            }
            
            .nav-links {
                gap: 1rem;
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
    <% String Message = (String)request.getAttribute("Mismatch"); %>
    <% String Fal = (String)request.getAttribute("Error"); %>
    <% String Failed = (String)request.getAttribute("Failed"); %>
    
    <% if (Message != null || Fal != null || Failed != null) { %>
    <div class="modal" id="successModal">
        <div class="modal-content"> 
            <% if(Message != null) { %>
                <h3 class="failed"><%=Message%></h3>
                <br>
                <button class="fail" onclick="closeModal()">OK</button>
                <% request.removeAttribute("Mismatch"); %>
            <% } %>
            
            <% if(Fal != null) { %>
                <h3 class="failed"><%=Fal%></h3>
                <br>
                <button class="fail" onclick="closeModal()">OK</button>
                <% request.removeAttribute("Error"); %>
            <% } %>
            
            <% if(Failed != null) { %>
                <h3 class="failed"><%=Failed%></h3>
                <br>
                <button class="fail" onclick="closeModal()">OK</button>
                <% request.removeAttribute("Failed"); %>
            <% } %>
        </div>
    </div>
    <% } %>
    
    <% Customer c = (Customer)session.getAttribute("uses"); %>
    <% if(c == null) { %>
        <% session.setAttribute("Failed", "Session Expired"); %>
        <% response.sendRedirect("Login.jsp"); %>
    <% } else { %>
        <div class="main-content">
            <div class="transfer-container">
                <div class="transfer-header">
                    <a href="User.jsp" class="back-btn"><i class="fas fa-arrow-left"></i></a>
                    <i class="fas fa-money-bill-transfer"></i>
                    <h1>Transfer Funds</h1>
                    <p>Send money securely to another account</p>
                </div>
                
                <div class="balance-info">
                    <div>Available Balance:</div>
                    <div><span>₹<%= c.getBalance() %></span></div>
                </div>
                
                <form class="transfer-form" action="Filled" method="post" id="transferForm">
                    <div class="form-group">
                        <label for="account">Beneficiary Account Number</label>
                        <div class="input-field">
                            <i class="fas fa-user"></i>
                            <input type="text" id="account" name="Acc_no" class="onlyNumbers" required
                                   minlength="10" maxlength="18" oninput="validateAccountNumber()">
                        </div>
                        <div class="error-message" id="accountError">Please enter a valid account number (10-18 digits)</div>
                    </div>

                    <div class="form-group">
                        <label for="amount">Amount to Transfer</label>
                        <div class="input-field">
                            <i class="fas fa-rupee-sign"></i>
                            <input type="text" id="amount" name="balance" class="onlyNumbers" required
                                   oninput="validateAmount()">
                        </div>
                        <div class="error-message" id="amountError"></div>
                    </div>

                    <div class="form-group">
                        <label for="pin">Your PIN</label>
                        <div class="input-field">
                            <i class="fas fa-lock"></i>
                            <input type="password" id="pin" name="pin" class="onlyNumbers" 
                                   value="<%= c.getPin() %>" required maxlength="6" minlength="4">
                        </div>
                        <div class="error-message" id="pinError">PIN must be 4-6 digits</div>
                    </div>

                    <button type="submit" class="btn btn-primary" id="submitBtn">Transfer Amount</button>
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
            <% if (Fal != null || Message != null || Failed != null) { %>
                showModal();
            <% } %>
            
            // Initialize form validation
            initFormValidation();
        };

        // Only allow numbers in input fields
        document.querySelectorAll(".onlyNumbers").forEach(input => {
            input.addEventListener("input", function() {
                this.value = this.value.replace(/[^0-9]/g, "");
            });
        });

        // Account number validation
        function validateAccountNumber() {
            const account = document.getElementById("account");
            const accountError = document.getElementById("accountError");
            
            if (account.value.length < 10 || account.value.length > 18) {
                accountError.style.display = "block";
                return false;
            } else {
                accountError.style.display = "none";
                return true;
            }
        }

        // Amount validation
        function validateAmount() {
            const amount = document.getElementById("amount");
            const amountError = document.getElementById("amountError");
            const balance = <%= c.getBalance() %>;
            const transferAmount = parseInt(amount.value) || 0;
            
            if (!amount.value || transferAmount <= 0) {
                amountError.textContent = "Please enter a valid amount";
                amountError.style.display = "block";
                return false;
            } else if (transferAmount > balance) {
                amountError.textContent = "Insufficient balance. Please deposit first.";
                amountError.style.display = "block";
                return false;
            } else {
                amountError.style.display = "none";
                return true;
            }
        }

        // PIN validation
        function validatePin() {
            const pin = document.getElementById("pin");
            const pinError = document.getElementById("pinError");
            
            if (pin.value.length < 4 || pin.value.length > 6) {
                pinError.style.display = "block";
                return false;
            } else {
                pinError.style.display = "none";
                return true;
            }
        }

        // Form validation
        function initFormValidation() {
            const form = document.getElementById("transferForm");
            const submitBtn = document.getElementById("submitBtn");
            
            form.addEventListener("input", function() {
                const isAccountValid = validateAccountNumber();
                const isAmountValid = validateAmount();
                const isPinValid = validatePin();
                
                submitBtn.disabled = !(isAccountValid && isAmountValid && isPinValid);
            });
            
            form.addEventListener("submit", function(event) {
                if (!validateAccountNumber() || !validateAmount() || !validatePin()) {
                    event.preventDefault();
                }
            });
        }
    </script>
</body>
</html>