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
import model.ServiceType;
import model.ServiceTypeFacade;
import model.SuperManager;
import model.Technician;
import model.SystemUser;
import model.SystemUserFacade;


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
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        
        try {
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            if (email == null || email.trim().isEmpty() || password == null || password.trim().isEmpty()) {
                request.getSession().setAttribute("popupMessage", "Please enter both your email and password.");
                request.getSession().setAttribute("popupType", "warning");
                response.sendRedirect("login.jsp");
                return;
            }

            SystemUser user = SystemUserFacade.authenticate(email, password);

            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("currentUser", user);
                session.setAttribute("popupMessage", "Welcome back, " + user.getFullName() + "!");
                session.setAttribute("popupType", "success");

                // Role-Based Routing
                if (user instanceof Manager) {
                    
                    List<SystemUser> staffList = SystemUserFacade.getAllStaff();
                    List<Feedback> allFeedbackList = FeedbackFacade.findAll();
                    List<ServiceType> serviceList = ServiceTypeFacade.findAll();
                    
                    session.setAttribute("staffList", staffList);
                    session.setAttribute("allFeedbackList", allFeedbackList);
                    session.setAttribute("serviceList", serviceList);
                    
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
            e.printStackTrace();
            request.getSession().setAttribute("popupMessage", "A server error occurred during login. Please try again.");
            request.getSession().setAttribute("popupType", "error");
            response.sendRedirect("login.jsp");
        }
    }
    }