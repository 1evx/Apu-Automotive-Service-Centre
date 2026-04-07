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
import model.Customer;
import model.CustomerFacade;
import model.ServiceType;
import model.ServiceTypeFacade;
import model.Technician;
import model.SystemUserFacade;

@WebServlet(name = "BookAppointmentServlet", urlPatterns = {"/BookAppointmentServlet"})
public class BookAppointmentServlet extends HttpServlet {

    @EJB
    private AppointmentFacade appointmentFacade;
    @EJB
    private CustomerFacade customerFacade;
    @EJB
    private ServiceTypeFacade serviceTypeFacade;
    @EJB
    private SystemUserFacade systemUserFacade;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // We still need the session to set the popup message
        HttpSession session = request.getSession();

        try {
            // 1. Grab data
            Long customerId = Long.parseLong(request.getParameter("customerId"));
            Long serviceId = Long.parseLong(request.getParameter("serviceId"));
            Long technicianId = Long.parseLong(request.getParameter("technicianId"));
            
            String apptDateString = request.getParameter("appointmentDate");
            String apptTime = request.getParameter("appointmentTime");
            String carPlateNumber = request.getParameter("carPlateNumber");
            String remarks = request.getParameter("remarks");

            // 2. Parse the Date
            SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
            Date parsedDate = dateFormatter.parse(apptDateString);

            // 3. Fetch objects
            Customer customer = customerFacade.find(customerId);
            ServiceType service = serviceTypeFacade.find(serviceId);
            Technician technician = (Technician) systemUserFacade.find(technicianId);

            // =======================================================
            // 4. OVERLAP VALIDATION LOGIC
            // =======================================================
            
            String cleanApptTime = apptTime.trim().toUpperCase();
            DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("hh:mm a", java.util.Locale.US);
            
            // Calculate New Appointment Start Time
            LocalTime newStart = LocalTime.parse(cleanApptTime, timeFormatter);
            
            // THE FIX: Convert New Appointment to absolute minutes
            int newStartMins = (newStart.getHour() * 60) + newStart.getMinute();
            int newEndMins = newStartMins + (service.getDurationHours() * 60);
            
            // Get all appointments for this tech on this specific day
            List<Appointment> dailySchedule = appointmentFacade.findByTechnicianAndDate(technician, parsedDate);
            
            for (Appointment existingAppt : dailySchedule) {
                
                // RULE 1: Ignore jobs that are Cancelled, Completed, or Rejected
                String status = existingAppt.getStatus();
                if (status != null && (status.equalsIgnoreCase("Cancelled") || status.equalsIgnoreCase("Completed") || status.equalsIgnoreCase("Rejected"))) {
                    continue; 
                }

                // RULE 2: Convert Existing Appointment to absolute minutes
                String existingTimeStr = existingAppt.getAppointmentTime().trim().toUpperCase();
                LocalTime existStart = LocalTime.parse(existingTimeStr, timeFormatter);
                
                int existStartMins = (existStart.getHour() * 60) + existStart.getMinute();
                int existEndMins = existStartMins + (existingAppt.getServiceType().getDurationHours() * 60);
                
                // The Overlap Rule (Minutes Comparison)
                if (newStartMins < existEndMins && newEndMins > existStartMins) {
                    // Calculate end time for the error message display
                    LocalTime existEndDisplay = existStart.plusHours(existingAppt.getServiceType().getDurationHours());
                    throw new Exception("The technician is already booked from " + existStart.format(timeFormatter) + " to " + existEndDisplay.format(timeFormatter) + ".");
                }
            }
            // =======================================================

            // 5. If we survived the loop, the timeslot is free! Build the Appointment.
            Appointment newAppointment = new Appointment();
            newAppointment.setCustomer(customer);
            newAppointment.setServiceType(service);
            newAppointment.setTechnician(technician);
            newAppointment.setAppointmentDate(parsedDate);
            newAppointment.setAppointmentTime(apptTime);
            newAppointment.setCarPlateNumber(carPlateNumber);
            newAppointment.setRemarks(remarks);
            newAppointment.setStatus("Scheduled"); 

            // 6. Save to Database
            appointmentFacade.create(newAppointment);

            // Notice we removed the code that manually updates the session list here!
            // The Dashboard Controller will handle fetching the fresh list for us.

            session.setAttribute("popupMessage", "Appointment booked successfully for " + carPlateNumber + "!");
            session.setAttribute("popupType", "success");

        } catch (Exception e) {
            e.printStackTrace();
            // If the overlap check failed, the exception message will be shown to the user!
            String errorMsg = e.getMessage() != null ? e.getMessage() : "Failed to book the appointment.";
            session.setAttribute("popupMessage", errorMsg);
            session.setAttribute("popupType", "error");
        }

        // Redirect to the Dashboard Controller, which loads all the data into the request, then forwards to the JSP
        response.sendRedirect("CounterStaffDashboardServlet#manage-appointments");
    }
}