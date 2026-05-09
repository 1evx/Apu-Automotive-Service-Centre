/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.annotation.security.PermitAll;

/**
 *
 * @author TPY
 */
@Stateless
public class AppointmentFacade extends AbstractFacade<Appointment> {

    @PersistenceContext(unitName = "apu-automotive-service-centre-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AppointmentFacade() {
        super(Appointment.class);
    }
    
    @PermitAll
    public List<Appointment> getAppointmentsByCustomer(model.Customer customer) {
        return getEntityManager().createQuery(
            "SELECT a FROM Appointment a WHERE a.customer = :cust ORDER BY a.appointmentDate DESC", Appointment.class)
            .setParameter("cust", customer)
            .getResultList();
    }
    
    @PermitAll
    public boolean hasActiveAppointments(model.Customer customer) {
        try {
            Long activeCount = (Long) getEntityManager().createQuery(
                "SELECT COUNT(a) FROM Appointment a WHERE a.customer = :cust AND a.status IN ('Scheduled', 'In Progress')")
                .setParameter("cust", customer)
                .getSingleResult();

            return activeCount > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return true;
        }
    }
    
    @PermitAll
    public boolean hasActiveAppointments(model.Technician technician) {
        try {
            Long activeCount = (Long) getEntityManager().createQuery(
                "SELECT COUNT(a) FROM Appointment a WHERE a.technician = :tech AND a.status IN ('Scheduled', 'In Progress')")
                .setParameter("tech", technician)
                .getSingleResult();

            return activeCount > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return true;
        }
    }
    
    @PermitAll
    public List<Appointment> findByTechnicianAndDate(Technician technician, Date date) {
        TypedQuery<Appointment> query = em.createQuery(
            "SELECT a FROM Appointment a WHERE a.technician = :tech AND a.appointmentDate = :date AND a.status != 'Cancelled'", 
            Appointment.class);
        query.setParameter("tech", technician);
        query.setParameter("date", date);
        return query.getResultList();
    }
    
    @PermitAll
    public List<Appointment> findByTechnician(Technician technician) {
        // Fetches tasks for this specific technician, sorted by date and time!
        TypedQuery<Appointment> query = em.createQuery(
            "SELECT a FROM Appointment a WHERE a.technician = :tech ORDER BY a.appointmentDate ASC, a.appointmentTime ASC", 
            Appointment.class);
        query.setParameter("tech", technician);
        return query.getResultList();
    }
    
    @PermitAll
    public long countCompletedJobs() {
        try {
            return (Long) getEntityManager().createQuery(
                "SELECT COUNT(a) FROM Appointment a WHERE a.status = 'Completed' OR a.status = 'Paid'")
                .getSingleResult();
        } catch (Exception e) {
            return 0;
        }
    }
    
    @PermitAll
    public List<Object[]> getStaffPerformanceData() {
        return getEntityManager().createQuery(
            "SELECT t.fullname, COUNT(a), SUM(s.price) " +
            "FROM Appointment a " +
            "JOIN a.technician t " +
            "JOIN a.serviceType s " +
            "WHERE a.status = 'Paid' " +
            "GROUP BY t.fullname " +
            "ORDER BY COUNT(a) DESC", Object[].class)
            .getResultList();
    }

    @PermitAll
    public List<Object[]> getServicePopularityData() {
        // s.name is correct assuming ServiceType has a 'name' field
        return getEntityManager().createQuery(
            "SELECT s.name, COUNT(a), SUM(s.price) " +
            "FROM Appointment a " +
            "JOIN a.serviceType s " +
            "GROUP BY s.name " +
            "ORDER BY COUNT(a) DESC", Object[].class)
            .getResultList();
    }
    
    @PermitAll
    public List<Appointment> findAllWithDetails() {
        // Joining technician and customer to avoid LazyInitialization errors in JSP
        return getEntityManager().createQuery(
            "SELECT a FROM Appointment a LEFT JOIN FETCH a.technician LEFT JOIN FETCH a.customer ORDER BY a.appointmentDate DESC", 
            Appointment.class).getResultList();
    }
}
