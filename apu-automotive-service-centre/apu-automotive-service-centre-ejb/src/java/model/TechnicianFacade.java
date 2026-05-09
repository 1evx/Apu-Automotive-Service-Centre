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
    
    public List<Technician> findAvailableAndActiveTechnicians() {
        return em.createQuery(
            "SELECT t FROM Technician t WHERE t.isActive = true AND t.isAvailable = true", 
            Technician.class
        ).getResultList();
    }
    
    public List<Technician> findAllActiveTechnicians() {
        return em.createQuery(
            "SELECT t FROM Technician t WHERE t.isActive = true", 
            Technician.class
        ).getResultList();
    }
    
}
