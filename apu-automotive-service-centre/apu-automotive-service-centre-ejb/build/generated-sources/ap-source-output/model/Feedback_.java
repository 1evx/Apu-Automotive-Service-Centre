package model;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Customer;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2026-04-01T23:16:07")
@StaticMetamodel(Feedback.class)
public class Feedback_ { 

    public static volatile SingularAttribute<Feedback, String> comments;
    public static volatile SingularAttribute<Feedback, Date> submissionDate;
    public static volatile SingularAttribute<Feedback, Long> id;
    public static volatile SingularAttribute<Feedback, String> serviceId;
    public static volatile SingularAttribute<Feedback, String> feedbackType;
    public static volatile SingularAttribute<Feedback, Customer> customer;

}