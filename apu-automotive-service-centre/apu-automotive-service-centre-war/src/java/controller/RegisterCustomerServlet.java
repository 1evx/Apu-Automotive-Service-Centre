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

@WebServlet(name = "RegisterCustomerServlet", urlPatterns = {"/RegisterCustomerServlet"})
public class RegisterCustomerServlet extends HttpServlet {

    // Injects the database manager for Customers
    @EJB
    private CustomerFacade customerFacade;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();

        try {
            // 1. Grab all the data from your popup modal
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String phoneNumber = PhoneNumberValidator.normalizeMalaysianPhoneNumber(request.getParameter("phoneNumber"));
            String icNumber = IcNumberValidator.normalizeMalaysianIc(request.getParameter("icNumber"));
            String username = request.getParameter("username");
            String address = request.getParameter("address");
            String password = request.getParameter("password");

            if (!PhoneNumberValidator.isValidMalaysianPhoneNumber(phoneNumber)) {
                session.setAttribute("popupMessage", "Registration failed. Please enter a valid Malaysian phone number starting with 01.");
                session.setAttribute("popupType", "error");
                response.sendRedirect("CounterStaffDashboardServlet#manage-customers");
                return;
            }

            if (!IcNumberValidator.isValidMalaysianIc(icNumber)) {
                session.setAttribute("popupMessage", "Registration failed. Please enter a valid Malaysian IC number in the format YYMMDD-XX-XXXX.");
                session.setAttribute("popupType", "error");
                response.sendRedirect("CounterStaffDashboardServlet#manage-customers");
                return;
            }

            // 2. Build the new Customer object
            Customer newCustomer = new Customer();
            newCustomer.setFullName(fullName);
            newCustomer.setEmail(email);
            newCustomer.setPhoneNumber(phoneNumber);
            newCustomer.setIcNumber(icNumber);
            newCustomer.setUsername(username);
            newCustomer.setAddress(address);
            newCustomer.setPasswordHash(password); // Saves the temporary password
            
            // 3. Set specific Customer fields (New customers start with 0 loyalty points!)
            newCustomer.setLoyaltyPoints(0);

            // 4. Save to Database
            customerFacade.create(newCustomer);
            
            final String targetEmail = email;
            final String customerName = fullName;
            final String tempPass = password;
            
            new Thread(() -> {
                // Ensure you created the utility package and EmailUtility class!
                utility.EmailUtility.sendCustomerWelcomeEmail(targetEmail, customerName, tempPass);
            }).start();

            // 5. Instantly refresh the customer list in the session so the HTML table updates
            List<Customer> updatedList = customerFacade.findAllActive();
            session.setAttribute("customerList", updatedList);

            // 6. Set the Success Popup
            session.setAttribute("popupMessage", fullName + " has been registered successfully!");
            session.setAttribute("popupType", "success");

        } catch (Exception e) {
            e.printStackTrace();
            // If the database rejects it (like a duplicate unique field), trigger the error popup
            session.setAttribute("popupMessage", "Registration failed. Ensure the email, username, phone number, or IC number is not a duplicate.");
            session.setAttribute("popupType", "error");
        }

        // 7. Redirect the user back exactly to the Customers tab
        response.sendRedirect("CounterStaffDashboardServlet#manage-customers");
    }
}
