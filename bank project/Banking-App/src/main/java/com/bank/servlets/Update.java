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

@WebServlet("/New")
public class Update extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		CustomerDAO cdao =new CustomerDAOimpl();
		HttpSession session=req.getSession(false);
		Customer c=(Customer)session.getAttribute("uses");
		c.setName(req.getParameter("name"));
		c.setPhone(Long.parseLong(req.getParameter("phone")));
		c.setMail(req.getParameter("mail"));
		if(cdao.updateCustomer(c)) {
			req.setAttribute("Success", "Data Update Successfully");
			RequestDispatcher rd=req.getRequestDispatcher("User.jsp");
			rd.forward(req, resp);
		}
		else {
			req.setAttribute("Fail", "Fail to Update");
			RequestDispatcher rd=req.getRequestDispatcher("Update.jsp");
			rd.forward(req, resp);
		}
}
}
