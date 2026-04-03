/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Asus
 */
@Stateless
public class TechnicianFacade extends AbstractFacade<Technician> {

    @PersistenceContext(unitName = "apu-automotive-service-centre-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public TechnicianFacade() {
        super(Technician.class);
    }
    
    public model.ServiceType findByServiceName(String name) {
        try {
            return (model.ServiceType) getEntityManager().createQuery(
                "SELECT s FROM ServiceType s WHERE s.serviceName = :name")
                .setParameter("name", name)
                .getSingleResult();
        } catch (javax.persistence.NoResultException e) {
            return null; // Returns null if the service hasn't been created yet
        }
    }
    
}
