package model;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Appointment;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2026-04-08T00:55:17")
@StaticMetamodel(Feedback.class)
public class Feedback_ { 

    public static volatile SingularAttribute<Feedback, String> comments;
    public static volatile SingularAttribute<Feedback, Date> submissionDate;
    public static volatile SingularAttribute<Feedback, Appointment> appointment;
    public static volatile SingularAttribute<Feedback, Long> id;
    public static volatile SingularAttribute<Feedback, String> feedbackType;

}