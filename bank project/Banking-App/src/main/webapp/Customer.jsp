<%@page import="java.util.Iterator"%>
<%@page import="com.bank.dao.CustomerDAOimpl"%>
<%@page import="com.bank.dao.CustomerDAO"%>
<%@page import="com.bank.dto.Customer"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<title>Global National Bank</title>
<style>
body {
	background: linear-gradient(to bottom, #9ce1eb, #FFFFFF);
	min-height: 100vh;
}

.card {
	background-color: transparent;
}

.table {
	text-align: center;
	background-color: transparent;
	color: black;
}

.table td {
	color: black;
	background-color: transparent;
}

#back {
	background-color: red;
	color: white;
	position: absolute;
	top: 30px;
	right: 50px;
	width: 80px;
	padding: 10px 0px;
	margin: 0px;
	height: 40px;
	text-align: center;
	border-radius: 5px;
	text-decoration: none;
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

header {
	font-size: 20px;
	text-transform: capitalize;
	font-family: 'Times New Roman', Times, serif;
	text-align: center;
	height: 79px;
	width: 100%;
	display: flex;
	align-items: center;
	justify-content: flex-start;
}

a {
	text-decoration: none;
	color: #FFFFFF;
}

footer {
	position: absolute;
	bottom: 0;
	right: 30%;
	background-color: transparent;
}

.success {
	text-align: center;
	color: green;
}

.faliure {
	text-align: center;
	color: red;
}
</style>
</head>

<body>
	<header>
	<img src="https://icon-library.com/images/bank-account-icon/bank-account-icon-5.jpg"
			alt="no-referrer" height="50px">Global National Bank
	</header>
	<a href="Admin.jsp" id="back"><b>Back</b></a>
	
	<!-- Message-->
		<% String failMessage = (String) request.getAttribute("Error"); %>
		<% if (failMessage != null) { %>
    	<div class="modal" id="errorModal">
        <div class="modal-content">
            <h3 class="failed"><%= failMessage %></h3>
            <br>
            <button class="fail" onclick="closeModal('errorModal')">OK</button>
        </div>
    	</div>
    	<% request.removeAttribute("Error"); %>
		<% } %>
		
		<% String successMessage = (String) request.getAttribute("Account"); %>
		<% if (successMessage != null) { %>
            <h3 class="success"><%= successMessage %></h3>
   		 <% request.removeAttribute("Account"); %>
		<% } %>
	<!-- End Message -->
	
	
	<div class="container mt-4">
		<div class="card">
			<div class="card-body">
				<h4 class="card-title text-center">View Your Data</h4>
				<table class="table table-bordered">
					<thead class="table-dark">
						<tr>
							<th>Account Number</th>
							<th>Name</th>
							<th>Phone</th>
							<th>Mail ID</th>
							<th>Balance</th>
							<th>Delete Student</th>
						</tr>
					</thead>
					<%CustomerDAO cdao = new CustomerDAOimpl();
                    ArrayList<Customer> Lc = cdao.getCustomer();
                    Iterator<Customer> it= Lc.iterator();{%>
					<tbody>
						<% while(it.hasNext()) {
                      Customer c = it.next();%>
						<tr>
							<td><%=c.getACC_NO()%></td>
							<td><%=c.getName()%></td>
							<td><%=c.getPhone()%></td>
							<td><%=c.getMail() %></td>
							<td><%=c.getBalance()%></td>
							<td><a href="Delete.jsp?id=<%=c.getACC_NO()%>"
								class="btn btn-danger">Delete</a></td>
						</tr>
						<%}}%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<footer class="footer"> By using this WebSite, you accept
		cookies. &copy; 2025 Global National Bank. All rights reserved. </footer>

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
        if (failMessage!= null) {
            showModal();
        }
    };
	</script>
</body>
</html>