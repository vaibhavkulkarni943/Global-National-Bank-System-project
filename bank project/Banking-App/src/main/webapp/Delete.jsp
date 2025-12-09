<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/js/all.min.js"></script>
    <title>Global National Bank</title>
    <link rel="stylesheet" href="Style.css">
</head>
<body>
         <!-- Message-->
         
         <%String Fail = (String) request.getAttribute("Error");
				if (Fail  != null){%>
				<div class="modal" id="successModal">
				<div class="modal-content">
				<h3 class="failed"><%=Fail%></h3>
				<br>
				<button class="fail" onclick="closeModal()">OK</button>
				<%request.removeAttribute("Error");%>
				</div>
				</div>
		<%}%>
      <!-- End Message -->

    <header><img src="https://icon-library.com/images/bank-account-icon/bank-account-icon-5.jpg" alt="no-referrer"
        height="50px"> Global National Bank</header>
    <div class="container">
        <div class="form-control">
            <a href="Customer.jsp"><i class="fa-solid fa-xmark" id="back"></i></a> 
            <div id="new">
                <i class="fa-solid fa-trash"></i>
            </div>
            <!-- Content reader -->  
            <%Long accId =Long.parseLong(request.getParameter("id"));%>
            <h1>Delete Account</h1>
            <br>
            <form class="password-holder" action="Delete" method="post">
               
                    <input type="hidden" id="numberInput" name="Acc_no" value="<%=accId%>" required>
                 
                <div class="input-group">
                    <i class="fa-solid fa-vault" id="four"></i>
                    <input type="text" id="numberInput" name="NAcc_no" required>
                    <label>Enter Nominee Account</label>
                </div>
                <br>
                <button type="submit">Delete</button>
            </form>
            <br>
        </div>
    </div>
    <br>
    <br>
    <footer class="footer">
        By using this WebSite, you accept cookies. &copy; 2025 Global National Bank. All rights reserved.
    </footer>  
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
	    var successMessage = "<%= request.getAttribute("Error") %>";
	    var s="<%=session.getAttribute("Error")%>"
	    if (s||successMessage && successMessage.trim() !== "") {
	        showModal();
	    }
     };
     
        const numberInput = document.getElementById("numberInput");
        numberInput.addEventListener("input", function (event) {
            let value = this.value.replace(/[^0-9]/g,""); 
            this.value = value;
        });
    </script>
</body>
</html>