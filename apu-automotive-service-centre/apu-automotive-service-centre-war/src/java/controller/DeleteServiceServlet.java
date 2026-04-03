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
import model.ServiceType;
import model.ServiceTypeFacade;
import model.User;

/**
 *
 * @author TPY
 */
@WebServlet(name = "DeleteServiceServlet", urlPatterns = {"/DeleteServiceServlet"})
public class DeleteServiceServlet extends HttpServlet {

    @EJB
    private ServiceTypeFacade serviceTypeFacade;

    // Use doGet because the delete button is an standard <a> hyperlink!
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("currentUser");
        
        // 1. SECURITY CHECK: Managers Only
        if (currentUser == null || !(currentUser instanceof Manager)) {
            session.setAttribute("popupMessage", "Security Alert: Only Managers can delete services.");
            session.setAttribute("popupType", "error");
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            // 2. Grab the ID from the URL (e.g., ?id=5)
            Long serviceId = Long.valueOf(request.getParameter("id"));

            // 3. Find the service
            ServiceType serviceToDelete = serviceTypeFacade.find(serviceId);
            
            if (serviceToDelete != null) {
                String deletedName = serviceToDelete.getName(); // Save name for the success message
                
                // 4. Delete it from the database
                serviceTypeFacade.remove(serviceToDelete);

                // 5. Refresh the Dashboard Data
                List<ServiceType> updatedServiceList = serviceTypeFacade.findAll();
                session.setAttribute("serviceList", updatedServiceList);

                session.setAttribute("popupMessage", "Success! " + deletedName + " has been permanently deleted.");
                session.setAttribute("popupType", "success");
            } else {
                session.setAttribute("popupMessage", "Delete Error: Service not found in the database.");
                session.setAttribute("popupType", "error");
            }
            
            response.sendRedirect("manager_dashboard.jsp#service-pricing");

        } catch (Exception e) {
            e.printStackTrace();
            
            // FOREIGN KEY CONSTRAINT WARNING!
            // If the database refuses to delete it because a customer already booked it:
            session.setAttribute("popupMessage", "Cannot delete this service! It is currently linked to existing customer appointments.");
            session.setAttribute("popupType", "error");
            response.sendRedirect("manager_dashboard.jsp#service-pricing");
        }
    }
}