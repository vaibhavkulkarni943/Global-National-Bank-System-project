package com.bank.servlets;

import com.bank.dao.ContactDAO;
import com.bank.dao.ContactDAOImpl;
import com.bank.dto.ContactDTO;
import com.bank.dto.Customer;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/ContactSubmit")
public class ContactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ContactDAO contactDao=null;


    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        

        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("uses");

        if (customer == null) {
            session.setAttribute("Failed", "Session expired. Please login again.");
            response.sendRedirect("Login.jsp");
            return;
        }

        try {
            // Get form data
            String subject = request.getParameter("subject");
            String description = request.getParameter("description");

   

            // Get user data from hidden fields
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");

      
          

            // Create Contact DTO
            ContactDTO contact = new ContactDTO(
                customer.getACC_NO(),
                name,
                email,
                phone,
                subject,
                description
            );

            // Save to database
            contactDao = new ContactDAOImpl(); // Ensure DAO is initialized
            boolean isSaved = contactDao.saveContactRequest(contact);

            

            if (isSaved) {
                request.setAttribute("Success", "Your request has been submitted successfully. We'll contact you soon.");
            } else {
                request.setAttribute("Error", "Failed to submit your request. Please try again.");
            }

            request.getRequestDispatcher("Help.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("Error", "An error occurred while processing your request.");
            request.getRequestDispatcher("Help.jsp").forward(request, response);
        }
    }

}
