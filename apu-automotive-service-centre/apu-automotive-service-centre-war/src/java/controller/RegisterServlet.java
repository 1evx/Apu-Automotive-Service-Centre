package controller;

import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Customer;
import model.CustomerFacade;
import model.SystemUserFacade;
import utility.IcNumberValidator;
import utility.PhoneNumberValidator;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {
    
    @EJB
    private CustomerFacade customerFacade;
    
    @EJB
    private SystemUserFacade systemUserFacade;
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        
        try {
            // 1. Grab all form data
            String email = request.getParameter("email").trim().toLowerCase();
            String username = request.getParameter("username").trim().toLowerCase();
            String password = request.getParameter("password");
            String phoneNumber = PhoneNumberValidator.normalizeMalaysianPhoneNumber(request.getParameter("phone")); 
            String fullName = request.getParameter("fullName").trim().toLowerCase(); 
            String icNumber = IcNumberValidator.normalizeMalaysianIc(request.getParameter("icNumber")); 
            String address = request.getParameter("address").trim().toLowerCase();
            
            if (!PhoneNumberValidator.isValidMalaysianPhoneNumber(phoneNumber)) {
                request.getSession().setAttribute("popupMessage", "Registration Failed: Please enter a valid Malaysian phone number starting with 01.");
                request.getSession().setAttribute("popupType", "error");
                response.sendRedirect("register.jsp");
                return;
            }

            if (!IcNumberValidator.isValidMalaysianIc(icNumber)) {
                request.getSession().setAttribute("popupMessage", "Registration Failed: Please enter a valid Malaysian IC number in the format YYMMDD-XX-XXXX.");
                request.getSession().setAttribute("popupType", "error");
                response.sendRedirect("register.jsp");
                return;
            }

            // 2. Check if email exists
            if (systemUserFacade.emailExists(email)) {
                request.getSession().setAttribute("popupMessage", "Registration Failed: That email is already in user!");
                request.getSession().setAttribute("popupType", "error");
                response.sendRedirect("register.jsp");
                return; 
            }

            // 3. Create the Customer
            // THE FIX 2: Pass 'fullName' into the constructor instead of the undefined 'name'
            Customer newCustomer = new Customer(username, email, password, fullName, phoneNumber, icNumber, address);

            // 4. Save to database 
            try {
                customerFacade.create(newCustomer);
                request.getSession().setAttribute("popupMessage", "Registration Successful! You can now log in.");
                request.getSession().setAttribute("popupType", "success");
                response.sendRedirect("login.jsp");
                
            } catch (Exception e) {
                // If the database crashes (e.g., they used a duplicate unique field)
                request.getSession().setAttribute("popupMessage", "Registration Failed: Username, phone number, or IC number already taken.");
                request.getSession().setAttribute("popupType", "error");
                response.sendRedirect("register.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace(); 
            request.getSession().setAttribute("popupMessage", "A server error occurred. Please try again later.");
            request.getSession().setAttribute("popupType", "error");
            response.sendRedirect("register.jsp");
        }
    }
}
