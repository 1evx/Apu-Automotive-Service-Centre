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
import model.Comment;
import model.AppointmentFacade;
import model.CommentFacade;

@WebServlet(name = "SubmitCommentServlet", urlPatterns = {"/SubmitCommentServlet"})
public class SubmitCommentServlet extends HttpServlet {

    @EJB
    private AppointmentFacade appointmentFacade;
    
    @EJB
    private CommentFacade commentFacade;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();

        try {
            // 1. Get data from the modal form
            Long appointmentId = Long.parseLong(request.getParameter("appointmentId"));
            int rating = Integer.parseInt(request.getParameter("rating"));
            String content = request.getParameter("content");

            // 2. Find the Appointment
            Appointment appt = appointmentFacade.find(appointmentId);

            if (appt != null) {
                // 3. Create and save the new Comment
                Comment newComment = new Comment();
                newComment.setAppointment(appt);
                newComment.setRating(rating);
                newComment.setContent(content);
                newComment.setCommentDate(new Date()); // Current timestamp
                
                commentFacade.create(newComment);

                // REMOVED the old session list logic here. 
                // The CustomerDashboardServlet will handle fetching the fresh comments!

                session.setAttribute("popupMessage", "Thank you! Your review has been submitted.");
                session.setAttribute("popupType", "success");
            }

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("popupMessage", "An error occurred while submitting your review.");
            session.setAttribute("popupType", "error");
        }
        
        // 4. CORRECTED: Send them back to the Controller, NOT the JSP directly!
        response.sendRedirect("CustomerDashboardServlet#history"); 
    }
}