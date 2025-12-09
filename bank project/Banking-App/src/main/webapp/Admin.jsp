<%@page import="java.util.Iterator"%>
<%@page import="com.bank.dto.Transaction"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bank.dao.TransationDAOimpl"%>
<%@page import="com.bank.dao.TransactionDAO"%>
<%@page import="com.bank.dao.CustomerDAOimpl"%>
<%@page import="com.bank.dao.CustomerDAO"%>
<%@page import="com.bank.dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Global National Bank</title>

   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/js/all.min.js"></script>
<style>
* {
	padding: 0;
	margin: 0;
}

body {
	background: linear-gradient(to bottom, #9ce1eb, #FFFFFF);
	min-height: 100vh;
}

header {
	font-size: 20px;
	text-transform: capitalize;
	text-align: center;
	height: 79px;
	width: 100%;
	display: flex;
	background-color: rgba(186, 220, 233, 0.534);
	align-items: center;
	justify-content: start;
}

header a {
	width: 100px;
	height: 50px;
	position: absolute;
	top: 25px;
	right: 350px;
	color: #000;
	display: flex;
	text-decoration: none;
}

#one {
	position: absolute;
	top: 25px;
	right: 200px;
}

#two {
	font-size: 20px;
	font-family: 'Times New Roman', Times, serif;
	border: none;
	outline: none;
	width: 100px;
	height: 50px;
	position: absolute;
	top: 25px;
	right: 40px;
	color: black;
	display: flex;
	text-decoration: none;
	position: absolute;
	top: 25px;
	right: 40px;
	background: none;
}

header a:hover {
	color: blue;
}

#one:hover {
	color: blue;
}

#two:hover {
	color: blue;
}

h2 {
	position: absolute;
	text-transform: capitalize;
	top: 20px;
	left: 40%;
}

.content {
	display: flex;
	justify-content: center;
	width: 100%;
	height: 200px;
}

.mark {
	width: 300px;
	border-radius: 20px;
	margin: 20px 0px 0px 20px;
	text-align: center;
	padding: 20px 0px 0px 0px;
	box-shadow: 0px 0px 10px black;
	font-size: 30px;
	text-transform: capitalize;
}

.card {
	width: 100%;
	height: 240px;
	border-radius: 10px;
	text-align: center;
	overflow: auto;
	background-color: white;
	position: relative;
}
.modal {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	display: flex;
	justify-content: center;
	align-items: center;
	z-index: 1000;
}
.modal-content {
	background-color: white;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
	text-align: center;
	max-width: 300px;
}

.modal-content button.successful {
	padding: 10px 20px;
	background-color: green;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.modal-content button.fail {
	padding: 10px 20px;
	background-color: red;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

table {
	width: 100%;
	border-collapse: collapse;
	text-align: center;
}

thead {
	background-color: #007bff;
	color: white;
	position: sticky;
	top: 0;
	z-index: 2;
}

th, td {
	padding: 12px;
	border-bottom: 1px solid #ddd;
}

footer {
	position: absolute;
	bottom: 0;
	right: 30%;
	background-color: transparent;
}

#headline {
	color: blue;
	text-align: center;
}

.success {
	color: green;
}

.failed {
	color: red;
}
</style>
</head>

<body>
	
	<header>
		<%Customer c=(Customer)session.getAttribute("uses");
			if(c!=null){%>
		<img
			src="https://icon-library.com/images/bank-account-icon/bank-account-icon-5.jpg"
			alt="no-referrer" height="50px"> Global National Bank
		<h2>
			Hi Admin
			<%=c.getName() %>
		</h2>
		<a href="User.jsp"><i class="fa-solid fa-briefcase"></i>&nbsp;Account</a>
		<a href="Customer.jsp" id="one"><i class="fa-solid fa-user"></i>&nbsp;Customer</a>
		<form action="Logout" method="post">
        <button type="submit" id="two">Logout &nbsp;<i class="fa-solid fa-right-from-bracket"></i></button>
    </form>
	</header>
	<%CustomerDAO cdao = new CustomerDAOimpl();
	TransactionDAO tdao = new TransationDAOimpl();%>
	<!-- Message -->
     <% String success = (String) request.getAttribute("Success"); 
    if (success != null) { %>
    <div class="modal" id="successModal">
        <div class="modal-content">
            <h3 class="success"><%= success %></h3>
            <br>
            <button class="successful" onclick="closeModal()">OK</button>
        </div>
    </div>
    <% request.removeAttribute("Success"); %>
   <% } %>
   <!-- End Message -->
	<main>
		<div class="content">
			<div class="mark">
				<h5 id="headline">Total Customer</h5>
				<br>
				<%=cdao.getCustomerCount() %>
			</div>
			<div class="mark">
				<h5 id="headline">Total Amount in Vault</h5>
				<br>
				<%=cdao.getTotalBalance() %>
			</div>
			<div class="mark">
				<h5 id="headline">Total Transaction Done</h5>
				<br>
				<%=tdao.getTransaction() %>

			</div>
			<div class="mark">
				<h5 id="headline">Total Transaction Amount</h5>
				<br>
				<%=tdao.getTotalamount()%>
			</div>
		</div>
		<br>
		<br><br>
		<h1 id="headline">Total Transaction Details</h1>
		<br>
		<div class="card">
			<table>
				<thead class="table-header">
					<tr>
						<th>Transaction ID</th>
						<th>User Account</th>
						<th>Receiver Account</th>
						<th>Transaction Date</th>
						<th>Transaction Type</th>
						<th>Amount</th>
						<th>Balance</th>
					</tr>
				</thead>
				<%
		            ArrayList<Transaction> passbook=tdao.getTransation(); 
		            Iterator<Transaction> it=passbook.iterator();%>
				<tbody>
					<% while(it.hasNext()) {
			        Transaction t= it.next();%>
					<tr>
						<td><%=t.getTran_id()%></td>
						<td><%=t.getUser_acc()%></td>
						<td><%=t.getRec_acc()%></td>
						<td><%=t.getTran_date()%></td>
						<td><%=t.getTran_type()%></td>
						<td><%=t.getAmount()%></td>
						<td><%=t.getBalance()%></td>
					</tr>
				</tbody>
				<%}}%>
			</table>
		</div>
	</main>
	<footer> By using this WebSite, you accept cookies. &copy;
		2025 Global National Bank. All rights reserved.</footer>
	<script>
	
    function showModal() {
    const modal = document.getElementById("successModal");
    modal.style.display = "flex";
	}

	function closeModal() {
    const modal = document.getElementById("successModal");
    modal.style.display ="none";
	}

	window.onload = function () {
	    var successMessage = "<%= request.getAttribute("Success") %>";
	    if (successMessage && successMessage.trim() !== "") {
	        showModal();
	    }
     };
	</script>
	<%if(c==null){%>
	<%session.setAttribute("Failed", "Session Expired");%>
	<%response.sendRedirect("Login.jsp");%>
	<%}%>
</body>
</html>