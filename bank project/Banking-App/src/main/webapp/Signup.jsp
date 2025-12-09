<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Global National Bank | Sign Up</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
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

.main-content {
	flex: 1;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 2rem;
}

.signup-container {
	background: white;
	border-radius: 12px;
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
	width: 100%;
	max-width: 500px;
	padding: 2.5rem;
	position: relative;
	overflow: hidden;
}

.signup-header {
	text-align: center;
	margin-bottom: 2rem;
}

.signup-header i {
	font-size: 3rem;
	color: var(--primary);
	margin-bottom: 1rem;
}

.signup-header h1 {
	font-size: 1.8rem;
	color: var(--dark);
	margin-bottom: 0.5rem;
}

.signup-header p {
	color: #64748b;
	font-size: 0.9rem;
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

.terms {
	display: flex;
	align-items: center;
	margin: 1.5rem 0;
}

.terms input {
	margin-right: 10px;
}

.terms label {
	font-size: 0.9rem;
	color: #64748b;
}

.terms a {
	color: var(--primary);
	text-decoration: none;
	font-weight: 500;
}

.terms a:hover {
	text-decoration: underline;
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

.login-link {
	text-align: center;
	margin-top: 1.5rem;
	color: #64748b;
	font-size: 0.9rem;
}

.login-link a {
	color: var(--primary);
	text-decoration: none;
	font-weight: 500;
}

.login-link a:hover {
	text-decoration: underline;
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
	color: var(--dark);
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

footer {
	background-color: var(--dark);
	color: white;
	text-align: center;
	padding: 1.5rem;
	font-size: 0.9rem;
}

footer a {
	color: var(--gold);
	text-decoration: none;
}

@media ( max-width : 576px) {
	.signup-container {
		padding: 1.5rem;
	}
	.signup-header h1 {
		font-size: 1.5rem;
	}
}
</style>
</head>
<body>
  <%@ include file="navbar.jsp" %>
	<div class="main-content">
		<div class="signup-container">
			<div class="signup-header">
				<i class="fas fa-user-plus"></i>
				<h1>Create Your Account</h1>
				<p>Join Global National Bank and experience secure digital
					banking</p>
			</div>

			<!-- Message Stated -->
			<%
			String Message = (String) request.getAttribute("Mismatch");
			String Fal = (String) request.getAttribute("User");
			String Failed = (String) request.getAttribute("Failed");

			if (Message != null || Failed != null || Fal != null) {
			%>
			<div class="modal" id="successModal">
				<div class="modal-content">
					<%
					if (Message != null) {
					%>
					<h3 class="failed"><%=Message%></h3>
					<br>
					<button class="fail" onclick="closeModal()">OK</button>
					<%
					request.removeAttribute("Mismatch");
					}
					%>

					<%
					if (Failed != null) {
					%>
					<h3 class="failed"><%=Failed%></h3>
					<br>
					<button class="fail" onclick="closeModal()">OK</button>
					<%
					request.removeAttribute("Failed");
					}
					%>

					<%
					if (Fal != null) {
					%>
					<h3 class="failed"><%=Fal%></h3>
					<br>
					<button class="fail" onclick="closeModal()">OK</button>
					<%
					request.removeAttribute("User");
					}
					%>
				</div>
			</div>
			<%
			}
			%>
			<!-- End Message -->

			<form class="signup-form" action="Signup" method="post"
				id="signupForm">
				<div class="form-group">
					<label for="name">Full Name</label>
					<div class="input-field">
						<i class="fas fa-user"></i> <input type="text" id="name"
							name="name" required>
					</div>
					<div class="error-message" id="nameError">Please enter a
						valid name</div>
				</div>

				<div class="form-group">
					<label for="phone">Phone Number</label>
					<div class="input-field">
						<i class="fas fa-mobile-alt"></i> <input type="tel" id="phone"
							name="phone" required>
					</div>
					<div class="error-message" id="phoneError">Please enter a
						valid 10-digit phone number</div>
				</div>

				<div class="form-group">
					<label for="email">Email Address</label>
					<div class="input-field">
						<i class="fas fa-envelope"></i> <input type="email" id="email"
							name="mail" required>
					</div>
					<div class="error-message" id="emailError">Please enter a
						valid email address</div>
				</div>

				<div class="form-group">
					<label for="pin">Create PIN (4-6 digits)</label>
					<div class="input-field">
						<i class="fas fa-lock"></i> <input type="password" id="pin"
							name="pin" maxlength="6" required>
					</div>
					<div class="error-message" id="pinError">PIN must be 4-6
						digits</div>
				</div>

				<div class="form-group">
					<label for="confirmPin">Confirm PIN</label>
					<div class="input-field">
						<i class="fas fa-lock"></i> <input type="password" id="confirmPin"
							name="conform-pin" maxlength="6" required>
					</div>
					<div class="error-message" id="confirmPinError">PINs do not
						match</div>
				</div>

				<div class="terms">
					<input type="checkbox" id="terms" required> <label
						for="terms">I agree to the <a href="Condition.jsp">Terms
							and Conditions</a></label>
				</div>

				<button type="submit" class="btn btn-primary">Create
					Account</button>
			</form>

			<div class="login-link">
				Already have an account? <a href="Login.jsp">Sign In</a>
			</div>
		</div>
	</div>

    <%@ include file="footer.jsp" %> 

	<script>
		// Show modal if there are messages
		function showModal() {
			const modal = document.getElementById("successModal");
			if (modal)
				modal.style.display = "flex";
		}

		function closeModal() {
			const modal = document.getElementById("successModal");
			if (modal)
				modal.style.display = "none";
		}

		window.onload = function() {
	<%if (Fal != null || Message != null || Failed != null) {%>
		showModal();
	<%}%>
		// Initialize form validation
			initFormValidation();
		};

		// Form validation
		function initFormValidation() {
			const form = document.getElementById('signupForm');

			// Only allow numbers in phone and PIN fields
			document.getElementById('phone').addEventListener('input',
					function() {
						this.value = this.value.replace(/[^0-9]/g, '');
					});

			document.getElementById('pin').addEventListener('input',
					function() {
						this.value = this.value.replace(/[^0-9]/g, '');
					});

			document.getElementById('confirmPin').addEventListener('input',
					function() {
						this.value = this.value.replace(/[^0-9]/g, '');
					});

			form.addEventListener('submit', function(event) {
				let isValid = true;

				// Validate name
				const name = document.getElementById('name');
				const nameError = document.getElementById('nameError');
				if (name.value.trim() === '' || name.value.length < 2) {
					nameError.style.display = 'block';
					isValid = false;
				} else {
					nameError.style.display = 'none';
				}

				// Validate phone
				const phone = document.getElementById('phone');
				const phoneError = document.getElementById('phoneError');
				const phoneRegex = /^\d{10}$/;
				if (!phoneRegex.test(phone.value)) {
					phoneError.style.display = 'block';
					isValid = false;
				} else {
					phoneError.style.display = 'none';
				}

				// Validate email
				const email = document.getElementById('email');
				const emailError = document.getElementById('emailError');
				const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
				if (!emailRegex.test(email.value)) {
					emailError.style.display = 'block';
					isValid = false;
				} else {
					emailError.style.display = 'none';
				}

				// Validate PIN
				const pin = document.getElementById('pin');
				const pinError = document.getElementById('pinError');
				const pinRegex = /^\d{4,6}$/;
				if (!pinRegex.test(pin.value)) {
					pinError.style.display = 'block';
					isValid = false;
				} else {
					pinError.style.display = 'none';
				}

				// Validate confirm PIN
				const confirmPin = document.getElementById('confirmPin');
				const confirmPinError = document
						.getElementById('confirmPinError');
				if (confirmPin.value !== pin.value) {
					confirmPinError.style.display = 'block';
					isValid = false;
				} else {
					confirmPinError.style.display = 'none';
				}

				// Validate terms checkbox
				const terms = document.getElementById('terms');
				if (!terms.checked) {
					alert('Please agree to the Terms and Conditions');
					isValid = false;
				}

				if (!isValid) {
					event.preventDefault();
				}
			});
		}
	</script>
</body>
</html>