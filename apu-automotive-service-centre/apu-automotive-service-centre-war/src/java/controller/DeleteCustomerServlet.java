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

@WebServlet(name = "DeleteCustomerServlet", urlPatterns = {"/DeleteCustomerServlet"})
public class DeleteCustomerServlet extends HttpServlet {

    @EJB
    private CustomerFacade customerFacade;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();

        try {
            Long userId = Long.parseLong(request.getParameter("userId"));
            
            // Find the customer to make sure they exist
            Customer customerToDelete = customerFacade.find(userId);
            
            if (customerToDelete != null) {
                // Delete them from the database
                customerFacade.remove(customerToDelete);

                // Refresh the table data in the session
                List<Customer> updatedList = customerFacade.findAll();
                session.setAttribute("customerList", updatedList);

                session.setAttribute("popupMessage", customerToDelete.getFullName() + " was deleted successfully.");
                session.setAttribute("popupType", "success");
            } else {
                session.setAttribute("popupMessage", "Error: Customer not found.");
                session.setAttribute("popupType", "error");
            }

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("popupMessage", "Cannot delete this customer. They may have active appointments or payments tied to their account.");
            session.setAttribute("popupType", "error");
        }

        // Send them right back to the customer table
        response.sendRedirect("CounterStaffDashboardServlet#manage-customers");
    }
}