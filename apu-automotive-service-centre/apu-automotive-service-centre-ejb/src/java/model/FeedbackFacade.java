/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;
import javax.annotation.security.PermitAll;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author TPY
 */
@Stateless
public class FeedbackFacade extends AbstractFacade<Feedback> {

    @PersistenceContext(unitName = "apu-automotive-service-centre-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public FeedbackFacade() {
        super(Feedback.class);
    }
    
    @PermitAll
    public List<Feedback> getFeedbackByCustomer(model.Customer customer) {
        return getEntityManager().createQuery(
            "SELECT f FROM Feedback f JOIN f.appointment a WHERE a.customer = :cust ORDER BY f.submissionDate DESC", Feedback.class)
            .setParameter("cust", customer)
            .getResultList();
    }
    
    @PermitAll
    public List<model.Feedback> getAllFeedback() {
        return getEntityManager().createQuery(
            "SELECT f FROM Feedback f ORDER BY f.submissionDate DESC", model.Feedback.class)
            .getResultList();
    }
    
    @PermitAll
    public Feedback findByAppointmentId(Long appointmentId) {
        try {
            return getEntityManager().createQuery(
                "SELECT f FROM Feedback f WHERE f.appointment.id = :appId", Feedback.class)
                .setParameter("appId", appointmentId)
                .getSingleResult();
        } catch (javax.persistence.NoResultException e) {
            return null; // Return null if the technician hasn't submitted a report yet
        }
    }
}
