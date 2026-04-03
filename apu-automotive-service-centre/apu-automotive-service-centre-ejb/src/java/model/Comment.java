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
// We use "COMMENTS" because "COMMENT" is a reserved SQL keyword!
@Table(name = "COMMENTS", schema = "APP") 
public class Comment implements Serializable {

    private static final long serialVersionUID = 1L;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id; // Changed to Long for Auto-Generation

    // Using TIMESTAMP so we know exactly when the comment was posted
    @Temporal(TemporalType.TIMESTAMP)
    @Column(nullable = false)
    private Date commentDate; 

    // Length 1000 so users have plenty of space to write
    @Column(length = 1000, nullable = false)
    private String content;

    // ==========================================
    // RELATIONSHIPS
    // ==========================================
    
    // Many comments can be written by One author (User)
    // We link this to the abstract 'User' class so Customers, Technicians, and Managers can ALL write comments!
    @ManyToOne
    @JoinColumn(name = "AUTHOR_ID", nullable = false)
    private User author;

    // ==========================================
    // CONSTRUCTORS
    // ==========================================
    public Comment() {
    }

    public Comment(Date commentDate, String content, User author) {
        this.commentDate = commentDate;
        this.content = content;
        this.author = author;
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

    public Date getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(Date commentDate) {
        this.commentDate = commentDate;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
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
        if (!(object instanceof Comment)) {
            return false;
        }
        Comment other = (Comment) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Comment[ id=" + id + " ]";
    }
}
