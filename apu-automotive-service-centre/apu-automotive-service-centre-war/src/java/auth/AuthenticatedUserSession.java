package auth;

import java.io.Serializable;

public class AuthenticatedUserSession implements Serializable {

    private static final long serialVersionUID = 1L;

    private final Long userId;
    private final String role;
    private final String displayName;

    public AuthenticatedUserSession(Long userId, String role, String displayName) {
        this.userId = userId;
        this.role = role;
        this.displayName = displayName;
    }

    public Long getUserId() {
        return userId;
    }

    public String getRole() {
        return role;
    }

    public String getDisplayName() {
        return displayName;
    }
}
