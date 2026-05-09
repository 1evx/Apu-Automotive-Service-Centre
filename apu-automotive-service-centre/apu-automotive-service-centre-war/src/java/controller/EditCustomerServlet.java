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

import model.Customer;
import model.CustomerFacade;
import utility.IcNumberValidator;
import utility.PhoneNumberValidator;

@WebServlet(name = "EditCustomerServlet", urlPatterns = {"/EditCustomerServlet"})
public class EditCustomerServlet extends HttpServlet {

    @EJB
    private CustomerFacade customerFacade;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();

        try {
            Long userId = Long.parseLong(request.getParameter("userId"));
            
            // Find the specific customer in the database
            Customer customerToUpdate = customerFacade.find(userId);
            
            if (customerToUpdate != null) {
                // Update their details
                customerToUpdate.setFullName(request.getParameter("fullName"));
                customerToUpdate.setEmail(request.getParameter("email"));
                String phoneNumber = PhoneNumberValidator.normalizeMalaysianPhoneNumber(request.getParameter("phoneNumber"));
                customerToUpdate.setAddress(request.getParameter("address"));
                String icNumber = IcNumberValidator.normalizeMalaysianIc(request.getParameter("icNumber"));

                if (!PhoneNumberValidator.isValidMalaysianPhoneNumber(phoneNumber)) {
                    session.setAttribute("popupMessage", "Customer update failed. Please enter a valid Malaysian phone number starting with 01.");
                    session.setAttribute("popupType", "error");
                    response.sendRedirect("CounterStaffDashboardServlet#manage-customers");
                    return;
                }

                if (!IcNumberValidator.isValidMalaysianIc(icNumber)) {
                    session.setAttribute("popupMessage", "Customer update failed. Please enter a valid Malaysian IC number in the format YYMMDD-XX-XXXX.");
                    session.setAttribute("popupType", "error");
                    response.sendRedirect("CounterStaffDashboardServlet#manage-customers");
                    return;
                }

                customerToUpdate.setPhoneNumber(phoneNumber);
                customerToUpdate.setIcNumber(icNumber);
                
                // Parse loyalty points
                int points = Integer.parseInt(request.getParameter("loyaltyPoints"));
                customerToUpdate.setLoyaltyPoints(points);

                // Save to database
                customerFacade.edit(customerToUpdate);

                // Refresh the table data in the session
                List<Customer> updatedList = customerFacade.findAllActive();
                session.setAttribute("customerList", updatedList);

                session.setAttribute("popupMessage", "Customer updated successfully!");
                session.setAttribute("popupType", "success");
            } else {
                session.setAttribute("popupMessage", "Error: Customer not found.");
                session.setAttribute("popupType", "error");
            }

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("popupMessage", "An error occurred while updating the customer. The email, phone number, or IC number may already be in use.");
            session.setAttribute("popupType", "error");
        }

        // Send them right back to the customer table
        response.sendRedirect("CounterStaffDashboardServlet#manage-customers");
    }
}
