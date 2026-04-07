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
import model.ServiceType;
import model.ServiceTypeFacade;
import model.SystemUser;

/**
 *
 * @author TPY
 */
@WebServlet(name = "DeleteServiceServlet", urlPatterns = {"/DeleteServiceServlet"})
public class DeleteServiceServlet extends HttpServlet {

    @EJB
    private ServiceTypeFacade serviceTypeFacade;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        SystemUser currentUser = (SystemUser) session.getAttribute("currentUser");
        
        if (currentUser == null || !(currentUser instanceof Manager)) {
            session.setAttribute("popupMessage", "Security Alert: Only Managers can delete services.");
            session.setAttribute("popupType", "error");
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            Long serviceId = Long.valueOf(request.getParameter("id"));
            ServiceType serviceToDelete = serviceTypeFacade.find(serviceId);
            
            if (serviceToDelete != null) {
                String deletedName = serviceToDelete.getName(); 
                
                // --- THE SOFT DELETE ---
                serviceToDelete.setIsActive(false);
                serviceTypeFacade.edit(serviceToDelete);

                session.setAttribute("popupMessage", "Success! " + deletedName + " has been removed.");
                session.setAttribute("popupType", "success");
            } else {
                session.setAttribute("popupMessage", "Delete Error: Service not found in the database.");
                session.setAttribute("popupType", "error");
            }
            
            response.sendRedirect("ManagerDashboardServlet#service-pricing");

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("popupMessage", "An error occurred while trying to deactivate this service.");
            session.setAttribute("popupType", "error");
            response.sendRedirect("ManagerDashboardServlet#service-pricing");
        }
    }
}