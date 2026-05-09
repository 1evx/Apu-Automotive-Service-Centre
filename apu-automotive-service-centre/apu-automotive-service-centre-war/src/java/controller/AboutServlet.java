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
import model.Technician;
import model.TechnicianFacade;

/**
 *
 * @author Asus
 */
@WebServlet(name = "AboutServlet", urlPatterns = {"/About"})
public class AboutServlet extends HttpServlet {

    @EJB
    private TechnicianFacade technicianFacade;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            // 1. Get all active technicians for the showcase
            List<Technician> techs = technicianFacade.findAllActiveTechnicians();
            
            // 2. Attach the list to the request
            request.setAttribute("technicianList", techs);
            
            // 3. Forward to the About JSP
            request.getRequestDispatcher("about.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Unable to load the About page.");
        }
    }
}
