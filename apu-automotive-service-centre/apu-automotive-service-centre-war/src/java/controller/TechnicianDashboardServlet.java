/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
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
@WebServlet(name = "TechnicianDashboardServlet", urlPatterns = {"/TechnicianDashboardServlet"})
public class TechnicianDashboardServlet extends HttpServlet {

    @EJB private AppointmentFacade appointmentFacade;
    @EJB private CommentFacade commentFacade;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || !(session.getAttribute("currentUser") instanceof Technician)) {
            response.sendRedirect("login.jsp");
            return;
        }

        Technician tech = (Technician) session.getAttribute("currentUser");

        // Fetch tasks assigned specifically to this technician
        List<Appointment> myTasks = appointmentFacade.findByTechnician(tech);
        
        // Filter comments for this technician's jobs
        List<Comment> myComments = new ArrayList<>();
        for (Comment c : commentFacade.findAll()) {
            if (c.getAppointment().getTechnician() != null && 
                c.getAppointment().getTechnician().getUserId().equals(tech.getUserId())) {
                myComments.add(c);
            }
        }

        request.setAttribute("myTasks", myTasks);
        request.setAttribute("myComments", myComments);

        request.getRequestDispatcher("technician_dashboard.jsp").forward(request, response);
    }
}
