/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.*;

/**
 *
 * @author Asus
 */
@WebServlet(name = "CounterStaffDashboardServlet", urlPatterns = {"/CounterStaffDashboardServlet"})
public class CounterStaffDashboardServlet extends HttpServlet {

    @EJB private AppointmentFacade appointmentFacade;
    @EJB private CustomerFacade customerFacade;
    @EJB private ServiceTypeFacade serviceTypeFacade;
    @EJB private PaymentFacade paymentFacade;
    @EJB private SystemUserFacade systemUserFacade;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || !(session.getAttribute("currentUser") instanceof CounterStaff)) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Filter for available technicians
        List<Technician> availableTechs = new ArrayList<>();
        for (SystemUser staff : systemUserFacade.getAllStaff()) {
            if (staff instanceof Technician && ((Technician) staff).isIsAvailable()) {
                availableTechs.add((Technician) staff);
            }
        }

        request.setAttribute("customerList", customerFacade.findAll());
        request.setAttribute("technicianList", availableTechs);
        request.setAttribute("serviceList", serviceTypeFacade.findAllActive());
        request.setAttribute("appointmentList", appointmentFacade.findAll());
        request.setAttribute("paymentList", paymentFacade.findAll());

        request.getRequestDispatcher("counterStaff_dashboard.jsp").forward(request, response);
    }
}
