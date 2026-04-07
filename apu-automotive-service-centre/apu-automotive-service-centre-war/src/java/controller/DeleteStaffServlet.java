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
import model.SystemUser;
import model.SystemUserFacade;

/**
 *
 * @author Asus
 */
@WebServlet(name = "DeleteStaffServlet", urlPatterns = {"/DeleteStaffServlet"})
public class DeleteStaffServlet extends HttpServlet {

    @EJB
    private SystemUserFacade systemUserFacade;

    // Use doGet because the delete button is a standard <a> hyperlink!
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        SystemUser currentUser = (SystemUser) session.getAttribute("currentUser");
        
        // 1. SECURITY CHECK: Managers Only
        if (currentUser == null || !(currentUser instanceof Manager)) {
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
                // THE SOFT DELETE FIX
                // ==========================================
                userToDelete.setIsActive(false); // Flip the switch
                systemUserFacade.edit(userToDelete); // Save the update

                session.setAttribute("popupMessage", "Success! " + deletedName + "'s account has been removed.");
                session.setAttribute("popupType", "success");
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
