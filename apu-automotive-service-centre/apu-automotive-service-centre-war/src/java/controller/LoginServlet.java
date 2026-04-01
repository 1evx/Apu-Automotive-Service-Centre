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
import java.util.List;
import model.Appointment;
import model.AppointmentFacade;
import model.CounterStaff;
import model.Customer;
import model.Feedback;
import model.FeedbackFacade;
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
    
    @EJB
    private AppointmentFacade AppointmentFacade;
    
    @EJB
    private FeedbackFacade FeedbackFacade;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        
        try {
            // 1. Grab the inputs from your login form
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            // 2. Basic Validation: Prevent empty submissions
            if (email == null || email.trim().isEmpty() || password == null || password.trim().isEmpty()) {
                request.getSession().setAttribute("popupMessage", "Please enter both your email and password.");
                request.getSession().setAttribute("popupType", "warning");
                response.sendRedirect("login.jsp");
                return;
            }

            // 3. Ask the EJB to check the database
            User user = userFacade.authenticate(email, password);

            // 4. Process the result
            if (user != null) {
                // Success! Create a session and save the user data
                HttpSession session = request.getSession();
                session.setAttribute("currentUser", user);
                // Set a "Welcome" pop-up for when they arrive at their dashboard!
                session.setAttribute("popupMessage", "Welcome back, " + user.getFullName() + "!");
                session.setAttribute("popupType", "success");

                // Role-Based Routing
                if (user instanceof Manager) {
                    
                    List<User> staffList = userFacade.getAllStaff();
                    List<Feedback> allFeedbackList = FeedbackFacade.getAllFeedback();
                    
                    session.setAttribute("staffList", staffList);
                    session.setAttribute("allFeedbackList", allFeedbackList);
                    
                    response.sendRedirect("manager_dashboard.jsp");
                    
                } else if (user instanceof CounterStaff) {
                    response.sendRedirect("counter_dashboard.jsp");
                } else if (user instanceof Technician) {
                    response.sendRedirect("technician_dashboard.jsp");
                } else if (user instanceof Customer) {
                    
                    Customer customer = (Customer) user;
                    
                    List<Appointment> historyList = AppointmentFacade.getAppointmentsByCustomer(customer);
                    List<Feedback> feedbackList = FeedbackFacade.getFeedbackByCustomer(customer);
                    
                    session.setAttribute("historyList", historyList);
                    session.setAttribute("feedbackList", feedbackList);
                    response.sendRedirect("customer_dashboard.jsp");
                    
                } else {
                    // Fallback for missing roles
                    session.setAttribute("popupMessage", "Login Error: Unknown User Role.");
                    session.setAttribute("popupType", "error");
                    response.sendRedirect("login.jsp");
                }
                
            } else {
                // Failure: Wrong email or password
                request.getSession().setAttribute("popupMessage", "Login Failed: Invalid email or password.");
                request.getSession().setAttribute("popupType", "error");
                response.sendRedirect("login.jsp");
            }

        } catch (Exception e) {
            // 5. The Safety Net: Catch database or server crashes
            e.printStackTrace();
            request.getSession().setAttribute("popupMessage", "A server error occurred during login. Please try again.");
            request.getSession().setAttribute("popupType", "error");
            response.sendRedirect("login.jsp");
        }
    }
}
