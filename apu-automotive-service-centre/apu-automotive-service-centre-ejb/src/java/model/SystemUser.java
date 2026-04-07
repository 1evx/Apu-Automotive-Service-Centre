/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;
import javax.persistence.*;

/**
 *
 * @author Asus
 */
@Entity
@Table(name = "MY_USER", schema = "APP")
// We stick to JOINED because it matches your perfect ERD!
@Inheritance(strategy = InheritanceType.JOINED)
// This tells JPA to automatically stamp the child's role into the 'role' column
@DiscriminatorColumn(name = "role", discriminatorType = DiscriminatorType.STRING)
public abstract class SystemUser implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long userId;

    @Column(unique = true, nullable = false)
    private String username;

    @Column(unique = true, nullable = false)
    private String email;

    // Renamed from password to passwordHash based on your friend's good idea
    @Column(nullable = false)
    private String passwordHash;

    // THE MAGIC FIX: We make this variable "Read-Only". 
    // JPA will fill it using the Discriminator, but won't crash trying to save it twice!
    @Column(name = "role", insertable = false, updatable = false)
    private String role;
    
    @Column(nullable = false)
    private boolean isActive = true;

    private String fullname;
    private String phoneNumber;
    private String address;

    @Column(unique = true, nullable = false)
    private String icNumber;

    public SystemUser() {
    }

    public SystemUser(String username, String email, String passwordHash, String fullname, String phoneNumber, String icNumber, String address) {
        this.username = username;
        this.email = email;
        this.passwordHash = passwordHash;
        this.fullname = fullname;
        this.phoneNumber = phoneNumber;
        this.icNumber = icNumber;
        this.address = address;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPasswordHash() {
        return passwordHash;
    }

    public void setPasswordHash(String passwordHash) {
        this.passwordHash = passwordHash;
    }

    public String getRole() {
        return role;
    }

    public String getName() {
        return fullname;
    }

    public void setName(String name) {
        this.fullname = name;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getIcNumber() {
        return icNumber;
    }

    public void setIcNumber(String icNumber) {
        this.icNumber = icNumber;
    }

    public String getFullName() {
        return fullname;
    }

    public void setFullName(String fullname) {
        this.fullname = fullname;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }
    
    
    
}
