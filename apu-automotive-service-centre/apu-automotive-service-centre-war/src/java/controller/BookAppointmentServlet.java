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
import model.TechnicianFacade;

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
    @EJB
    private TechnicianFacade technicianFacade;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setAttribute("customerList", customerFacade.findAllActive());
        request.setAttribute("serviceList", serviceTypeFacade.findAllActive());
        
        request.setAttribute("technicianList", technicianFacade.findAvailableAndActiveTechnicians()); 

        request.getRequestDispatcher("book_appointment.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();

        try {
            Long customerId = Long.parseLong(request.getParameter("customerId"));
            Long serviceId = Long.parseLong(request.getParameter("serviceId"));
            Long technicianId = Long.parseLong(request.getParameter("technicianId"));
            
            String apptDateString = request.getParameter("appointmentDate");
            String apptTime = request.getParameter("appointmentTime");
            String carPlateNumber = request.getParameter("carPlateNumber");
            String remarks = request.getParameter("remarks");

            SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
            Date parsedDate = dateFormatter.parse(apptDateString);

            Customer customer = customerFacade.find(customerId);
            ServiceType service = serviceTypeFacade.find(serviceId);
            Technician technician = (Technician) systemUserFacade.find(technicianId);

            
            String cleanApptTime = apptTime.trim().toUpperCase();
            DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("hh:mm a", java.util.Locale.US);
            
            LocalTime newStart = LocalTime.parse(cleanApptTime, timeFormatter);
            
            int newStartMins = (newStart.getHour() * 60) + newStart.getMinute();
            int newEndMins = newStartMins + (service.getDurationHours() * 60);
            
            //operation hour
            java.util.Calendar cal = java.util.Calendar.getInstance();
            cal.setTime(parsedDate);
            int dayOfWeek = cal.get(java.util.Calendar.DAY_OF_WEEK);
            
            int closingTimeMins;
            String closingTimeDisplay;
            
            if (dayOfWeek == java.util.Calendar.SATURDAY) {
                //satuday until 1pm
                closingTimeMins = 13 * 60;
                closingTimeDisplay = "1:00 PM";
            } else {
                //Monday to Friday
                closingTimeMins = (18 * 60) + 30;
                closingTimeDisplay = "6:30 PM";
            }
            
            if (newEndMins > closingTimeMins) {
                throw new Exception("Cannot book: This " + service.getDurationHours() + 
                        "-hour service will finish after our " + closingTimeDisplay + 
                        " closing time. Please choose an earlier time slot.");
            }
            
            List<Appointment> dailySchedule = appointmentFacade.findByTechnicianAndDate(technician, parsedDate);
            
            //time slot available logic
            for (Appointment existingAppt : dailySchedule) {
                
                String status = existingAppt.getStatus();
                if (status != null && (status.equalsIgnoreCase("Cancelled") || status.equalsIgnoreCase("Completed") || status.equalsIgnoreCase("Rejected"))) {
                    continue; 
                }

                String existingTimeStr = existingAppt.getAppointmentTime().trim().toUpperCase();
                LocalTime existStart = LocalTime.parse(existingTimeStr, timeFormatter);
                
                int existStartMins = (existStart.getHour() * 60) + existStart.getMinute();
                int existEndMins = existStartMins + (existingAppt.getServiceType().getDurationHours() * 60);
                
                if (newStartMins < existEndMins && newEndMins > existStartMins) {
                    LocalTime existEndDisplay = existStart.plusHours(existingAppt.getServiceType().getDurationHours());
                    throw new Exception("The technician is already booked from " + existStart.format(timeFormatter) + " to " + existEndDisplay.format(timeFormatter) + ".");
                }
            }

            Appointment newAppointment = new Appointment();
            newAppointment.setCustomer(customer);
            newAppointment.setServiceType(service);
            newAppointment.setTechnician(technician);
            newAppointment.setAppointmentDate(parsedDate);
            newAppointment.setAppointmentTime(apptTime);
            newAppointment.setCarPlateNumber(carPlateNumber);
            newAppointment.setRemarks(remarks);
            newAppointment.setStatus("Scheduled"); 

            appointmentFacade.create(newAppointment);

            session.setAttribute("popupMessage", "Appointment booked successfully for " + carPlateNumber + "!");
            session.setAttribute("popupType", "success");

        } catch (Exception e) {
            e.printStackTrace();
            String errorMsg = e.getMessage() != null ? e.getMessage() : "Failed to book the appointment.";
            session.setAttribute("popupMessage", errorMsg);
            session.setAttribute("popupType", "error");
        }

        response.sendRedirect("CounterStaffDashboardServlet#manage-appointments");
    }
}