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
                customerToUpdate.setPhoneNumber(request.getParameter("phoneNumber"));
                customerToUpdate.setAddress(request.getParameter("address"));
                
                // Parse loyalty points
                int points = Integer.parseInt(request.getParameter("loyaltyPoints"));
                customerToUpdate.setLoyaltyPoints(points);

                // Save to database
                customerFacade.edit(customerToUpdate);

                // Refresh the table data in the session
                List<Customer> updatedList = customerFacade.findAll();
                session.setAttribute("customerList", updatedList);

                session.setAttribute("popupMessage", "Customer updated successfully!");
                session.setAttribute("popupType", "success");
            } else {
                session.setAttribute("popupMessage", "Error: Customer not found.");
                session.setAttribute("popupType", "error");
            }

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("popupMessage", "An error occurred while updating the customer.");
            session.setAttribute("popupType", "error");
        }

        // Send them right back to the customer table
        response.sendRedirect("CounterStaffDashboardServlet#manage-customers");
    }
}