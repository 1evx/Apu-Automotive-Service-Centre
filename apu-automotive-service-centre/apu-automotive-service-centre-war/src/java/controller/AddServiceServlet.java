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
@WebServlet(name = "AddServiceServlet", urlPatterns = {"/AddServiceServlet"})
public class AddServiceServlet extends HttpServlet {

    @EJB
    private ServiceTypeFacade serviceTypeFacade;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("currentUser");
        
        if (currentUser == null || !(currentUser instanceof Manager)) {
            session.setAttribute("popupMessage", "Security Alert: Only Managers can add new services.");
            session.setAttribute("popupType", "error");
            response.sendRedirect("login.jsp");
            return;
        }

try {
            String name = request.getParameter("serviceName");
            String description = request.getParameter("description"); // GRAB TEXT
            double price = Double.parseDouble(request.getParameter("price"));
            int durationHours = Integer.parseInt(request.getParameter("durationHours"));

            ServiceType existingService = serviceTypeFacade.findByName(name);
            
            if (existingService != null) {
                session.setAttribute("popupMessage", "Error: A service named '" + name + "' already exists.");
                session.setAttribute("popupType", "error");
                response.sendRedirect("manager_dashboard.jsp#service-pricing");
                return;
            }

            ServiceType newService = new ServiceType();
            newService.setName(name);
            newService.setDescription(description); // SAVE TEXT
            newService.setPrice(price);
            newService.setDurationHours(durationHours);

            serviceTypeFacade.create(newService);

            List<ServiceType> updatedServiceList = serviceTypeFacade.findAll();
            session.setAttribute("serviceList", updatedServiceList);

            session.setAttribute("popupMessage", "Success! " + name + " was added to the master catalog.");
            session.setAttribute("popupType", "success");
            response.sendRedirect("manager_dashboard.jsp#service-pricing");

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("popupMessage", "An error occurred while trying to create the service.");
            session.setAttribute("popupType", "error");
            response.sendRedirect("manager_dashboard.jsp#service-pricing");
        }
    }
}
