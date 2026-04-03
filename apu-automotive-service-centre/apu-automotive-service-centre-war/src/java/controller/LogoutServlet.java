/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 *
 * @author TPY
 */
@WebServlet(name = "LogoutServlet", urlPatterns = {"/LogoutServlet"})
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. Get the current session (but pass 'false' so we don't accidentally create a new one if it expired)
        HttpSession session = request.getSession(false);
        
        // 2. If a session exists, completely destroy it and everything inside it
        if (session != null) {
            session.invalidate();
        }
        
        // 3. Create a brand new, empty session strictly to hold our popup message
        HttpSession newSession = request.getSession(true);
        newSession.setAttribute("popupMessage", "You have been successfully logged out. Have a great day!");
        newSession.setAttribute("popupType", "success");
        
        // 4. Send them back to the login screen
        response.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Just in case a logout gets triggered via a POST form instead of a standard link
        doGet(request, response);
    }
}
