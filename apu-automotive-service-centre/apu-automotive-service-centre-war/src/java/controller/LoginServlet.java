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
import javax.servlet.http.HttpSession;
import model.CounterStaff;
import model.Customer;
import model.Manager;
import model.Technician;
import model.User;
import model.UserFacade;

/**
 *
 * @author TPY
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {
// This injects your Business Tier (EJB) into the Presentation Tier (Servlet)
    @EJB
    private UserFacade userFacade;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Grab the inputs from your Bootstrap login.jsp form
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Ask the EJB to check the database for these credentials
        User user = userFacade.authenticate(email, password);

        // Process the result
        if (user != null) {
            // Success! Create a session and save the user data for later use
            HttpSession session = request.getSession();
            session.setAttribute("currentUser", user);

            // 4. Role-Based Routing using JPA Inheritance
            if (user instanceof Manager) {
                response.sendRedirect("manager_dashboard.jsp");
                return; // CRITICAL: Stops execution to prevent Server Error 500
                
            } else if (user instanceof CounterStaff) {
                response.sendRedirect("counter_dashboard.jsp");
                return;
                
            } else if (user instanceof Technician) {
                response.sendRedirect("technician_dashboard.jsp");
                return;
                
            } else if (user instanceof Customer) {
                response.sendRedirect("customer_dashboard.jsp");
                return;
                
            } else {
                // Fallback just in case a user has no defined role
                response.sendRedirect("login.jsp?error=UnknownRole");
                return;
            }
            
        } else {
            // Failure: User is null, meaning wrong email or password
            response.sendRedirect("login.jsp?error=InvalidCredentials");
            return;
        }
    }
}
