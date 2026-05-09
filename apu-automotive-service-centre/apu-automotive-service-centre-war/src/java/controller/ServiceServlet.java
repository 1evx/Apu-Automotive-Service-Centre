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
import model.ServiceType;
import model.ServiceTypeFacade;
/**
 *
 * @author Asus
 */
@WebServlet(name = "ServiceServlet", urlPatterns = {"/Services"})
public class ServiceServlet extends HttpServlet {

    // Inject your EJB Facade
    @EJB
    private ServiceTypeFacade serviceTypeFacade;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            // 1. Get all active services from the database
            List<ServiceType> services = serviceTypeFacade.findAllActive();
            
            // 2. Attach the list to the request scope (matching your JSP variable)
            request.setAttribute("serviceList", services);
            
            // 3. Forward to the JSP
            request.getRequestDispatcher("service.jsp").forward(request, response);
            
        } catch (Exception e) {
            // Basic error handling
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Unable to load services.");
        }
    }
}
