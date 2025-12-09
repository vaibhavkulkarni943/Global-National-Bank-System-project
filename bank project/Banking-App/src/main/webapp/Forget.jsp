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
       <!-- Message Stated -->
       <%String Message=(String)request.getAttribute("Mismatch");
         String Fal = (String)request.getAttribute("None"); 
         String Failed=(String)request.getAttribute("Failed");

		if (Message != null || Failed != null || Fal !=null) {%>
		<div class="modal" id="successModal">
			<div class="modal-content"> 
			    <%if(Message != null ){%>
				<h3 class="failed"><%=Message%></h3>
				<br>
				<button class="fail" onclick="closeModal()">OK</button>
				<%request.removeAttribute("Mismatch");}%>
				
				 <%if(Failed != null ){%>
				<h3 class="failed"><%=Failed%></h3>
				<br>
				<button class="fail" onclick="closeModal()">OK</button>
				<%request.removeAttribute("Failed");}%>
				
				 <%if(Fal != null ){%>
				<h3 class="failed"><%=Fal%></h3>
				<br>
				<button class="fail" onclick="closeModal()">OK</button>
				<%request.removeAttribute("None");}%>
			</div>
		</div>
		<%}%>
   <!-- End Message -->
    <header><img src="https://icon-library.com/images/bank-account-icon/bank-account-icon-5.jpg" alt="no-referrer"
        height="50px">Global National Bank</header>
    <div class="container">
        <div class="form-control">
            <a href="Login.jsp"><i class="fa-solid fa-xmark" id="back"></i></a>
            <div id="new">
                <i class="fa-solid fa-unlock"></i>
            </div>
            <h1>Forget Pin</h1>			
                <form class="password-holder" action="Forget" method="post">
                <div class="input-group">
                    <i class="fa-solid fa-mobile" id="four"></i>
                    <input type="tel"  class="onlyNumbers" name="phone" required>
                    <label>Enter Your Phone No</label>
                </div>
                <div class="input-group">
                    <i class="fa-solid fa-envelope" id="four"></i>
                    <input type="email" name="mail" required>
                    <label>Enter Your Email</label>
                </div>
                <div class="input-group">
                    <i class="fa-solid fa-lock" id="four"></i>
                    <input type="password"  class="onlyNumbers" name="pin" required>
                    <label>Enter Your New Pin</label>
                </div>
                <div class="input-group">
                    <i class="fa-solid fa-lock" id="four"></i>
                    <input type="password"  class="onlyNumbers" name="conform-pin" required>
                    <label>Confirm your New Pin</label>
                </div>
                <br>
                <button type="submit">Forget Pin</button>
            </form>
        </div>
    </div>
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
            if (Fal !=null || Message != null || Failed !=null) {
                showModal();
            }
        };
          document.querySelectorAll(".onlyNumbers").forEach(input => {
            input.addEventListener("input", function () {
                this.value = this.value.replace(/[^0-9]/g, "");
            });
        });
    </script>
</body>
</html>