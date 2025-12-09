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


@WebServlet("/Delete")
public class Delete extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		CustomerDAO cdao=new CustomerDAOimpl();
		TransactionDAO tdao = new TransationDAOimpl();
		Customer c1 = cdao.getCustomer(Long.parseLong(req.getParameter("Acc_no")));
		Customer c2 = cdao.getCustomer(Long.parseLong(req.getParameter("NAcc_no")));
        
		if(c1!=null &&c2!=null &&c1.getACC_NO()!=c2.getACC_NO()) {
			c2.setBalance(c1.getBalance()+c2.getBalance());
			boolean update = cdao.updateCustomer(c2);
			if(update) {
				Transaction t = new Transaction();
				t.setTran_id(Transaction_ID.generateTransactionId());
				t.setUser_acc(c2.getACC_NO());
				t.setRec_acc(c1.getACC_NO());
				t.setTran_type("CREDITED");
				t.setAmount(c1.getBalance());
				t.setBalance(c2.getBalance());
				boolean res1=tdao.insertTransaction(t);
				 if(cdao.deleteCustomer(c1) && res1 && update) {
					 HttpSession session = req.getSession(false); 
	                    if (c2.getACC_NO() == 1100110011) {
	                        session.setAttribute("uses", c2); 
	                    }
					 req.setAttribute("Account", "Account Deleted Successfully And Amount Tranfer to Nominee Account");
					 req.getRequestDispatcher("Customer.jsp").forward(req, resp);
				 }
				 else {
					 req.setAttribute("Error","Failed To Delete");
					 req.getRequestDispatcher("Delete.jsp").forward(req, resp);
				 }
			}
		}else {
			 req.setAttribute("Error","Check To Account Number");
			 req.getRequestDispatcher("Customer.jsp").forward(req, resp);
		}
		
	}
}
