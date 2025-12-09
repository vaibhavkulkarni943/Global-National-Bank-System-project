package com.bank.servlets;
import java.io.IOException;
import com.bank.dao.CustomerDAO;
import com.bank.dao.CustomerDAOimpl;
import com.bank.dto.Customer;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Forget")
public class Forget extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		CustomerDAO cdao = new CustomerDAOimpl();
		Customer c = cdao.getCustomer(Long.parseLong(req.getParameter("phone")), req.getParameter("mail"));
		if (c != null) {
			int pin = Integer.parseInt(req.getParameter("pin"));
			int confirm_pin = Integer.parseInt(req.getParameter("conform-pin"));
			if (pin == confirm_pin) {
            c.setPin(pin);
            if(cdao.updateCustomer(c)) {
            	req.setAttribute("Success","Pin Update Successfully");
            	req.getRequestDispatcher("Login.jsp").forward(req, resp);
            }
            else {
            	req.setAttribute("Failed","Pin Failed To Update");
            	req.getRequestDispatcher("Forget.jsp").forward(req, resp);
            }
			}else{
				req.setAttribute("Mismatch","Pin Mismatch");
				req.getRequestDispatcher("Forget.jsp").forward(req, resp);
			}
		}else {
		    req.setAttribute("None","Customer Not Found");
		    req.getRequestDispatcher("Forget.jsp").forward(req, resp);
		}
	}
}
