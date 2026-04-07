/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import model.Appointment;
import model.Comment;
import model.Feedback;
import model.AppointmentFacade;
import model.CommentFacade;
import model.FeedbackFacade;

import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Asus
 */
@WebServlet(name = "ViewAppointmentDetailsServlet", urlPatterns = {"/ViewAppointmentDetailsServlet"})
public class ViewAppointmentDetailsServlet extends HttpServlet {

    @EJB
    private AppointmentFacade appointmentFacade;

    @EJB
    private CommentFacade commentFacade;

    @EJB
    private FeedbackFacade feedbackFacade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Security Check: Ensure user is logged in
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("currentUser") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // 2. Get the specific Appointment ID clicked by the manager
        String idParam = request.getParameter("id");
        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect("manager_dashboard.jsp#view-feedback");
            return;
        }

        try {
            Long appointmentId = Long.parseLong(idParam);

            // 3. Fetch the Appointment from DB
            Appointment selectedApp = appointmentFacade.find(appointmentId);

            if (selectedApp != null) {
                // 4. Fetch the Internal Report and Customer Rating associated with this Job
                Feedback appFeedback = feedbackFacade.findByAppointmentId(appointmentId);
                Comment appComment = commentFacade.findByAppointmentId(appointmentId);

                // 5. Package the data for the JSP
                request.setAttribute("selectedApp", selectedApp);
                request.setAttribute("appFeedback", appFeedback);
                request.setAttribute("appComment", appComment);

                // 6. Forward the user to the new details page
                request.getRequestDispatcher("appointment_details.jsp").forward(request, response);
            } else {
                response.sendRedirect("manager_dashboard.jsp#view-feedback");
            }

        } catch (NumberFormatException e) {
            // If the URL has text instead of a number, send them back safely
            response.sendRedirect("manager_dashboard.jsp#view-feedback");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}