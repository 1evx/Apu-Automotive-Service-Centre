/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 *
 * @author TPY
 */
@Entity
@DiscriminatorValue("TECHNICIAN") 
@Table(name = "TECHNICIAN", schema = "APP")
public class Technician extends SystemUser implements Serializable {

    private String specialization;
    private boolean isAvailable;


    public Technician() {
        super();
        this.isAvailable = true; 
    }

    // The Full Constructor
    public Technician(String username, String email, String passwordHash, String name, String phoneNumber, String icNumber, String specialization, String address) {
        // Send the core user data UP to SystemUser
        super(username, email, passwordHash, name, phoneNumber, icNumber, address);
        
        // Set the specific Technician data
        this.specialization = specialization;
        this.isAvailable = true;
    }    

    public String getSpecialization() {
        return specialization;
    }

    public void setSpecialization(String specialization) {
        this.specialization = specialization;
    }

    public boolean isIsAvailable() {
        return isAvailable;
    }

    public void setIsAvailable(boolean isAvailable) {
        this.isAvailable = isAvailable;
    }
    
    
}