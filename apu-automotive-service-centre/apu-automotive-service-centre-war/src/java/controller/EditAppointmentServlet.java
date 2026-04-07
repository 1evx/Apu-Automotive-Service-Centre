/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Appointment;
import model.AppointmentFacade;
import model.ServiceType;
import model.ServiceTypeFacade;
import model.Technician;
import model.SystemUserFacade;

@WebServlet(name = "EditAppointmentServlet", urlPatterns = {"/EditAppointmentServlet"})
public class EditAppointmentServlet extends HttpServlet {

    @EJB
    private AppointmentFacade appointmentFacade;
    @EJB
    private ServiceTypeFacade serviceTypeFacade;
    @EJB
    private SystemUserFacade systemUserFacade;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();

        try {
            Long apptId = Long.parseLong(request.getParameter("appointmentId"));
            Appointment appt = appointmentFacade.find(apptId);
            
            // Backend Security Check: Prevent editing if already Completed or Paid
            if (appt.getStatus().equals("Completed") || appt.getStatus().equals("Paid")) {
                throw new Exception("Cannot edit an appointment that is already Completed or Paid.");
            }

            Long serviceId = Long.parseLong(request.getParameter("serviceId"));
            Long technicianId = Long.parseLong(request.getParameter("technicianId"));
            String apptDateString = request.getParameter("appointmentDate");
            String apptTime = request.getParameter("appointmentTime");
            String carPlateNumber = request.getParameter("carPlateNumber");
            String remarks = request.getParameter("remarks");
            String status = request.getParameter("status");

            SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
            Date parsedDate = dateFormatter.parse(apptDateString);

            ServiceType service = serviceTypeFacade.find(serviceId);
            Technician technician = (Technician) systemUserFacade.find(technicianId);

            // =======================================================
            // BULLETPROOF OVERLAP VALIDATION LOGIC
            // =======================================================
            
            // 1. Clean the time string and use US Locale for safe parsing
            String cleanApptTime = apptTime.trim().toUpperCase();
            DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("hh:mm a", java.util.Locale.US);
            
            // Calculate New Appointment Start & End Times
            LocalTime newStart = LocalTime.parse(cleanApptTime, timeFormatter);
            LocalTime newEnd = newStart.plusHours(service.getDurationHours());
            
            // Get all appointments for this tech on this specific day
            List<Appointment> dailySchedule = appointmentFacade.findByTechnicianAndDate(technician, parsedDate);
            
            for (Appointment existingAppt : dailySchedule) {
                
                // RULE 1: THE CRITICAL EDIT RULE: Skip checking against the exact appointment we are currently editing!
                if (existingAppt.getId().equals(apptId)) {
                    continue; 
                }
                
                // RULE 2: Ignore jobs that are Cancelled, Completed, or Rejected!
                String existingStatus = existingAppt.getStatus();
                if (existingStatus != null && (existingStatus.equalsIgnoreCase("Cancelled") || existingStatus.equalsIgnoreCase("Completed") || existingStatus.equalsIgnoreCase("Rejected"))) {
                    continue; 
                }

                // RULE 3: Calculate Existing Appointment Times
                String existingTimeStr = existingAppt.getAppointmentTime().trim().toUpperCase();
                LocalTime existStart = LocalTime.parse(existingTimeStr, timeFormatter);
                
                // Keep LocalTime for the error message popup
                LocalTime existEndDisplay = existStart.plusHours(existingAppt.getServiceType().getDurationHours());

                // THE FIX: Convert everything to absolute minutes to defeat the Midnight Wrap-Around Bug!
                int newStartMins = (newStart.getHour() * 60) + newStart.getMinute();
                int newEndMins = newStartMins + (service.getDurationHours() * 60);
                
                int existStartMins = (existStart.getHour() * 60) + existStart.getMinute();
                int existEndMins = existStartMins + (existingAppt.getServiceType().getDurationHours() * 60);
                
                // The Overlap Rule (using minutes instead of the broken LocalTime check)
                if (newStartMins < existEndMins && newEndMins > existStartMins) {
                    throw new Exception("The technician is already booked from " + existStart.format(timeFormatter) + " to " + existEndDisplay.format(timeFormatter) + ".");
                }
            }
            // =======================================================

            // Update the Appointment
            appt.setServiceType(service);
            appt.setTechnician(technician);
            appt.setAppointmentDate(parsedDate);
            appt.setAppointmentTime(apptTime);
            appt.setCarPlateNumber(carPlateNumber);
            appt.setRemarks(remarks);
            appt.setStatus(status);

            appointmentFacade.edit(appt);

            session.setAttribute("popupMessage", "Appointment updated successfully!");
            session.setAttribute("popupType", "success");

        } catch (Exception e) {
            e.printStackTrace();
            String errorMsg = e.getMessage() != null ? e.getMessage() : "Failed to update the appointment.";
            session.setAttribute("popupMessage", errorMsg);
            session.setAttribute("popupType", "error");
        }

        // REDIRECT TO THE CONTROLLER, NOT THE JSP
        response.sendRedirect("CounterStaffDashboardServlet#manage-appointments");
    }
}