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
import model.*;

/**
 *
 * @author Asus
 */
@WebServlet(name = "ManagerDashboardServlet", urlPatterns = {"/ManagerDashboardServlet"})
public class ManagerDashboardServlet extends HttpServlet {

    @EJB private AppointmentFacade appointmentFacade;
    @EJB private FeedbackFacade feedbackFacade;
    @EJB private ServiceTypeFacade serviceTypeFacade;
    @EJB private PaymentFacade paymentFacade;
    @EJB private CommentFacade commentFacade;
    @EJB private SystemUserFacade systemUserFacade;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Object currentUser = (session != null) ? session.getAttribute("currentUser") : null;

        // BOUNCER: Kick them out if they are NOT a Manager AND NOT a SuperManager
        if (currentUser == null || (!(currentUser instanceof Manager) && !(currentUser instanceof SuperManager))) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Load fresh data into REQUEST scope (dies after page loads)
        request.setAttribute("statJobsCompleted", appointmentFacade.countCompletedJobs());
        request.setAttribute("statTotalRevenue", paymentFacade.calculateTotalRevenue());
        request.setAttribute("staffList", systemUserFacade.getAllStaff());
        request.setAttribute("allFeedbackList", feedbackFacade.findAll());
        request.setAttribute("serviceList", serviceTypeFacade.findAllActive());
        request.setAttribute("allComments", commentFacade.findAll());
        request.setAttribute("allAppointments", appointmentFacade.findAll());
        request.setAttribute("allPayments", paymentFacade.findAll());
        
        // Chart Data
        request.setAttribute("staffPerformance", appointmentFacade.getStaffPerformanceData());
        request.setAttribute("servicePopularity", appointmentFacade.getServicePopularityData());
        request.setAttribute("techRatings", commentFacade.getTechnicianRatingData());

        request.getRequestDispatcher("manager_dashboard.jsp").forward(request, response);
    }
}