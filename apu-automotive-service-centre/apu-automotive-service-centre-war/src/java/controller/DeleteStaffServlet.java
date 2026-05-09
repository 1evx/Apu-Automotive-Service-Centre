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

import model.Manager;
import model.SuperManager;
import model.SystemUser;
import model.SystemUserFacade;
import model.Technician;
import model.AppointmentFacade;
/**
 *
 * @author Asus
 */
@WebServlet(name = "DeleteStaffServlet", urlPatterns = {"/DeleteStaffServlet"})
public class DeleteStaffServlet extends HttpServlet {

    @EJB
    private SystemUserFacade systemUserFacade;
    
    // 1. ADD THE APPOINTMENT FACADE
    @EJB
    private AppointmentFacade appointmentFacade;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        SystemUser currentUser = (SystemUser) session.getAttribute("currentUser");
        
        // SECURITY CHECK: Managers Only
        if (currentUser == null || (!(currentUser instanceof Manager) && !(currentUser instanceof SuperManager))) {
            session.setAttribute("popupMessage", "Security Alert: Only Managers can delete staff.");
            session.setAttribute("popupType", "error");
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            Long userIdToDelete = Long.valueOf(request.getParameter("id"));

            // Prevent Self-Deletion
            if (currentUser.getUserId().equals(userIdToDelete)) {
                session.setAttribute("popupMessage", "Action Denied: You cannot deactivate your own account while logged in.");
                session.setAttribute("popupType", "warning");
                response.sendRedirect("ManagerDashboardServlet#manage-staff");
                return;
            }

            SystemUser userToDelete = systemUserFacade.find(userIdToDelete);
            
            if (userToDelete != null) {
                String deletedName = userToDelete.getFullName(); 
                
                // ==========================================
                // THE NEW GUARDRAIL LOGIC
                // ==========================================
                boolean isSafeToDelete = true;
                
                // Only Technicians have cars assigned to them, so we only check if the user is a Technician
                if (userToDelete instanceof Technician) {
                    Technician techToDelete = (Technician) userToDelete;
                    
                    // Use our new highly efficient Facade method
                    if (appointmentFacade.hasActiveAppointments(techToDelete)) {
                        isSafeToDelete = false;
                    }
                }

                if (isSafeToDelete) {
                    // ==========================================
                    // THE SOFT DELETE 
                    // ==========================================
                    userToDelete.setIsActive(false); 
                    systemUserFacade.edit(userToDelete); 

                    session.setAttribute("popupMessage", "Success! " + deletedName + "'s account has been deactivated.");
                    session.setAttribute("popupType", "success");
                } else {
                    // ==========================================
                    // REJECT THE DELETE (Technician is busy)
                    // ==========================================
                    session.setAttribute("popupMessage", "Action Denied! " + deletedName + " currently has active tasks assigned in the garage.");
                    session.setAttribute("popupType", "error");
                }
                
            } else {
                session.setAttribute("popupMessage", "Error: User not found in the database.");
                session.setAttribute("popupType", "error");
            }
            
            response.sendRedirect("ManagerDashboardServlet#manage-staff");

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("popupMessage", "An error occurred while trying to deactivate the staff member.");
            session.setAttribute("popupType", "error");
            response.sendRedirect("ManagerDashboardServlet#manage-staff");
        }
    }
}