package controller;

import java.io.IOException;
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

@WebServlet(name = "DeleteCustomerServlet", urlPatterns = {"/DeleteCustomerServlet"})
public class DeleteCustomerServlet extends HttpServlet {

    @EJB
    private CustomerFacade customerFacade;
    
    @EJB
    private AppointmentFacade appointmentFacade;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();

        try {
            Long userId = Long.parseLong(request.getParameter("userId"));
            
            // Find the customer to make sure they exist
            Customer customerToDelete = customerFacade.find(userId);
            
            if (customerToDelete != null) {
        
            boolean isSafeToDelete = !appointmentFacade.hasActiveAppointments(customerToDelete);

            if (isSafeToDelete) {
                customerToDelete.setIsActive(false); 
                customerFacade.edit(customerToDelete); 

                List<Customer> updatedList = customerFacade.findAllActive();
                session.setAttribute("customerList", updatedList);

                session.setAttribute("popupMessage", customerToDelete.getFullName() + " was deactivated successfully.");
                session.setAttribute("popupType", "success");

            } else {
                session.setAttribute("popupMessage", "Action denied! " + customerToDelete.getFullName() + " currently has an active 'Scheduled' or 'In Progress' appointment.");
                session.setAttribute("popupType", "error");
            }

        } else {
            session.setAttribute("popupMessage", "Error: Customer not found.");
            session.setAttribute("popupType", "error");
        }

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("popupMessage", "An error occurred while trying to deactivate this customer account.");
            session.setAttribute("popupType", "error");
        }

        // Send them right back to the customer table
        response.sendRedirect("CounterStaffDashboardServlet#manage-customers");
    }
}