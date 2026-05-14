/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import auth.AuthSupport;
import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.ServiceType;
import model.ServiceTypeFacade;
import model.SystemUser;

/**
 *
 * @author TPY
 */
@WebServlet(name = "AddServiceServlet", urlPatterns = {"/AddServiceServlet"})
public class AddServiceServlet extends HttpServlet {

    @EJB
    private ServiceTypeFacade serviceTypeFacade;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        SystemUser currentUser = AuthSupport.getCurrentUser(request);

        try {
            String name = request.getParameter("serviceName");
            String description = request.getParameter("description"); 
            double price = Double.parseDouble(request.getParameter("price"));
            int durationHours = Integer.parseInt(request.getParameter("durationHours"));

            ServiceType existingService = serviceTypeFacade.findByName(name);
            
            if (existingService != null) {
                if (existingService.isIsActive()) {
                    // SCENARIO A: It exists and is currently active. Block the duplicate!
                    session.setAttribute("popupMessage", "Error: An active service named '" + name + "' already exists on the menu.");
                    session.setAttribute("popupType", "error");
                } else {
                    // SCENARIO B: It exists but was Soft-Deleted. Bring it back to life!
                    existingService.setIsActive(true); // Reactivate it
                    existingService.setDescription(description); 
                    existingService.setPrice(price); // Update to new price
                    existingService.setDurationHours(durationHours); // Update to new duration
                    
                    serviceTypeFacade.edit(existingService); // Save the updated old record
                    
                    session.setAttribute("popupMessage", "Success! The archived service '" + name + "' has been reactivated and updated.");
                    session.setAttribute("popupType", "success");
                }
            } else {
                // SCENARIO C: Brand new service. Create it from scratch.
                ServiceType newService = new ServiceType();
                newService.setName(name);
                newService.setDescription(description); 
                newService.setPrice(price);
                newService.setDurationHours(durationHours);
                newService.setIsActive(true); // Explicitly set it to active
                
                serviceTypeFacade.create(newService); // Save to DB

                session.setAttribute("popupMessage", "Success! '" + name + "' was added to the master catalog.");
                session.setAttribute("popupType", "success");
            }
            
            // CORRECTED: Redirect to the Dashboard Controller
            response.sendRedirect("ManagerDashboardServlet#service-pricing");

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("popupMessage", "An error occurred while trying to create the service.");
            session.setAttribute("popupType", "error");
            
            // CORRECTED: Redirect to the Dashboard Controller
            response.sendRedirect("ManagerDashboardServlet#service-pricing");
        }
    }
}
