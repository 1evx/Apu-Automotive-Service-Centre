<%-- 
    Document   : view_review.jsp
    Created on : 5 Apr 2026, 5:40:20 pm
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>View Review - APU CARE</title>
        
        <link rel="shortcut icon" href="static/img/favicon.png">
        <link rel="stylesheet" href="static/css/bootstrap.min.css">
        <link rel="stylesheet" href="static/css/all.min.css">
        <link rel="stylesheet" href="static/css/main.css">
    </head>

    <body class="bg-color2">
        
        <jsp:include page="component/dashboardNavbar.jsp" />

        <div class="section-padding py-5">
            <div class="container mt-5">
                <div class="row justify-content-center">
                    <div class="col-lg-8 wow fadeInUp" data-wow-delay=".3s">
                        
                        <a href="customer_dashboard.jsp#history" class="btn btn-outline-secondary fw-bold mb-4">
                            <i class="fa-solid fa-arrow-left me-2"></i> Back to Dashboard
                        </a>

                        <div class="card shadow-lg border-0 rounded-4 overflow-hidden">
                            <div class="card-header bg-primary text-white p-4">
                                <h4 class="mb-0 text-white"><i class="fa-solid fa-star me-2 text-warning"></i> Service Review Details</h4>
                            </div>
                            
                            <div class="card-body p-5 bg-white">
                                <c:set var="foundComment" value="false" />
                                
                                <%-- Loop through session comments to find the one matching the URL parameter --%>
                                <c:forEach items="${sessionScope.myComments}" var="comment">
                                    <c:if test="${comment.appointment.id eq param.id}">
                                        <c:set var="foundComment" value="true" />
                                        
                                        <div class="d-flex justify-content-between align-items-center mb-4 pb-4 border-bottom">
                                            <div>
                                                <h5 class="fw-bold text-dark mb-1">${comment.appointment.serviceType.name}</h5>
                                                <p class="text-muted mb-0">Vehicle: <span class="text-uppercase fw-bold text-primary">${comment.appointment.carPlateNumber}</span></p>
                                            </div>
                                            <div class="text-end">
                                                <small class="text-muted d-block mb-1">Service Date</small>
                                                <span class="badge bg-light text-dark border px-3 py-2 fs-6">
                                                    <fmt:formatDate value="${comment.appointment.appointmentDate}" pattern="dd MMM yyyy" />
                                                </span>
                                            </div>
                                        </div>

                                        <div class="mb-4 text-center">
                                            <h6 class="text-muted mb-2 text-uppercase tracking-wide" style="letter-spacing: 2px;">Your Rating</h6>
                                            <h1 class="text-warning mb-0 display-4">
                                                <%-- Print filled stars --%>
                                                <c:forEach begin="1" end="${comment.rating}">★</c:forEach>
                                                <%-- Print empty stars --%>
                                                <c:forEach begin="${comment.rating + 1}" end="5"><span class="text-light">★</span></c:forEach>
                                            </h1>
                                        </div>

                                        <div class="mt-5">
                                            <h6 class="text-muted mb-3"><i class="fa-solid fa-quote-left me-2"></i>Written Feedback</h6>
                                            <div class="p-4 bg-light rounded-4 border fst-italic shadow-sm" style="font-size: 1.15rem; color: #2b2b2b; line-height: 1.7;">
                                                "${comment.content}"
                                            </div>
                                        </div>
                                        
                                        <div class="mt-4 pt-3 border-top text-muted small text-end">
                                            Review submitted on: <strong><fmt:formatDate value="${comment.commentDate}" pattern="dd MMM yyyy, hh:mm a" /></strong>
                                        </div>

                                    </c:if>
                                </c:forEach>

                                <%-- Error handling just in case --%>
                                <c:if test="${!foundComment}">
                                    <div class="text-center py-5 text-danger">
                                        <i class="fa-solid fa-triangle-exclamation fa-4x mb-4 opacity-50"></i>
                                        <h4 class="fw-bold">Review Not Found</h4>
                                        <p class="text-muted">We couldn't locate the review for this specific appointment.</p>
                                    </div>
                                </c:if>

                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="component/footer.jsp" />

        <script src="static/js/jquery-3.7.1.min.js"></script>
        <script src="static/js/bootstrap.bundle.min.js"></script>
        <script src="static/js/wow.min.js"></script>
        <script src="static/js/main.js"></script>
    </body>
</html>
