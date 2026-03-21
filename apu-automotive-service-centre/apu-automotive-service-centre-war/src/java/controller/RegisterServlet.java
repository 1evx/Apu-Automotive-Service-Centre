/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Customer;
import model.UserFacade;

/**
 *
 * @author TPY
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {
   @EJB
    private UserFacade userFacade;
   
@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        
        try {
            // Grab form data
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String fullName = request.getParameter("fullName");
            String phone = request.getParameter("phone");

            // Check if email exists
            if (userFacade.emailExists(email)) {
                // Save an error message to the session and send them back
                request.getSession().setAttribute("popupMessage", "Registration Failed: That email is already in use!");
                request.getSession().setAttribute("popupType", "error");
                response.sendRedirect("register.jsp");
                return; // Stop the code here so we don't create a duplicate user!
            }

            // Create the Customer
            Customer newCustomer = new Customer();
            newCustomer.setEmail(email);
            newCustomer.setPasswordHash(password);
            newCustomer.setFullName(fullName);
            newCustomer.setPhoneNumber(phone);

            // Save to database
            boolean isSuccess = userFacade.createUser(newCustomer);

            if (isSuccess) {
                // Save a success message and send them to the login page
                request.getSession().setAttribute("popupMessage", "Registration Successful! You can now log in.");
                request.getSession().setAttribute("popupType", "success");
                response.sendRedirect("login.jsp");
            } else {
                request.getSession().setAttribute("popupMessage", "Registration Failed: Database error.");
                request.getSession().setAttribute("popupType", "error");
                response.sendRedirect("register.jsp");
            }

        } catch (IOException e) {
            // 5. The Safety Net: Catch any unexpected server crashes
            e.printStackTrace(); 
            request.getSession().setAttribute("popupMessage", "A server error occurred. Please try again later.");
            request.getSession().setAttribute("popupType", "error");
            response.sendRedirect("register.jsp");
        }
    }
}
