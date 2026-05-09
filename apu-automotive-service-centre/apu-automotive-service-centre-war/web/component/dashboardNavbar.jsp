<%-- 
    Document   : dashboardnavbar
    Created on : Apr 1, 2026, 7:52:54 PM
    Author     : TPY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>    
    <header class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top p-3 shadow-sm">
        <div class="container">
            <div class="logo-image">
                <img src="static/img/logo/logoWhite.svg" alt="img">
            </div>
            <div class="d-flex text-white align-items-center">
                <span class="me-4">
                    <i class="fa-solid fa-user-tie me-2"></i>     
                    ${sessionScope.currentUser.displayRole} 
                    - 
                    <span>${sessionScope.currentUser.displayName}</span>
                </span>
                <a href="LogoutServlet" class="btn btn-sm btn-outline-light"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
            </div>
        </div>
    </header>
</html>
