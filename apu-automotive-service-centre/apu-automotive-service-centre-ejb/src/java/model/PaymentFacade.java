/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import javax.annotation.security.PermitAll;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author TPY
 */
@Stateless
public class PaymentFacade extends AbstractFacade<Payment> {

    @PersistenceContext(unitName = "apu-automotive-service-centre-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PaymentFacade() {
        super(Payment.class);
    }
    
    @PermitAll
    public double calculateTotalRevenue() {
        try {
            String jpql = "SELECT SUM(p.amount) FROM Payment p WHERE p.appointment.status <> 'Cancelled'";
            
            Double total = (Double) getEntityManager()
                .createQuery(jpql)
                .getSingleResult();
                
            return total != null ? total : 0.0;
        } catch (Exception e) {
            return 0.0;
        }
    }
}
