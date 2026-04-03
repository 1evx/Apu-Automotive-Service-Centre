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
@DiscriminatorValue("COUNTER_STAFF") 
@Table(name = "COUNTER_STAFF", schema = "APP")
public class CounterStaff extends SystemUser implements Serializable {
    
    private String shiftType;

    // 1. Empty Constructor
    public CounterStaff() {
        super();
    }

    // 2. Full Constructor
    public CounterStaff(String username, String email, String passwordHash, String fullname, String phoneNumber, String icNumber, String shiftType, String address) {
        super(username, email, passwordHash, fullname, phoneNumber, icNumber, address);
        this.shiftType = shiftType;
    }

    // --- Getters and Setters ---
    public String getShiftType() {
        return shiftType;
    }

    public void setShiftType(String shiftType) {
        this.shiftType = shiftType;
    }
}