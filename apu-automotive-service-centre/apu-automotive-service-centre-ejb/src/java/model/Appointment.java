package model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "APPOINTMENT", schema = "APP") 
public class Appointment implements Serializable {

    private static final long serialVersionUID = 1L;
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // IDENTITY is usually safer than AUTO for Derby/MySQL
    private Long id;

    @Temporal(TemporalType.DATE)
    @Column(nullable = false)
    private Date appointmentDate;

    @Column(nullable = false)
    private String appointmentTime;
    
    // ADDED: Every auto shop needs to know the car plate number!
    @Column(nullable = false)
    private String carPlateNumber; 

    @Column(nullable = false)
    private String status; // "Scheduled", "In Progress", "Completed", "Cancelled"

    @Column(length = 500)
    private String remarks;

    // ==========================================
    // RELATIONSHIPS
    // ==========================================
    
    // THE FIX: Links directly to your ServiceType entity, not a random String!
    @ManyToOne
    @JoinColumn(name = "SERVICETYPE_ID", nullable = false)
    private ServiceType serviceType;
    
    @ManyToOne
    @JoinColumn(name = "CUSTOMER_ID", nullable = false)
    private Customer customer;

    @ManyToOne
    @JoinColumn(name = "TECHNICIAN_ID", nullable = true) // Nullable because a tech isn't assigned immediately
    private Technician technician;

    // ==========================================
    // CONSTRUCTORS
    // ==========================================

    public Appointment() {
    }

    // Updated Constructor to include the ServiceType object and Car Plate
    public Appointment(Date appointmentDate, String appointmentTime, String carPlateNumber, ServiceType serviceType, String status, String remarks, Customer customer) {
        this.appointmentDate = appointmentDate;
        this.appointmentTime = appointmentTime;
        this.carPlateNumber = carPlateNumber;
        this.serviceType = serviceType;
        this.status = status;
        this.remarks = remarks;
        this.customer = customer;
    }

    // ==========================================
    // GETTERS & SETTERS
    // ==========================================

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getAppointmentDate() {
        return appointmentDate;
    }

    public void setAppointmentDate(Date appointmentDate) {
        this.appointmentDate = appointmentDate;
    }

    public String getAppointmentTime() {
        return appointmentTime;
    }

    public void setAppointmentTime(String appointmentTime) {
        this.appointmentTime = appointmentTime;
    }

    public String getCarPlateNumber() {
        return carPlateNumber;
    }

    public void setCarPlateNumber(String carPlateNumber) {
        this.carPlateNumber = carPlateNumber;
    }

    public ServiceType getServiceType() {
        return serviceType;
    }

    public void setServiceType(ServiceType serviceType) {
        this.serviceType = serviceType;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Technician getTechnician() {
        return technician;
    }

    public void setTechnician(Technician technician) {
        this.technician = technician;
    }
     
    // ==========================================
    // DEFAULT JPA METHODS
    // ==========================================
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof Appointment)) {
            return false;
        }
        Appointment other = (Appointment) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Appointment[ id=" + id + " ]";
    }
}