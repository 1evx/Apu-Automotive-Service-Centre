package controller;

import auth.AuthRoles;
import auth.AuthSupport;
import auth.AuthenticatedUserSession;
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
import model.CustomerFacade;
import model.Feedback;
import model.FeedbackFacade;
import model.Manager;
import model.Payment;
import model.PaymentFacade;
import model.ServiceType;
import model.ServiceTypeFacade;
import model.SuperManager;
import model.Technician;
import model.SystemUser;
import model.SystemUserFacade;
import model.Comment;
import model.CommentFacade;


@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {
    // Injects your new Facade
    @EJB
    private SystemUserFacade SystemUserFacade;
    
    @EJB
    private AppointmentFacade AppointmentFacade;
    
    @EJB
    private FeedbackFacade FeedbackFacade;
    
    @EJB
    private ServiceTypeFacade ServiceTypeFacade;
    
    @EJB
    private CustomerFacade CustomerFacade;
    
    @EJB
    private PaymentFacade PaymentFacade;
    
    @EJB
    private CommentFacade CommentFacade;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        
        try {
            String email = request.getParameter("email").trim().toLowerCase();
            String password = request.getParameter("password");

            if (email == null || email.trim().isEmpty() || password == null || password.trim().isEmpty()) {
                request.getSession().setAttribute("popupMessage", "Please enter both your email and password.");
                request.getSession().setAttribute("popupType", "warning");
                response.sendRedirect("login.jsp");
                return;
            }

            SystemUser user = SystemUserFacade.authenticate(email, password);

            if (user != null) {
                HttpSession existingSession = request.getSession(false);
                if (existingSession != null) {
                    existingSession.invalidate();
                }

                HttpSession session = request.getSession(true);
                String role = AuthRoles.fromUser(user);
                session.setAttribute(AuthSupport.AUTH_USER_SESSION_KEY,
                        new AuthenticatedUserSession(user.getUserId(), role, user.getFullName()));
                session.setAttribute(AuthSupport.LEGACY_ROLE_SESSION_KEY, AuthRoles.toLegacySessionRole(role));
                session.setAttribute("popupMessage", "Welcome back, " + user.getFullName() + "!");
                session.setAttribute("popupType", "success");

                // Role-Based Routing
                if (AuthRoles.MANAGER.equals(role) || AuthRoles.SUPER_MANAGER.equals(role)) {
                    // Send BOTH of them to the exact same dashboard
                    response.sendRedirect("ManagerDashboardServlet");
                } else if (AuthRoles.COUNTER_STAFF.equals(role)) {
                    response.sendRedirect("CounterStaffDashboardServlet");
                } else if (AuthRoles.TECHNICIAN.equals(role)) {
                    response.sendRedirect("TechnicianDashboardServlet");
                } else if (AuthRoles.CUSTOMER.equals(role)) {
                    response.sendRedirect("CustomerDashboardServlet#current-appointments");
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
            e.printStackTrace();
            request.getSession().setAttribute("popupMessage", "A server error occurred during login. Please try again.");
            request.getSession().setAttribute("popupType", "error");
            response.sendRedirect("login.jsp");
        }
    }
}
