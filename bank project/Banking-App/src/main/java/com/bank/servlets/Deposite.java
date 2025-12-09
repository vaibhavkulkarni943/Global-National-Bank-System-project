package com.bank.servlets;

import java.io.IOException;

import com.bank.dao.CustomerDAO;
import com.bank.dao.CustomerDAOimpl;
import com.bank.dao.TransactionDAO;
import com.bank.dao.TransationDAOimpl;
import com.bank.dto.Customer;
import com.bank.dto.Transaction;
import com.bank.dto.Transaction_ID;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Deposit")
public class Deposite extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		CustomerDAO cdao = new CustomerDAOimpl();
		TransactionDAO tdao = new TransationDAOimpl();
		HttpSession sc = req.getSession(false);
		Customer c = (Customer) sc.getAttribute("uses");
		Transaction t = null;
		c.setACC_NO(c.getACC_NO());
		double amount = Double.parseDouble(req.getParameter("balance"));
		if(amount>0) {
		c.setBalance(c.getBalance() + amount);
		boolean customer = cdao.updateCustomer(c);
		if (customer) {
			t = new Transaction();
			t.setTran_id(Transaction_ID.generateTransactionId());
			t.setUser_acc(c.getACC_NO());
			t.setRec_acc(c.getACC_NO());
			t.setTran_type("CREDITED");
			t.setAmount(+amount);
			t.setBalance(c.getBalance());
			if (tdao.insertTransaction(t) && customer) {
				sc.setAttribute("Success", "Amount Deposit Successfully");
				resp.sendRedirect("User.jsp");
			} else {
				req.setAttribute("Error", "Failed To Deposit Amount");
				req.getRequestDispatcher("Deposite.jsp").forward(req, resp);
			}
		}
	}else {
		req.setAttribute("None", "Enter The Valid Amount");
		req.getRequestDispatcher("Deposite.jsp").forward(req, resp);
	}
}
}