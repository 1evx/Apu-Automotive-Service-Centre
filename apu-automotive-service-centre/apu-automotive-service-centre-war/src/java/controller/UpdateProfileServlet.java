package controller;

import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.CounterStaff;
import model.Technician; 
import model.Customer;
import model.Manager;
import model.SystemUser;
import model.SystemUserFacade;
import model.SuperManager;

@WebServlet(name = "UpdateProfileServlet", urlPatterns = {"/UpdateProfileServlet"})
public class UpdateProfileServlet extends HttpServlet {

    @EJB
    private SystemUserFacade systemUserFacade; 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        SystemUser currentUser = (SystemUser) session.getAttribute("currentUser");
        
        // Security Check
        if (currentUser == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            // 1. Grab general data from the HTML form
            Long userId = Long.parseLong(request.getParameter("userId"));
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String phoneNumber = request.getParameter("phoneNumber"); 
            String address = request.getParameter("address");
            String password = request.getParameter("password");

            // 2. Find the fresh user object in the database
            SystemUser userToUpdate = systemUserFacade.find(userId);
            
            if (userToUpdate != null) {
                // 3. Update the standard fields that everyone shares
                userToUpdate.setFullName(fullName);
                userToUpdate.setPhoneNumber(phoneNumber);
                userToUpdate.setAddress(address); 
                
                // Null-check safety measure for the email
                if (email != null && !email.trim().isEmpty()) {
                    userToUpdate.setEmail(email);
                }

                // 4. ROLE-SPECIFIC UPDATES
                if (userToUpdate instanceof SuperManager) {
                    SuperManager superMgr = (SuperManager) userToUpdate;
                    // If you add an input for masterClearance in your JSP later, it will save here
                    if (request.getParameter("masterClearance") != null && !request.getParameter("masterClearance").trim().isEmpty()) {
                        superMgr.setMasterClearance(request.getParameter("masterClearance"));
                    }
                }
                else if (userToUpdate instanceof Manager) {
                    Manager mgr = (Manager) userToUpdate;
                    if (request.getParameter("officeLocation") != null) {
                        mgr.setOfficeLocation(request.getParameter("officeLocation"));
                    }
                } else if (userToUpdate instanceof CounterStaff) {
                    CounterStaff staff = (CounterStaff) userToUpdate;
                    if (request.getParameter("shiftType") != null) {
                        staff.setShiftType(request.getParameter("shiftType")); 
                    }
                } 
                else if (userToUpdate instanceof Technician) {
                    Technician tech = (Technician) userToUpdate;
                    if (request.getParameter("specialization") != null) {
                        tech.setSpecialization(request.getParameter("specialization"));
                    }
                    if (request.getParameter("isAvailable") != null) {
                        boolean available = Boolean.parseBoolean(request.getParameter("isAvailable"));
                        tech.setIsAvailable(available);
                    }
                }

                // 5. Only update the password if they typed something new
                if (password != null && !password.trim().isEmpty()) {
                    userToUpdate.setPasswordHash(password); 
                }

                // 6. Save to Database
                systemUserFacade.edit(userToUpdate);

                // 7. Refresh the Session
                session.setAttribute("currentUser", userToUpdate);

                session.setAttribute("popupMessage", "Your profile has been successfully updated!");
                session.setAttribute("popupType", "success");
            } else {
                session.setAttribute("popupMessage", "Update Error: User record not found.");
                session.setAttribute("popupType", "error");
            }
            
            // 8. Redirect back to the exact dashboard they came from
            if (currentUser instanceof CounterStaff) {
                response.sendRedirect("CounterStaffDashboardServlet#edit-profile");
            } else if (currentUser instanceof Technician) {
                response.sendRedirect("TechnicianDashboardServlet#edit-profile");
            } else if (currentUser instanceof Customer) { 
                response.sendRedirect("CustomerDashboardServlet#edit-profile");
            } else {
                response.sendRedirect("ManagerDashboardServlet#edit-profile"); 
            }

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("popupMessage", "An error occurred while updating your profile.");
            session.setAttribute("popupType", "error");
            
            if (currentUser instanceof CounterStaff) {
                response.sendRedirect("CounterStaffDashboardServlet#edit-profile");
            } else if (currentUser instanceof Technician) {
                response.sendRedirect("TechnicianDashboardServlet#edit-profile");
            } else if (currentUser instanceof Customer) { 
                response.sendRedirect("CustomerDashboardServlet#edit-profile");
            } else {
                response.sendRedirect("ManagerDashboardServlet#edit-profile");
            }
        }
    }
}