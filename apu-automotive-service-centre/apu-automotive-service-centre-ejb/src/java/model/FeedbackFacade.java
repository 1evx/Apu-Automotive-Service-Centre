/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;
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
    
    public List<Feedback> getFeedbackByCustomer(model.Customer customer) {
        return getEntityManager().createQuery(
            "SELECT f FROM Feedback f WHERE f.customer = :cust ORDER BY f.submissionDate DESC", Feedback.class)
            .setParameter("cust", customer)
            .getResultList();
    }
    
    public List<model.Feedback> getAllFeedback() {
        return getEntityManager().createQuery(
            "SELECT f FROM Feedback f ORDER BY f.submissionDate DESC", model.Feedback.class)
            .getResultList();
    }
}
