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
public class CommentFacade extends AbstractFacade<Comment> {

    @PersistenceContext(unitName = "apu-automotive-service-centre-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CommentFacade() {
        super(Comment.class);
    }
    
    @PermitAll
    public List<Comment> getCommentsByCustomer(model.Customer customer) {
        return getEntityManager().createQuery(
            "SELECT c FROM Comment c JOIN c.appointment a WHERE a.customer = :cust ORDER BY c.commentDate DESC", Comment.class)
            .setParameter("cust", customer)
            .getResultList();
    }
    
    @PermitAll
    public List<Object[]> getTechnicianRatingData() {
        // We join the comment to the appointment, then to the technician
        return getEntityManager().createQuery(
            "SELECT t.fullname, AVG(CAST(c.rating AS double)) " +
            "FROM Comment c " +
            "JOIN c.appointment a " +
            "JOIN a.technician t " +
            "GROUP BY t.fullname " +
            "ORDER BY AVG(CAST(c.rating AS double)) DESC", Object[].class)
            .getResultList();
    }
    
    @PermitAll
    public Comment findByAppointmentId(Long appointmentId) {
        try {
            return getEntityManager().createQuery(
                "SELECT c FROM Comment c WHERE c.appointment.id = :appId", Comment.class)
                .setParameter("appId", appointmentId)
                .getSingleResult();
        } catch (javax.persistence.NoResultException e) {
            return null; // Return null if the customer hasn't left a rating yet
        }
    }
    
}
