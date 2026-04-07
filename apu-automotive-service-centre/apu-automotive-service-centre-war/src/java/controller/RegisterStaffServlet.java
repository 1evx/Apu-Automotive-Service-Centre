/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
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
import model.Manager;
import model.Technician;
import model.SystemUser;
import model.SuperManager;
import model.SystemUserFacade;

/**
 *
 * @author TPY
 */

@WebServlet(name = "RegisterStaffServlet", urlPatterns = {"/RegisterStaffServlet"})
public class RegisterStaffServlet extends HttpServlet {

    @EJB
    private SystemUserFacade SystemUserFacade;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        SystemUser currentUser = (SystemUser) session.getAttribute("currentUser");
        
        // 1. UPDATE THE BOUNCER: Allow BOTH Manager and SuperManager to access this Servlet
        if (currentUser == null || (!(currentUser instanceof Manager) && !(currentUser instanceof SuperManager))) {
            session.setAttribute("popupMessage", "Security Alert: Only authorized management can register new staff.");
            session.setAttribute("popupType", "error");
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            // 1. Grab all standard data from the Modal
            String role = request.getParameter("role");
            String fullName = request.getParameter("fullName");
            String username = request.getParameter("username"); 
            String email = request.getParameter("email");
            String icNumber = request.getParameter("icNumber"); 
            String password = request.getParameter("password");
            String phoneNumber = request.getParameter("phoneNumber"); 
            String address = request.getParameter("address");         

            // 2. Create the Correct Object Based on the Dropdown Role
            SystemUser newStaff = null;
            switch (role) {
                case "Manager":
                    if (!(currentUser instanceof SuperManager)) {
                        session.setAttribute("popupMessage", "Access Denied: Only a Super Manager can register new Managers.");
                        session.setAttribute("popupType", "error");
                        // Send them back to the dashboard where they came from
                        response.sendRedirect("ManagerDashboardServlet#manage-staff");
                        return; // Stop execution immediately!
                    }
                    
                    newStaff = new Manager();
                    String officeLocation = request.getParameter("officeLocation");
                    ((Manager) newStaff).setOfficeLocation(officeLocation);
                    break;
                    
                case "CounterStaff":
                    newStaff = new CounterStaff();
                    String shiftType = request.getParameter("shiftType");
                    ((CounterStaff) newStaff).setShiftType(shiftType != null ? shiftType : "Morning (8AM - 4PM)");
                    break;
                    
                case "Technician":
                    newStaff = new Technician();
                    String specialization = request.getParameter("specialization");
                    ((Technician) newStaff).setSpecialization(specialization != null && !specialization.isEmpty() ? specialization : "General Service");
                    ((Technician) newStaff).setIsAvailable(true);
                    break;
                    
                default:
                    throw new IllegalArgumentException("Invalid role selected.");
            }

            // 3. Fill the object with the standard data
            newStaff.setFullName(fullName);
            newStaff.setUsername(username); 
            newStaff.setEmail(email);
            newStaff.setIcNumber(icNumber); 
            newStaff.setPhoneNumber(phoneNumber); 
            newStaff.setAddress(address);         
            newStaff.setPasswordHash(password);
            newStaff.setIsActive(true); // Ensure they are active upon creation!

            // 4. Save the new staff member to the database!
            SystemUserFacade.create(newStaff);

            session.setAttribute("popupMessage", "Success! " + fullName + " has been registered as a " + role + ".");
            session.setAttribute("popupType", "success");
            
            response.sendRedirect("ManagerDashboardServlet#manage-staff");

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("popupMessage", "Registration Failed. The Email, Username, or IC Number might already be in use.");
            session.setAttribute("popupType", "error");
            
            response.sendRedirect("ManagerDashboardServlet#manage-staff");
        }
    }
}