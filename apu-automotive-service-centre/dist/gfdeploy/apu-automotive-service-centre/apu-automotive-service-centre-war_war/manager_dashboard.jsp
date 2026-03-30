<%-- 
    Document   : manager_dashboard
    Created on : Mar 21, 2026, 10:50:30 PM
    Author     : TPY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User"%>
<%@page import="model.Manager"%> 

<%
    // 1. THE BOUNCER: Check if they are logged in and have the correct role
    User currentUser = (User) session.getAttribute("currentUser");
    
    // CHANGE 'Manager' TO MATCH THIS SPECIFIC DASHBOARD'S ROLE
    if (currentUser == null || !(currentUser instanceof Manager)) {
        session.setAttribute("popupMessage", "Access Denied. Please log in with the correct role.");
        session.setAttribute("popupType", "error");
        response.sendRedirect("login.jsp");
        return; 
    }
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Manager Dashboard - ASC</title>
        <link rel="stylesheet" href="main.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    </head>
    <body class="bg-color2"> <header class="navbar navbar-dark bg-dark p-3 mb-4">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Auto Service Centre</a>
                <div class="d-flex text-white align-items-center">
                    <span class="me-3">Welcome, <%= currentUser.getFullName() %></span>
                    <a href="LogoutServlet" class="btn btn-sm btn-danger">Logout</a>
                </div>
            </div>
        </header>

        <div class="container-fluid px-4">
            <div class="row">

                <div class="col-md-3 col-lg-2 mb-4">
                    <div class="card shadow-sm">
                        <div class="card-header bg-primary text-white">
                            <i class="fa-solid fa-bars"></i> Main Menu
                        </div>
                        <ul class="list-group list-group-flush">
                            <a href="#" class="list-group-item list-group-item-action active">Dashboard Home</a>
                            <a href="#" class="list-group-item list-group-item-action">Manage Staff</a>
                            <a href="#" class="list-group-item list-group-item-action">View All Appointments</a>
                            <a href="#" class="list-group-item list-group-item-action">Financial Reports</a>
                        </ul>
                    </div>
                </div>

                <div class="col-md-9 col-lg-10">
                    <div class="card shadow-sm">
                        <div class="card-body">
                            <h2 class="card-title mb-4">Manager Overview</h2>

                            <div class="row">
                                <div class="col-md-4 mb-3">
                                    <div class="p-3 bg-light border rounded">
                                        <h5>Total Revenue</h5>
                                        <h3>RM 15,200</h3>
                                    </div>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <div class="p-3 bg-light border rounded">
                                        <h5>Pending Jobs</h5>
                                        <h3>8</h3>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

            </div>
        </div>

        <%
            String popupMessage = (String) session.getAttribute("popupMessage");
            if (popupMessage != null) {
        %>
            <script>alert("<%= popupMessage %>");</script>
        <%
                session.removeAttribute("popupMessage");
                session.removeAttribute("popupType");
            }
        %>

    </body>
</html>
