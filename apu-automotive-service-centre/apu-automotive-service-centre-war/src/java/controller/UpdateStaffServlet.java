/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
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

import model.Manager;
import model.User;
import model.UserFacade;

/**
 *
 * @author TPY
 */
@WebServlet(name = "UpdateStaffServlet", urlPatterns = {"/UpdateStaffServlet"})
public class UpdateStaffServlet extends HttpServlet {

    @EJB
    private UserFacade userFacade;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("currentUser");
        
        // SECURITY CHECK: Only Managers!
        if (currentUser == null || !(currentUser instanceof Manager)) {
            session.setAttribute("popupMessage", "Security Alert: Only Managers can update staff.");
            session.setAttribute("popupType", "error");
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            // Grab the updated data from the Modal
            Long staffId = Long.valueOf(request.getParameter("staffId"));
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");

            // Find the exact user in the database
            User staffToUpdate = userFacade.find(staffId);
            
            if (staffToUpdate != null) {
                // Update their details
                staffToUpdate.setFullName(fullName);
                staffToUpdate.setEmail(email);
                
                // Save the changes to the database
                userFacade.edit(staffToUpdate);

                // Refresh the Dashboard Data!
                List<User> updatedStaffList = userFacade.getAllStaff();
                session.setAttribute("staffList", updatedStaffList);

                session.setAttribute("popupMessage", "Profile for " + fullName + " was successfully updated!");
                session.setAttribute("popupType", "success");
            } else {
                session.setAttribute("popupMessage", "Update Error: Staff member not found.");
                session.setAttribute("popupType", "error");
            }
            
            // Send them back to the Manage Staff tab
            response.sendRedirect("manager_dashboard.jsp#manage-staff");

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("popupMessage", "An error occurred while trying to update the profile.");
            session.setAttribute("popupType", "error");
            response.sendRedirect("manager_dashboard.jsp#manage-staff");
        }
    }
}