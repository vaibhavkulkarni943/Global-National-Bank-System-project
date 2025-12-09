<%@page import="java.util.Iterator"%>
<%@page import="com.bank.dto.Customer"%>
<%@page import="com.bank.dto.Transaction"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bank.dao.TransationDAOimpl"%>
<%@page import="com.bank.dao.TransactionDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Global National Bank | Dashboard</title>
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
            --card-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
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
            position: sticky;
            top: 0;
            z-index: 100;
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
            align-items: center;
        }

        .nav-links a, .nav-links button {
            text-decoration: none;
            color: var(--dark);
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            transition: all 0.3s;
            background: none;
            border: none;
            cursor: pointer;
            font-size: 1rem;
        }

        .nav-links a:hover, .nav-links button:hover {
            color: var(--primary);
        }

        .logout-btn {
            background: var(--primary);
            color: black !important;
            padding: 8px 16px;
            border-radius: 6px;
        }

        .logout-btn:hover {
            background: var(--primary-dark) !important;
            transform: translateY(-2px);
        }

        .main-content {
            flex: 1;
            padding: 2rem 5%;
        }

        .welcome-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
        }

        .welcome-message h2 {
            font-size: 1.8rem;
            margin-bottom: 0.5rem;
            color: var(--dark);
        }

        .welcome-message p {
            color: #64748b;
        }

        .balance-card {
            background: white;
            border-radius: 12px;
            padding: 1.5rem;
            box-shadow: var(--card-shadow);
            text-align: center;
            min-width: 250px;
        }

        .balance-card h3 {
            color: #64748b;
            font-size: 1rem;
            margin-bottom: 0.5rem;
        }

        .balance-amount {
            font-size: 2rem;
            font-weight: 600;
            color: var(--primary);
        }

        .dashboard-grid {
            display: grid;
            grid-template-columns: 250px 1fr;
            gap: 2rem;
            margin-top: 2rem;
        }

        .services-card {
            background: white;
            border-radius: 12px;
            padding: 1.5rem;
            box-shadow: var(--card-shadow);
            height: fit-content;
        }

        .services-card h2 {
            font-size: 1.3rem;
            margin-bottom: 1.5rem;
            color: var(--dark);
            padding-bottom: 0.5rem;
            border-bottom: 2px solid #f0f4f8;
        }

        .services-list {
            list-style: none;
        }

        .services-list li {
            margin-bottom: 1rem;
        }

        .services-list a {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            text-decoration: none;
            color: var(--dark);
            padding: 0.75rem;
            border-radius: 8px;
            transition: all 0.3s;
        }

        .services-list a:hover {
            background-color: #f0f4f8;
            color: var(--primary);
            transform: translateX(5px);
        }

        .services-list i {
            width: 24px;
            text-align: center;
        }

        .transactions-card {
            background: white;
            border-radius: 12px;
            padding: 1.5rem;
            box-shadow: var(--card-shadow);
        }

        .transactions-card h2 {
            font-size: 1.3rem;
            margin-bottom: 1.5rem;
            color: var(--dark);
        }

        .transactions-table {
            width: 100%;
            border-collapse: collapse;
        }

        .transactions-table th {
            background-color: var(--primary);
            color: white;
            padding: 12px;
            text-align: left;
        }

        .transactions-table td {
            padding: 12px;
            border-bottom: 1px solid #e2e8f0;
        }

        .transactions-table tr:last-child td {
            border-bottom: none;
        }

        .transactions-table tr:hover {
            background-color: #f8fafc;
        }

        .ticker {
            background-color: var(--primary);
            color: white;
            padding: 0.75rem;
            border-radius: 6px;
            margin-bottom: 2rem;
            overflow: hidden;
        }

        .ticker-content {
            display: inline-block;
            white-space: nowrap;
            animation: ticker 20s linear infinite;
        }

        @keyframes ticker {
            0% { transform: translateX(100%); }
            100% { transform: translateX(-100%); }
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

        .modal .success {
            color: var(--success);
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
        
        .view-all-btn {
    display: inline-block;
    padding: 8px 16px;
    background-color: var(--primary);
    color: white;
    text-decoration: none;
    border-radius: 6px;
    font-weight: 500;
    transition: all 0.3s;
}

.view-all-btn:hover {
    background-color: var(--primary-dark);
    transform: translateY(-2px);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}


        @media (max-width: 768px) {
            .dashboard-grid {
                grid-template-columns: 1fr;
            }
            
            .welcome-section {
                flex-direction: column;
                align-items: flex-start;
                gap: 1.5rem;
            }
            
            .balance-card {
                width: 100%;
            }
            
            .nav-links {
                gap: 1rem;
            }
        }

        @media (max-width: 576px) {
            .navbar {
                flex-direction: column;
                gap: 1rem;
                padding: 1rem;
            }
            
            .nav-links {
                width: 100%;
                justify-content: space-between;
            }
            
            .transactions-table {
                display: block;
                overflow-x: auto;
            }
        }
    </style>
</head>
<body>
 <%@ include file="userNavbar.jsp" %>
    <div class="main-content">
        <!-- Success Messages -->
        <% String success = (String) request.getAttribute("Success"); %>
        <% String successMessage = (String) session.getAttribute("Success"); %>
        
        <% if (success != null) { %>
        <div class="modal" id="successModal">
            <div class="modal-content">
                <h3 class="success"><%= success %></h3>
                <button onclick="closeModal()">OK</button>
                <% request.removeAttribute("Success"); %>
            </div>
        </div>
        <% } %>
        
        <% if (successMessage != null) { %>
        <div class="modal" id="successModal">
            <div class="modal-content">
                <h3 class="success"><%= successMessage %></h3>
                <button onclick="closeModal()">OK</button>
                <% session.removeAttribute("Success"); %>
            </div>
        </div>
        <% } %>

        <% Customer c = (Customer) session.getAttribute("uses"); %>
        <% if(c == null) { %>
            <% session.setAttribute("Failed", "Session Expired"); %>
            <% response.sendRedirect("Login.jsp"); %>
        <% } else { %>
            <div class="welcome-section">
                <div class="welcome-message">
                    <h2>Welcome back, <%= c.getName() %></h2>
                    <p>Here's what's happening with your account today</p>
                </div>
                <div class="balance-card">
                    <h3>Current Balance</h3>
                    <div class="balance-amount">₹<%= c.getBalance() %></div>
                </div>
            </div>

            <div class="ticker">
                <div class="ticker-content">
                    Thank you for choosing Global National Bank. Your security is our top priority. 
                    &nbsp;&nbsp;&nbsp;•&nbsp;&nbsp;&nbsp; 
                    Contact us immediately if you notice any suspicious activity. 
                    &nbsp;&nbsp;&nbsp;•&nbsp;&nbsp;&nbsp; 
                    Enjoy seamless banking with our digital services.
                </div>
            </div>

            <div class="dashboard-grid">
                <div class="services-card">
                    <h2>Services</h2>
                    <ul class="services-list">
                        <li>
                            <a href="Deposite.jsp">
                                <i class="fas fa-money-bill-wave"></i>
                                Deposit
                            </a>
                        </li>
                        <li>
                            <a href="TranferAmount.jsp">
                                <i class="fas fa-exchange-alt"></i>
                                Transfer
                            </a>
                        </li>
                        <li>
                            <a href="Update.jsp">
                                <i class="fas fa-user-edit"></i>
                                Update Details
                            </a>
                        </li>
                        <li>
                            <a href="Reset.jsp">
                                <i class="fas fa-key"></i>
                                Reset PIN
                            </a>
                        </li>
                    </ul>
                </div>

              <div class="transactions-card">
    <h2>Recent Transactions</h2>
    <div class="table-container">
        <table class="transactions-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>From</th>
                    <th>To</th>
                    <th>Date</th>
                    <th>Type</th>
                    <th>Amount</th>
                    <th>Balance</th>
                </tr>
            </thead>
            <tbody>
                <% TransactionDAO tdao = new TransationDAOimpl(); 
                   ArrayList<Transaction> passbook = tdao.getTransaction(c.getACC_NO()); 
                   if (passbook != null && !passbook.isEmpty()) {
                       // Show only last 5 transactions
                       int displayCount = Math.min(5, passbook.size());
                       boolean showViewAll = passbook.size() > 5;
                       
                       for(int i = 0; i < displayCount; i++) {
                           Transaction t = passbook.get(i); %>
                           <tr>
                               <td><%= t.getTran_id() %></td>
                               <td><%= t.getUser_acc() %></td>
                               <td><%= t.getRec_acc() %></td>
                               <td><%= t.getTran_date() %></td>
                               <td><%= t.getTran_type() %></td>
                               <td>₹<%= t.getAmount() %></td>
                               <td>₹<%= t.getBalance() %></td>
                           </tr>
                      <% }
                      
                      if(showViewAll) { %>
                          <tr>
                              <td colspan="7" style="text-align: center;">
                                  <a href="transactions.jsp" class="view-all-btn">View All Transactions</a>
                              </td>
                          </tr>
                      <% }
                   } else { %>
                      <tr>
                          <td colspan="7" style="text-align: center;">No transactions found</td>
                      </tr>
                   <% } %>
            </tbody>
        </table>
    </div>
</div>
            </div>
        <% } %>
    </div>

    <footer>
        By using this WebSite, you accept cookies. &copy; 2025 Global National Bank. All rights reserved.
    </footer>

</body>
</html>