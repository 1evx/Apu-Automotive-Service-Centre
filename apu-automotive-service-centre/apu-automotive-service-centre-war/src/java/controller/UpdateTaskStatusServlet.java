package controller;

import java.io.IOException;
import java.util.Date;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Appointment;
import model.AppointmentFacade;
import model.Feedback;
import model.FeedbackFacade;

@WebServlet(name = "UpdateTaskStatusServlet", urlPatterns = {"/UpdateTaskStatusServlet"})
public class UpdateTaskStatusServlet extends HttpServlet {

    @EJB
    private AppointmentFacade appointmentFacade;
    
    @EJB
    private FeedbackFacade feedbackFacade;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();

        try {
            Long apptId = Long.parseLong(request.getParameter("appointmentId"));
            String newStatus = request.getParameter("newStatus");
            
            // Grab the feedback text from the modal
            String techRemarks = request.getParameter("technicianRemarks");

            Appointment appt = appointmentFacade.find(apptId);
            if (appt != null) {
                // 1. Update the appointment status
                appt.setStatus(newStatus);
                appointmentFacade.edit(appt);
                
                // 2. Save the Technician's Report to the Feedback Table
                if (techRemarks != null && !techRemarks.trim().isEmpty()) {
                    Feedback techReport = new Feedback();
                    techReport.setFeedbackType("Technician Report"); // Categorize it
                    techReport.setComments(techRemarks);
                    techReport.setSubmissionDate(new Date());
                    techReport.setAppointment(appt); // Link it to the appointment
                    
                    feedbackFacade.create(techReport);
                }

                // REMOVED: No more manually updating the session list!
                // The TechnicianDashboardServlet will handle fetching the fresh data.
                
                session.setAttribute("popupMessage", "Task updated to " + newStatus + "!");
                session.setAttribute("popupType", "success");
            }

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("popupMessage", "Failed to update task status.");
            session.setAttribute("popupType", "error");
        }

        // CORRECTED: Redirect to the Dashboard Controller, NOT the JSP
        response.sendRedirect("TechnicianDashboardServlet#dashboard-home");
    }
}