package auth;

import model.CounterStaff;
import model.Customer;
import model.Manager;
import model.SuperManager;
import model.SystemUser;
import model.Technician;

public final class AuthRoles {

    public static final String COUNTER_STAFF = "COUNTER_STAFF";
    public static final String TECHNICIAN = "TECHNICIAN";
    public static final String CUSTOMER = "CUSTOMER";
    public static final String MANAGER = "MANAGER";
    public static final String SUPER_MANAGER = "SUPER_MANAGER";

    private AuthRoles() {
    }

    public static String fromUser(SystemUser user) {
        if (user instanceof SuperManager) {
            return SUPER_MANAGER;
        }
        if (user instanceof Manager) {
            return MANAGER;
        }
        if (user instanceof CounterStaff) {
            return COUNTER_STAFF;
        }
        if (user instanceof Technician) {
            return TECHNICIAN;
        }
        if (user instanceof Customer) {
            return CUSTOMER;
        }
        return null;
    }

    public static String toLegacySessionRole(String role) {
        if (SUPER_MANAGER.equals(role)) {
            return SUPER_MANAGER;
        }
        if (MANAGER.equals(role)) {
            return "Manager";
        }
        return role;
    }
}
