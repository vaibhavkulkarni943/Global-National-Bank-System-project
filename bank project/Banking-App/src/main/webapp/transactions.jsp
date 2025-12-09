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
    <title>Global National Bank | All Transactions</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        /* Reuse your existing styles from dashboard */
        :root {
            --primary: #2563eb;
            --primary-dark: #1d4ed8;
            --secondary: #059669;
            --dark: #1e293b;
            --light: #f8fafc;
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
        }

        /* Header/Nav styles same as dashboard */
        
        .transactions-container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 1.5rem;
        }

        .transactions-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
        }

        .back-btn {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            padding: 8px 16px;
            background-color: var(--primary);
            color: white;
            text-decoration: none;
            border-radius: 6px;
            transition: all 0.3s;
        }

        .back-btn:hover {
            background-color: var(--primary-dark);
            transform: translateY(-2px);
        }

        .transactions-table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: var(--card-shadow);
        }

        .transactions-table th {
            background-color: var(--primary);
            color: white;
            padding: 12px;
            text-align: left;
            position: sticky;
            top: 0;
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

        .credit {
            color: var(--success);
            font-weight: 500;
        }

        .debit {
            color: var(--error);
            font-weight: 500;
        }

        .pagination {
            display: flex;
            justify-content: center;
            gap: 0.5rem;
            margin-top: 2rem;
        }

        .pagination a, .pagination span {
            padding: 8px 12px;
            border-radius: 6px;
            text-decoration: none;
            color: var(--dark);
            background: white;
            box-shadow: var(--card-shadow);
        }

        .pagination a:hover {
            background-color: var(--primary);
            color: white;
        }

        .pagination .current {
            background-color: var(--primary);
            color: white;
        }

        @media (max-width: 768px) {
            .transactions-table {
                display: block;
                overflow-x: auto;
            }
        }
    </style>
</head>
<body>
 <%@ include file="userNavbar.jsp" %>
    <div class="transactions-container">
        <% Customer c = (Customer) session.getAttribute("uses"); %>
        <% if(c == null) { %>
            <% session.setAttribute("Failed", "Session Expired"); %>
            <% response.sendRedirect("Login.jsp"); %>
        <% } else { %>
            <div class="transactions-header">
                <h1>All Transactions</h1>
                <a href="User.jsp" class="back-btn">
                    <i class="fas fa-arrow-left"></i> Back to Dashboard
                </a>
            </div>

            <table class="transactions-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Date & Time</th>
                        <th>Description</th>
                        <th>From Account</th>
                        <th>To Account</th>
                        <th>Amount</th>
                        <th>Balance</th>
                    </tr>
                </thead>
                <tbody>
                    <% TransactionDAO tdao = new TransationDAOimpl(); 
                       ArrayList<Transaction> allTransactions = tdao.getTransaction(c.getACC_NO()); 
                       if (allTransactions != null && !allTransactions.isEmpty()) {
                           for(Transaction t : allTransactions) { %>
                               <tr>
                                   <td><%= t.getTran_id() %></td>
                                   <td><%= t.getTran_date() %></td>
                                   <td><%= t.getTran_type() %></td>
                                   <td><%= t.getUser_acc() %></td>
                                   <td><%= t.getRec_acc() %></td>
                                   <td class="<%= t.getAmount() > 0 ? "credit" : "debit" %>">
                                       ₹<%= Math.abs(t.getAmount()) %>
                                   </td>
                                   <td>₹<%= t.getBalance() %></td>
                               </tr>
                          <% }
                       } else { %>
                          <tr>
                              <td colspan="7" style="text-align: center;">No transactions found</td>
                          </tr>
                       <% } %>
                </tbody>
            </table>

            <!-- Optional: Add pagination if you have many transactions -->
            <div class="pagination">
                <a href="#">&laquo;</a>
                <a href="#" class="current">1</a>
                <a href="#">2</a>
                <a href="#">3</a>
                <a href="#">&raquo;</a>
            </div>
        <% } %>
    </div>
</body>
</html>