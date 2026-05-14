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
    @EJB private TechnicianFacade technicianFacade;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("customerList", customerFacade.findAllActive());
        request.setAttribute("technicianList", technicianFacade.findAvailableAndActiveTechnicians());
        request.setAttribute("serviceList", serviceTypeFacade.findAllActive());
        request.setAttribute("appointmentList", appointmentFacade.findAll());
        request.setAttribute("paymentList", paymentFacade.findAll());

        request.getRequestDispatcher("counterStaff_dashboard.jsp").forward(request, response);
    }
}
