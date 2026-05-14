package auth;

import java.io.IOException;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import javax.ejb.EJB;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.SystemUser;
import model.SystemUserFacade;

@WebFilter(urlPatterns = {
    "/CounterStaffDashboardServlet",
    "/BookAppointmentServlet",
    "/DeleteCustomerServlet",
    "/EditCustomerServlet",
    "/EditAppointmentServlet",
    "/ProcessPaymentServlet",
    "/RegisterCustomerServlet",
    "/TechnicianDashboardServlet",
    "/UpdateTaskStatusServlet",
    "/CustomerDashboardServlet",
    "/SubmitCommentServlet",
    "/ManagerDashboardServlet",
    "/AddServiceServlet",
    "/DeleteServiceServlet",
    "/DeleteStaffServlet",
    "/RegisterStaffServlet",
    "/UpdateServiceServlet",
    "/UpdateStaffServlet",
    "/ViewAppointmentDetailsServlet",
    "/AIAssistantServlet",
    "/UpdateProfileServlet",
    "/register_staff.jsp"
})
public class AuthFilter implements Filter {

    @EJB
    private SystemUserFacade systemUserFacade;

    private Map<String, Set<String>> routeRoles;

    @Override
    public void init(FilterConfig filterConfig) {
        Map<String, Set<String>> roles = new HashMap<>();

        Set<String> counterStaffOnly = unmodifiableRoles(AuthRoles.COUNTER_STAFF);
        Set<String> technicianOnly = unmodifiableRoles(AuthRoles.TECHNICIAN);
        Set<String> customerOnly = unmodifiableRoles(AuthRoles.CUSTOMER);
        Set<String> managerOnly = unmodifiableRoles(AuthRoles.MANAGER, AuthRoles.SUPER_MANAGER);
        Set<String> authenticatedUsers = unmodifiableRoles(
                AuthRoles.COUNTER_STAFF,
                AuthRoles.TECHNICIAN,
                AuthRoles.CUSTOMER,
                AuthRoles.MANAGER,
                AuthRoles.SUPER_MANAGER
        );

        roles.put("/CounterStaffDashboardServlet", counterStaffOnly);
        roles.put("/BookAppointmentServlet", counterStaffOnly);
        roles.put("/DeleteCustomerServlet", counterStaffOnly);
        roles.put("/EditCustomerServlet", counterStaffOnly);
        roles.put("/EditAppointmentServlet", counterStaffOnly);
        roles.put("/ProcessPaymentServlet", counterStaffOnly);
        roles.put("/RegisterCustomerServlet", counterStaffOnly);

        roles.put("/TechnicianDashboardServlet", technicianOnly);
        roles.put("/UpdateTaskStatusServlet", technicianOnly);

        roles.put("/CustomerDashboardServlet", customerOnly);
        roles.put("/SubmitCommentServlet", customerOnly);

        roles.put("/ManagerDashboardServlet", managerOnly);
        roles.put("/AddServiceServlet", managerOnly);
        roles.put("/DeleteServiceServlet", managerOnly);
        roles.put("/DeleteStaffServlet", managerOnly);
        roles.put("/RegisterStaffServlet", managerOnly);
        roles.put("/UpdateServiceServlet", managerOnly);
        roles.put("/UpdateStaffServlet", managerOnly);
        roles.put("/ViewAppointmentDetailsServlet", managerOnly);
        roles.put("/AIAssistantServlet", managerOnly);
        roles.put("/register_staff.jsp", managerOnly);

        roles.put("/UpdateProfileServlet", authenticatedUsers);
        routeRoles = Collections.unmodifiableMap(roles);
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        HttpSession session = httpRequest.getSession(false);
        AuthenticatedUserSession authUser = AuthSupport.getAuthUser(session);
        if (authUser == null || authUser.getUserId() == null || authUser.getRole() == null) {
            AuthSupport.redirectToLogin(httpRequest, httpResponse, AuthSupport.SESSION_EXPIRED_MESSAGE);
            return;
        }

        SystemUser currentUser = systemUserFacade.find(authUser.getUserId());
        if (currentUser == null || !currentUser.isIsActive()) {
            AuthSupport.redirectToLogin(httpRequest, httpResponse, AuthSupport.SESSION_EXPIRED_MESSAGE);
            return;
        }

        String actualRole = AuthRoles.fromUser(currentUser);
        Set<String> allowedRoles = routeRoles.get(httpRequest.getServletPath());
        if (actualRole == null || allowedRoles == null || !allowedRoles.contains(actualRole)) {
            AuthSupport.redirectToLogin(httpRequest, httpResponse, AuthSupport.UNAUTHORIZED_MESSAGE);
            return;
        }

        AuthenticatedUserSession refreshedAuthUser =
                new AuthenticatedUserSession(currentUser.getUserId(), actualRole, currentUser.getFullName());
        session.setAttribute(AuthSupport.AUTH_USER_SESSION_KEY, refreshedAuthUser);
        session.setAttribute(AuthSupport.LEGACY_ROLE_SESSION_KEY, AuthRoles.toLegacySessionRole(actualRole));
        httpRequest.setAttribute(AuthSupport.CURRENT_USER_REQUEST_KEY, currentUser);

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
    }

    private Set<String> unmodifiableRoles(String... roles) {
        return Collections.unmodifiableSet(new HashSet<>(Arrays.asList(roles)));
    }
}
