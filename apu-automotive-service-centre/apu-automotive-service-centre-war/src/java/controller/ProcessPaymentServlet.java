package controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Appointment;
import model.AppointmentFacade;
import model.Customer;
import model.CustomerFacade;
import model.Payment;
import model.PaymentFacade;

@WebServlet(name = "ProcessPaymentServlet", urlPatterns = {"/ProcessPaymentServlet"})
public class ProcessPaymentServlet extends HttpServlet {

    @EJB
    private AppointmentFacade appointmentFacade;
    @EJB
    private PaymentFacade paymentFacade;
    @EJB
    private CustomerFacade customerFacade;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();

        try {
            Long apptId = Long.parseLong(request.getParameter("appointmentId"));
            Double amountPaid = Double.parseDouble(request.getParameter("amountPaid"));
            String paymentMethod = request.getParameter("paymentMethod");

            // 1. Find the Appointment
            Appointment appt = appointmentFacade.find(apptId);
            
            if (appt != null && !appt.getStatus().equals("Paid" ) && appt.getStatus().equals("Completed")) {
                
                // 2. Mark Appointment as Completed (Paid)
                appt.setStatus("Paid");
                appointmentFacade.edit(appt);

                // 3. Create the Payment Record
                Payment newPayment = new Payment();
                newPayment.setAppointment(appt);
                newPayment.setAmount(amountPaid); 
                newPayment.setPaymentDate(new Date());
                newPayment.setMethod(paymentMethod); 
                paymentFacade.create(newPayment);

                // 4. BONUS: Reward Customer Loyalty Points (10 pts for every visit!)
                Customer customer = appt.getCustomer();
                customer.setLoyaltyPoints(customer.getLoyaltyPoints() + 10);
                customerFacade.edit(customer);

                // REMOVED: Manual session updates.
                // The CounterStaffDashboardServlet will load fresh lists automatically!

                session.setAttribute("popupMessage", "Payment of RM " + amountPaid + " received! Customer awarded 10 points.");
                session.setAttribute("popupType", "success");
            }

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("popupMessage", "Error processing payment.");
            session.setAttribute("popupType", "error");
        }

        // CORRECTED: Send them to the Controller to fetch fresh data, then to the Payments tab
        response.sendRedirect("CounterStaffDashboardServlet#manage-payments");
    }
}