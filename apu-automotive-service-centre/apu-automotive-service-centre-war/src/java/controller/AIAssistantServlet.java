/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.SystemUserFacade;

/**
 *
 * @author Asus
 */
@WebServlet(name = "AIAssistantServlet", urlPatterns = {"/AIAssistantServlet"})
public class AIAssistantServlet extends HttpServlet {

    @EJB
    private SystemUserFacade systemUserFacade;

    private static final String API_KEY = "AIzaSyB1TYqHLqqVvuaJ-suz__89Ml4SyN1lpJc"; 
    private static final String API_URL = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=" + API_KEY;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String userQuestion = request.getParameter("question");
        response.setContentType("text/html;charset=UTF-8");

        if (userQuestion == null || userQuestion.trim().isEmpty()) {
            response.getWriter().write("<div class='alert alert-warning'>Please ask a question.</div>");
            return;
        }

        try {
            // Prompt to ban IDs and force JOINs for Names
            String promptText = "You are a SQL expert for a car service center. Database Schema (Apache Derby): "
                + "APP.MY_USER (USERID, USERNAME, EMAIL, PASSWORDHASH, ROLE, ISACTIVE, FULLNAME, PHONENUMBER, ADDRESS, ICNUMBER); "
                + "APP.COUNTER_STAFF (USERID, SHIFTTYPE); "
                + "APP.CUSTOMER (USERID, LOYALTYPOINTS); "
                + "APP.MANAGER (USERID, OFFICELOCATION); "
                + "APP.TECHNICIAN (USERID, SPECIALIZATION, ISAVAILABLE); "
                + "APP.SERVICE_TYPE (ID, NAME, DESCRIPTION, PRICE, DURATIONHOURS, ISACTIVE); "
                + "APP.APPOINTMENT (ID, APPOINTMENTDATE, APPOINTMENTTIME, CARPLATENUMBER, STATUS, REMARKS, SERVICETYPE_ID, CUSTOMER_ID, TECHNICIAN_ID); "
                + "APP.COMMENTS (ID, COMMENTDATE, CONTENT, RATING, APPOINTMENT_ID); "
                + "APP.FEEDBACK (ID, FEEDBACKTYPE, COMMENTS, SUBMISSIONDATE, APPOINTMENT_ID); "
                + "APP.PAYMENT (ID, PAYMENTDATE, AMOUNT, METHOD, APPOINTMENT_ID). "
                + "CRITICAL RULES: "
                + "1. Output ONLY raw SQL string. No markdown, no backticks. "
                + "2. NEVER SELECT columns ending in '_ID' or 'USERID'. "
                + "3. JOIN with APP.MY_USER to get FULLNAME instead of showing CUSTOMER_ID or TECHNICIAN_ID. "
                + "4. JOIN with APP.SERVICE_TYPE to get NAME instead of showing SERVICETYPE_ID. "
                + "5. Use SINGLE QUOTES (') for values, DOUBLE QUOTES (\") for aliases. "
                + "6. No semicolons. "
                + "Question: " + userQuestion;

            String generatedSql = callGemini(promptText);
            
            generatedSql = generatedSql
                .replaceAll("```sql", "")   //remove markdown
                .replaceAll("```", "")
                .replace("\\\"", "\"")      //fix escaped quotes
                .replace("\\'", "'")        //fix escaped single quotes
                .replaceAll(":", "")        //regex replace for all colons
                .replace(";", "")           //remove semicolons
                .replace("\\n", " ")        //fix escaped newlines
                .trim();

            //chop any colon left at the end
            while (generatedSql.endsWith(":")) {
                generatedSql = generatedSql.substring(0, generatedSql.length() - 1).trim();
            }

            System.out.println("DEBUG - Final SQL: [" + generatedSql + "]");

            String upperSql = generatedSql.toUpperCase();
            if (upperSql.contains("DROP") || upperSql.contains("DELETE") || upperSql.contains("UPDATE") || upperSql.contains("INSERT")) {
                response.getWriter().write("<div class='alert alert-danger'>Security Block: Destructive queries are not allowed.</div>");
                return;
            }

            List<Object[]> results = systemUserFacade.runAIGeneratedQuery(generatedSql);

            if (results.size() <= 1) { 
                response.getWriter().write("<div class='alert alert-info'>No records found for that query.</div>");
            } else {
                StringBuilder html = new StringBuilder("<table class='table table-striped table-hover border mt-3 shadow-sm'>");
                
                Object[] headers = results.get(0);
                html.append("<thead class='table-dark'><tr>");
                for (Object header : headers) {
                    html.append("<th>").append(header.toString()).append("</th>");
                }
                html.append("</tr></thead><tbody>");
                
                for (int i = 1; i < results.size(); i++) {
                    Object[] row = results.get(i);
                    html.append("<tr>");
                    for (Object col : row) {
                        html.append("<td>").append(col != null ? col.toString() : "-").append("</td>");
                    }
                    html.append("</tr>");
                }
                html.append("</tbody></table>");
                
                html.append("<p class='text-muted small mt-2'>SQL executed: <code>").append(generatedSql).append("</code></p>");
                response.getWriter().write(html.toString());
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("<div class='alert alert-danger'>AI Assistant encountered an error. Please try again in 30 seconds.</div>");
        }
    }

    private String callGemini(String promptText) throws Exception {
        URL url = new URL(API_URL);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setDoOutput(true);

        String safePrompt = promptText
            .replace("\\", "\\\\")
            .replace("\"", "\\\"")
            .replace("\n", " ")
            .replace("\r", " ")
            .replace("\t", " ");

        String jsonInput = "{\"contents\": [{\"parts\":[{\"text\": \"" + safePrompt + "\"}]}]}";

        try (OutputStream os = conn.getOutputStream()) {
            os.write(jsonInput.getBytes("utf-8"));
        }

        int responseCode = conn.getResponseCode();
        if (responseCode >= 400) {
            StringBuilder errorRes = new StringBuilder();
            try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "utf-8"))) {
                String line;
                while ((line = br.readLine()) != null) {
                    errorRes.append(line.trim());
                }
            }
            throw new Exception("Google API Error (" + responseCode + ") - " + errorRes.toString());
        }

        StringBuilder res = new StringBuilder();
        try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"))) {
            String line;
            while ((line = br.readLine()) != null) {
                res.append(line.trim());
            }
        }

        String raw = res.toString();
        
        String searchStr = "\"text\": \"";
        int start = raw.indexOf(searchStr);
        if (start == -1) {
            throw new Exception("Unexpected AI Response Format.");
        }
        start += searchStr.length();
        
        // THE FIX: A smart loop that skips escaped characters like \"
        int end = -1;
        for (int i = start; i < raw.length(); i++) {
            // if see a backslash, skip the next character (it's escaped!)
            if (raw.charAt(i) == '\\') {
                i++; 
                continue;
            }
            // if see an unescaped quote, THAT is the true end of the JSON string
            if (raw.charAt(i) == '"') {
                end = i;
                break;
            }
        }

        if (end == -1) {
             throw new Exception("Could not find end of AI response.");
        }

        String extractedText = raw.substring(start, end);
        
        // Final sanitation
        return extractedText.replace("\\n", " ")
                           .replace("\\\"", "\"")
                           .replace("\\'", "'")
                           .replace("\\", "")
                           .trim();
    }
}