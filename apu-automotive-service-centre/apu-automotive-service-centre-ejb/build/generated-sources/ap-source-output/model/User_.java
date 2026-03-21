package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2026-03-21T17:05:28")
@StaticMetamodel(User.class)
public abstract class User_ { 

    public static volatile SingularAttribute<User, String> role;
    public static volatile SingularAttribute<User, String> phoneNumber;
    public static volatile SingularAttribute<User, String> fullName;
    public static volatile SingularAttribute<User, String> id;
    public static volatile SingularAttribute<User, String> email;
    public static volatile SingularAttribute<User, String> passwordHash;

}