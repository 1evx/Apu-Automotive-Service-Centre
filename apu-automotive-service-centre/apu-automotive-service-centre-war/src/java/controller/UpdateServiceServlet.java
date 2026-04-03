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
@WebServlet(name = "UpdateServiceServlet", urlPatterns = {"/UpdateServiceServlet"})
public class UpdateServiceServlet extends HttpServlet {

    @EJB
    private ServiceTypeFacade serviceTypeFacade;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("currentUser");
        
        // 1. SECURITY CHECK: Managers Only
        if (currentUser == null || !(currentUser instanceof Manager)) {
            session.setAttribute("popupMessage", "Security Alert: Only Managers can update services.");
            session.setAttribute("popupType", "error");
            response.sendRedirect("login.jsp");
            return;
        }

try {
            Long serviceId = Long.parseLong(request.getParameter("serviceTypeId"));
            String newName = request.getParameter("serviceName");
            String newDescription = request.getParameter("description"); // GRAB TEXT
            double newPrice = Double.parseDouble(request.getParameter("price"));
            int newDuration = Integer.parseInt(request.getParameter("durationHours"));

            ServiceType serviceToUpdate = serviceTypeFacade.find(serviceId);
            
            if (serviceToUpdate != null) {
                
                ServiceType duplicateCheck = serviceTypeFacade.findByName(newName);
                if (duplicateCheck != null && !duplicateCheck.getId().equals(serviceId)) {
                    session.setAttribute("popupMessage", "Update Failed: A service named '" + newName + "' already exists.");
                    session.setAttribute("popupType", "error");
                    response.sendRedirect("manager_dashboard.jsp#service-pricing");
                    return;
                }
                
                serviceToUpdate.setName(newName);
                serviceToUpdate.setDescription(newDescription); // SAVE TEXT
                serviceToUpdate.setPrice(newPrice);
                serviceToUpdate.setDurationHours(newDuration);
                
                serviceTypeFacade.edit(serviceToUpdate);

                List<ServiceType> updatedServiceList = serviceTypeFacade.findAll();
                session.setAttribute("serviceList", updatedServiceList);

                session.setAttribute("popupMessage", "Success! " + newName + " has been successfully updated.");
                session.setAttribute("popupType", "success");
            } else {
                session.setAttribute("popupMessage", "Update Error: Service not found in the database.");
                session.setAttribute("popupType", "error");
            }
            
            response.sendRedirect("manager_dashboard.jsp#service-pricing");

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("popupMessage", "An error occurred while trying to update the service.");
            session.setAttribute("popupType", "error");
            response.sendRedirect("manager_dashboard.jsp#service-pricing");
        }
    }
}