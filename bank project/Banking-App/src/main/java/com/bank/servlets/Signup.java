package com.bank.servlets;

import java.io.IOException;
import java.util.Objects;

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

@WebServlet("/Signup")
public class Signup extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CustomerDAO cado = new CustomerDAOimpl();
        Customer c = new Customer();
        c.setName(req.getParameter("name"));
        c.setPhone(Long.parseLong(req.getParameter("phone")));
        c.setMail(req.getParameter("mail"));
        int pin = Integer.parseInt(req.getParameter("pin"));
        int confirm_pin = Integer.parseInt(req.getParameter("conform-pin"));
        
        HttpSession session = req.getSession();
        
        if (pin != confirm_pin) {
            session.setAttribute("Failed", "PIN mismatch - please make sure both PINs match");
            resp.sendRedirect("Signup.jsp");
            return;
        }
        
        c.setPin(pin);
        Customer existingCustomer = cado.getCustomer(c.getPhone(), c.getMail());
        
        if (existingCustomer != null) {
            session.setAttribute("Failed", "User already exists - please login instead");
            resp.sendRedirect("Signup.jsp");
            return;
        }
        
        // Insert customer and get the generated account number
        Customer newCustomer = cado.insertCustomer(c);
        
        if (newCustomer != null && newCustomer.getACC_NO() > 0) {
            // Store success message and account number in session
            session.setAttribute("Success", "Account created successfully!");
            session.setAttribute("NewAccountNumber", newCustomer.getACC_NO());
            resp.sendRedirect("Login.jsp");
        } else {
            session.setAttribute("Failed", "Failed to create account - please try again");
            resp.sendRedirect("Signup.jsp");
        }
    }
}