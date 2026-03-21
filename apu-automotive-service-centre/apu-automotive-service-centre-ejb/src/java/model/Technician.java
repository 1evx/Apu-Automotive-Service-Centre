/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

/**
 *
 * @author TPY
 */
@Entity
@DiscriminatorValue("STAFF") // Insert "STAFF" into the 'role' column when saving this object
public class Technician extends User {
    
    public Technician() {
        super();
    }
    
    public Technician(String email, String passwordHash, String role, String fullName, String phoneNumber) {
        super(email, passwordHash, role, fullName, phoneNumber);
    }
    
}
