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

            String cleanApptTime = apptTime.trim().toUpperCase();
            DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("hh:mm a", java.util.Locale.US);
            
            LocalTime newStart = LocalTime.parse(cleanApptTime, timeFormatter);

            int newStartMins = (newStart.getHour() * 60) + newStart.getMinute();
            int newEndMins = newStartMins + (service.getDurationHours() * 60);

            //operation hour logic
            java.util.Calendar cal = java.util.Calendar.getInstance();
            cal.setTime(parsedDate);
            int dayOfWeek = cal.get(java.util.Calendar.DAY_OF_WEEK);
            
            int closingTimeMins;
            String closingTimeDisplay;
            
            if (dayOfWeek == java.util.Calendar.SATURDAY) {
                closingTimeMins = 13 * 60; //1:00 PM is 13 hours * 60 mins = 780 for saturday
                closingTimeDisplay = "1:00 PM";
            } else {
                //Monday to Friday
                closingTimeMins = (18 * 60) + 30; // 6:30 PM is 18.5 hours = 1110
                closingTimeDisplay = "6:30 PM";
            }
            
            if (newEndMins > closingTimeMins) {
                throw new Exception("Cannot save edit: This " + service.getDurationHours() + 
                        "-hour service will finish after our " + closingTimeDisplay + 
                        " closing time. Please choose an earlier time slot.");
            }

            //prevent overlap timeslot for technician
            List<Appointment> dailySchedule = appointmentFacade.findByTechnicianAndDate(technician, parsedDate);
            
            for (Appointment existingAppt : dailySchedule) {
                
                if (existingAppt.getId().equals(apptId)) {
                    continue; 
                }
                
                String existingStatus = existingAppt.getStatus();
                if (existingStatus != null && (existingStatus.equalsIgnoreCase("Cancelled") || existingStatus.equalsIgnoreCase("Completed") || existingStatus.equalsIgnoreCase("Rejected"))) {
                    continue; 
                }

                String existingTimeStr = existingAppt.getAppointmentTime().trim().toUpperCase();
                LocalTime existStart = LocalTime.parse(existingTimeStr, timeFormatter);
                
                LocalTime existEndDisplay = existStart.plusHours(existingAppt.getServiceType().getDurationHours());

                int existStartMins = (existStart.getHour() * 60) + existStart.getMinute();
                int existEndMins = existStartMins + (existingAppt.getServiceType().getDurationHours() * 60);

                if (newStartMins < existEndMins && newEndMins > existStartMins) {
                    throw new Exception("The technician is already booked from " + existStart.format(timeFormatter) + " to " + existEndDisplay.format(timeFormatter) + ".");
                }
            }

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