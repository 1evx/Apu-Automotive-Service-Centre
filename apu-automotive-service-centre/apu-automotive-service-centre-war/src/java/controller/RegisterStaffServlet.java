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

import model.CounterStaff;
import model.Manager;
import model.Technician;
import model.User;
import model.UserFacade;

/**
 *
 * @author TPY
 */

@WebServlet(name = "RegisterStaffServlet", urlPatterns = {"/RegisterStaffServlet"})
public class RegisterStaffServlet extends HttpServlet {

    @EJB
    private UserFacade userFacade;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("currentUser");
        
        // SECURITY CHECK: Ensure only logged-in Managers can do this
        if (currentUser == null || !(currentUser instanceof Manager)) {
            session.setAttribute("popupMessage", "Security Alert: Only Managers can register new staff.");
            session.setAttribute("popupType", "error");
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            // Grab the data from the Modal form
            String role = request.getParameter("role");
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            // Create the Correct Object Based on the Dropdown Role
            User newStaff = null;
            switch (role) {
                case "Manager":
                    newStaff = new Manager();
                    break;
                case "CounterStaff":
                    newStaff = new CounterStaff();
                    break;
                case "Technician":
                    newStaff = new Technician();
                    break;
                default:
                    throw new IllegalArgumentException("Invalid role selected.");
            }

            // Fill the object with the form data
            newStaff.setFullName(fullName);
            newStaff.setEmail(email);
            newStaff.setPasswordHash(password);

            // Save the new staff member to the database!
            // (NetBeans auto-generates the create() method inside AbstractFacade)
            userFacade.create(newStaff);

            // INSTANT DASHBOARD REFRESH
            // Ask the database for the new, updated list of staff and overwrite the old session list
            List<User> updatedStaffList = userFacade.getAllStaff();
            session.setAttribute("staffList", updatedStaffList);

            // Send them back with a success message
            session.setAttribute("popupMessage", "Success! " + fullName + " has been registered as a " + role + ".");
            session.setAttribute("popupType", "success");
            response.sendRedirect("manager_dashboard.jsp#manage-staff");

        } catch (Exception e) {
            e.printStackTrace();
            // If the database crashes (e.g., they used an email that already exists)
            session.setAttribute("popupMessage", "Registration Failed. That email address might already be in use.");
            session.setAttribute("popupType", "error");
            response.sendRedirect("manager_dashboard.jsp#manage-staff");
        }
    }
}
