package com.bank.servlets;

import java.io.IOException;
import com.bank.dao.CustomerDAO;
import com.bank.dao.CustomerDAOimpl;
import com.bank.dto.Customer;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Login")
public class Login extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(true);
		CustomerDAO cado = new CustomerDAOimpl();
		Customer com = cado.getCustomer(Long.parseLong(req.getParameter("acc")),
				Integer.parseInt(req.getParameter("pin")));
		if (com != null && com.getACC_NO() == 1100110011) {
			req.setAttribute("Success", "Login Successfully");
			session.setAttribute("uses", com);
			RequestDispatcher rd = req.getRequestDispatcher("Admin.jsp");
			rd.forward(req, resp);
		} else if (com != null) {
			req.setAttribute("Success", "Login Successfully");
			session.setAttribute("uses", com);
			req.getRequestDispatcher("User.jsp").forward(req, resp);
		}
		else {
			req.setAttribute("Failed", "Failed to Login");
			req.getRequestDispatcher("Login.jsp").forward(req, resp);
		}
	}
}
