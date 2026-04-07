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
@WebServlet(name = "CustomerDashboardServlet", urlPatterns = {"/CustomerDashboardServlet"})
public class CustomerDashboardServlet extends HttpServlet {

    @EJB private AppointmentFacade appointmentFacade;
    @EJB private FeedbackFacade feedbackFacade;
    @EJB private CommentFacade commentFacade;
    @EJB private ServiceTypeFacade serviceTypeFacade;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || !(session.getAttribute("currentUser") instanceof Customer)) {
            response.sendRedirect("login.jsp");
            return;
        }

        Customer customer = (Customer) session.getAttribute("currentUser");

        request.setAttribute("myAppointments", appointmentFacade.getAppointmentsByCustomer(customer));
        request.setAttribute("myFeedback", feedbackFacade.getFeedbackByCustomer(customer));
        request.setAttribute("myComments", commentFacade.getCommentsByCustomer(customer));
        request.setAttribute("availableServices", serviceTypeFacade.findAllActive());

        request.getRequestDispatcher("customer_dashboard.jsp").forward(request, response);
    }
}
