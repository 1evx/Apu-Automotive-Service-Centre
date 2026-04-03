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
import model.User;
import model.UserFacade;

/**
 *
 * @author TPY
 */
@WebServlet(name = "UpdateProfileServlet", urlPatterns = {"/UpdateProfileServlet"})
public class UpdateProfileServlet extends HttpServlet {

    @EJB
    private UserFacade userFacade;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("currentUser");
        
        // Security Check
        if (currentUser == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            // 1. Grab data from the HTML form
            Long userId = Long.parseLong(request.getParameter("userId"));
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone"); // Maps to phoneNumber in Java
            String address = request.getParameter("address");
            String shiftType = request.getParameter("shiftType");
            String password = request.getParameter("password");

            // 2. Find the fresh user object in the database
            User userToUpdate = userFacade.find(userId);
            
            if (userToUpdate != null) {
                // 3. Update the standard fields
                userToUpdate.setFullName(fullName);
                userToUpdate.setEmail(email);
                userToUpdate.setPhoneNumber(phone);
                userToUpdate.setAddress(address); 

                // 4. Update specific Counter Staff fields
                if (userToUpdate instanceof CounterStaff) {
                    CounterStaff staff = (CounterStaff) userToUpdate;
                    staff.setShiftType(shiftType); 
                }

                // 5. Only update the password if they typed something new!
                if (password != null && !password.trim().isEmpty()) {
                    userToUpdate.setPasswordHash(password); 
                }

                // 6. Save to Database
                userFacade.edit(userToUpdate);

                // 7. Refresh the Session! (This makes the UI update instantly)
                session.setAttribute("currentUser", userToUpdate);

                session.setAttribute("popupMessage", "Your profile has been successfully updated!");
                session.setAttribute("popupType", "success");
            } else {
                session.setAttribute("popupMessage", "Update Error: User record not found.");
                session.setAttribute("popupType", "error");
            }
            
            // 8. Redirect back to the correct dashboard tab
            if (currentUser instanceof CounterStaff) {
                response.sendRedirect("counter_dashboard.jsp#my-profile");
            } else {
                response.sendRedirect("manager_dashboard.jsp#my-profile"); // Reusable for Managers!
            }

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("popupMessage", "An error occurred while updating your profile.");
            session.setAttribute("popupType", "error");
            response.sendRedirect("counter_dashboard.jsp#my-profile");
        }
    }
}
