package auth;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.SystemUser;

public final class AuthSupport {

    public static final String AUTH_USER_SESSION_KEY = "authUser";
    public static final String CURRENT_USER_REQUEST_KEY = "currentUser";
    public static final String LEGACY_ROLE_SESSION_KEY = "role";
    public static final String SESSION_EXPIRED_MESSAGE = "Your session expired. Please log in again.";
    public static final String UNAUTHORIZED_MESSAGE = "You do not have permission to access that page.";

    private AuthSupport() {
    }

    public static SystemUser getCurrentUser(HttpServletRequest request) {
        Object value = request.getAttribute(CURRENT_USER_REQUEST_KEY);
        return (value instanceof SystemUser) ? (SystemUser) value : null;
    }

    public static AuthenticatedUserSession getAuthUser(HttpSession session) {
        if (session == null) {
            return null;
        }

        Object value = session.getAttribute(AUTH_USER_SESSION_KEY);
        return (value instanceof AuthenticatedUserSession) ? (AuthenticatedUserSession) value : null;
    }

    public static String getDashboardRedirectForRole(String role) {
        if (AuthRoles.COUNTER_STAFF.equals(role)) {
            return "CounterStaffDashboardServlet#edit-profile";
        }
        if (AuthRoles.TECHNICIAN.equals(role)) {
            return "TechnicianDashboardServlet#edit-profile";
        }
        if (AuthRoles.CUSTOMER.equals(role)) {
            return "CustomerDashboardServlet#edit-profile";
        }
        return "ManagerDashboardServlet#edit-profile";
    }

    public static void redirectToLogin(HttpServletRequest request, HttpServletResponse response, String message)
            throws IOException {
        HttpSession existingSession = request.getSession(false);
        if (existingSession != null) {
            try {
                existingSession.invalidate();
            } catch (IllegalStateException ex) {
                // Ignore invalidated session edge cases during redirects.
            }
        }

        HttpSession flashSession = request.getSession(true);
        flashSession.setAttribute("popupMessage", message);
        flashSession.setAttribute("popupType", "warning");
        response.sendRedirect("login.jsp?reason=expired#login");
    }
}
