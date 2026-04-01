package model;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Customer;
import model.Technician;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2026-04-01T23:16:07")
@StaticMetamodel(Appointment.class)
public class Appointment_ { 

    public static volatile SingularAttribute<Appointment, String> serviceType;
    public static volatile SingularAttribute<Appointment, String> appointmentTime;
    public static volatile SingularAttribute<Appointment, Technician> technician;
    public static volatile SingularAttribute<Appointment, Long> id;
    public static volatile SingularAttribute<Appointment, Date> appointmentDate;
    public static volatile SingularAttribute<Appointment, String> remarks;
    public static volatile SingularAttribute<Appointment, String> status;
    public static volatile SingularAttribute<Appointment, Customer> customer;

}