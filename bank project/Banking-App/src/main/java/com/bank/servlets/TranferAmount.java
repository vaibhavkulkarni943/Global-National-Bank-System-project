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

@WebServlet("/Filled")
public class TranferAmount extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		CustomerDAO cdao = new CustomerDAOimpl();
		HttpSession sc = req.getSession(false);
		Customer sender = (Customer) sc.getAttribute("uses");
		Transaction t1 = null;
		Transaction t2 = null;
		TransactionDAO tdao = new TransationDAOimpl();
		double amount = Double.parseDouble(req.getParameter("balance"));
		Customer receiver = cdao.getCustomer(Long.parseLong(req.getParameter("Acc_no")));
		if(receiver!=null) {
		if (sender.getACC_NO() != receiver.getACC_NO()&&receiver!=null && sender.getBalance() > 0 && sender.getBalance() >= amount) {
			int pin = Integer.parseInt(req.getParameter("pin"));
			if (sender.getPin() == pin) {
				sender.setBalance(sender.getBalance() - amount);
				boolean sender_res = cdao.updateCustomer(sender);
				if (sender_res) {
					t1 = new Transaction();
					t1.setTran_id(Transaction_ID.generateTransactionId());
					t1.setUser_acc(sender.getACC_NO());
					t1.setRec_acc(receiver.getACC_NO());
					t1.setTran_type("DEBITED");
					t1.setAmount(amount);
					t1.setBalance(sender.getBalance());
				}
				receiver.setBalance(receiver.getBalance() + amount);
				boolean receiver_res = cdao.updateCustomer(receiver);
				if (receiver_res) {
					t2 = new Transaction();
					t2.setTran_id(t1.getTran_id());
					t2.setUser_acc(receiver.getACC_NO());
					t2.setRec_acc(sender.getACC_NO());
					t2.setTran_type("CREDITED");
					t2.setAmount(amount);
					t2.setBalance(receiver.getBalance());
				}
				if (tdao.insertTransaction(t1) && tdao.insertTransaction(t2)) {
					sc.setAttribute("Success", "Transaction Successful");
					resp.sendRedirect("User.jsp");
				}else {
					req.setAttribute("Failed", "Transaction Failed");
					resp.sendRedirect("TranferAmount.jsp");
				}
			}else {
				req.setAttribute("Mismatch", "Password Mismatch");
				resp.sendRedirect("TranferAmount.jsp");
			}
		}else {
			req.setAttribute("Error", "Enter The Valid Data");
			resp.sendRedirect("TranferAmount.jsp");
		}
		}else {
			req.setAttribute("InvalidAcc", "Invalid Account Number");
			resp.sendRedirect("TranferAmount.jsp");
		}
	}
}
