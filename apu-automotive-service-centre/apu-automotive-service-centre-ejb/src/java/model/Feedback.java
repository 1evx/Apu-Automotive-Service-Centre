/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
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
@Table(name = "FEEDBACK", schema = "APP")
public class Feedback implements Serializable {

    private static final long serialVersionUID = 1L;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id; // Changed to Long for proper Auto-Generation

    // Maps to the dropdown in our HTML (General, Technician, CounterStaff)
    @Column(nullable = false)
    private String feedbackType;

    // Optional field, so nullable is true
    @Column(nullable = true)
    private String serviceId;

    // Length 1000 to ensure we have enough room for long paragraphs
    @Column(length = 1000, nullable = false)
    private String comments;

    // Automatically records the exact date and time it was submitted
    @Temporal(TemporalType.TIMESTAMP)
    private Date submissionDate;

    // ==========================================
    // RELATIONSHIP: Many Feedbacks belong to One Customer
    // ==========================================
    @ManyToOne
    @JoinColumn(name = "CUSTOMER_ID", nullable = false)
    private Customer customer;

    
    // ==========================================
    // CONSTRUCTORS
    // ==========================================
    public Feedback() {
    }

    public Feedback(String feedbackType, String serviceId, String comments, Date submissionDate, Customer customer) {
        this.feedbackType = feedbackType;
        this.serviceId = serviceId;
        this.comments = comments;
        this.submissionDate = submissionDate;
        this.customer = customer;
    }

    // ==========================================
    // GETTERS AND SETTERS
    // ==========================================
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFeedbackType() {
        return feedbackType;
    }

    public void setFeedbackType(String feedbackType) {
        this.feedbackType = feedbackType;
    }

    public String getServiceId() {
        return serviceId;
    }

    public void setServiceId(String serviceId) {
        this.serviceId = serviceId;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public Date getSubmissionDate() {
        return submissionDate;
    }

    public void setSubmissionDate(Date submissionDate) {
        this.submissionDate = submissionDate;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
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
        if (!(object instanceof Feedback)) {
            return false;
        }
        Feedback other = (Feedback) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Feedback[ id=" + id + " ]";
    }
}
