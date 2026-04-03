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
 * @author TPY
 */
@Stateless
public class ServiceTypeFacade extends AbstractFacade<ServiceType> {

    @PersistenceContext(unitName = "apu-automotive-service-centre-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ServiceTypeFacade() {
        super(ServiceType.class);
    }
    
    public model.ServiceType findByName(String name) {
        try {
            return (model.ServiceType) getEntityManager().createQuery(
                "SELECT s FROM ServiceType s WHERE s.name = :name")
                .setParameter("name", name)
                .getSingleResult();
        } catch (javax.persistence.NoResultException e) {
            return null; 
        }
    }
}
