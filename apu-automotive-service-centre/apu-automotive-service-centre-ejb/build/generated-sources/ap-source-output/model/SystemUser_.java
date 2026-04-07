package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2026-04-08T00:55:17")
@StaticMetamodel(SystemUser.class)
public abstract class SystemUser_ { 

    public static volatile SingularAttribute<SystemUser, String> icNumber;
    public static volatile SingularAttribute<SystemUser, String> role;
    public static volatile SingularAttribute<SystemUser, String> phoneNumber;
    public static volatile SingularAttribute<SystemUser, String> address;
    public static volatile SingularAttribute<SystemUser, String> fullname;
    public static volatile SingularAttribute<SystemUser, Boolean> isActive;
    public static volatile SingularAttribute<SystemUser, Long> userId;
    public static volatile SingularAttribute<SystemUser, String> email;
    public static volatile SingularAttribute<SystemUser, String> passwordHash;
    public static volatile SingularAttribute<SystemUser, String> username;

}