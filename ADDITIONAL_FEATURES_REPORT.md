# Additional Features Report for APU Automotive Service Centre

## 1. Introduction

This report presents the additional features implemented in the APU Automotive Service Centre system to improve service quality, operational efficiency, and administrative control. The existing system already supports core automotive service centre activities such as appointment booking, job tracking, payment processing, technician feedback, and role-based access for different user groups. Building on this foundation, several enhancements were introduced to strengthen the system's practicality and value in a real service environment.

The five additional features discussed in this report are Download PDF, Send Email, Manager AI Assistant, Discount for Loyalty Points, and Super Manager. These features were selected because they address both user-facing convenience and internal management needs. Together, they improve communication, documentation, decision-making, customer retention, and system security.

## 2. Existing System Overview

The APU Automotive Service Centre is implemented as a multi-tier enterprise web application with separated modules for business logic and web presentation. The system supports several main roles, namely Customer, Counter Staff, Technician, and Manager. Each role is given access only to the functions relevant to its responsibilities, which helps maintain security and workflow clarity.

Within the current system, customers can manage appointments, track service history, review technician feedback, and access payment records. Counter staff can register customers, manage appointments, and process payments. Technicians are able to update service progress and submit job reports, while managers can monitor staff performance, service popularity, revenue trends, and operational records through the management dashboard. The additional features introduced in this report extend these existing capabilities and make the system more complete and more professional for real-world use.

## 3. Additional Features Implemented

### 3.1 Download PDF

The Download PDF feature improves the system's documentation capability by allowing service and payment records to be produced in a formal, shareable format. In service centres, invoices and receipts are important not only for customer reference, but also for record keeping, auditing, and after-service support. A printable or downloadable document helps both customers and staff retain proof of payment and service completion in a more organised way.

In the APU Automotive Service Centre system, this feature is implemented through the appointment and receipt workflows. The appointment details page provides a print-friendly invoice layout, while the customer dashboard includes PDF receipt generation for paid services. This approach gives the system the practical ability to export service records in a professional format without requiring users to manually copy or re-enter details elsewhere. As a result, the system offers a more complete service experience and better administrative documentation.

### 3.2 Send Email

The Send Email feature strengthens communication between the system and its users. In many service platforms, timely communication is essential to ensure that customers and employees receive important account details and onboarding information without delay. Manual communication methods are slow and inconsistent, especially when the number of users grows.

In this system, automated email functionality is used during account-related workflows, especially when new customers or staff members are registered. The email utility prepares structured welcome messages containing account information and role-specific details. This makes the onboarding process more efficient and professional, while also reducing the workload for administrative staff. From a business perspective, the feature improves responsiveness, increases trust, and creates a stronger first impression for new users entering the system.

### 3.3 Manager AI Assistant

The Manager AI Assistant is an intelligent enhancement added to the management dashboard to support faster access to business information. Managers often need to retrieve insights such as revenue summaries, service demand patterns, or staff performance indicators. Traditional dashboard filters are useful, but they may still require multiple steps or technical knowledge to obtain specific answers.

The AI assistant addresses this challenge by allowing managers to ask questions in natural language. The system then interprets the request and converts it into a database query to retrieve relevant information. This feature makes managerial analysis more efficient and more accessible, especially for non-technical users. It also adds innovation to the project by showing how artificial intelligence can be integrated into business systems to support data-driven decision-making in a more user-friendly way.

### 3.4 Discount for Loyalty Points

The Discount for Loyalty Points feature was introduced to support customer retention and repeat business. Loyalty programmes are widely used in service-based businesses because they reward returning customers and encourage long-term engagement. In the context of an automotive service centre, this kind of feature can help build stronger customer relationships while also increasing the likelihood of repeated service bookings.

In the current system, customers accumulate loyalty points through payment transactions, and these points can later be redeemed during checkout to reduce the payable amount. The implementation ensures that the reward system is tied directly to real transactions, making the mechanism fair and measurable. This feature benefits customers by giving them tangible value for continued usage, while the business benefits from improved customer satisfaction and stronger loyalty over time.

### 3.5 Super Manager

The Super Manager feature introduces a higher administrative authority above the standard Manager role. In a system with multiple staff roles and sensitive administrative actions, it is important to separate routine management tasks from high-level authority. Not every manager should be allowed to create or modify privileged accounts, because that could create unnecessary security risks or lead to improper access escalation.

To address this, the system includes a dedicated Super Manager role with stronger authority and additional clearance control. This role is used for critical staff management functions, such as registering new managers and protecting high-privilege accounts from unauthorised modification. By distinguishing between Manager and Super Manager responsibilities, the system improves governance, strengthens access control, and better reflects real organisational hierarchy.

## 4. Benefits to Users and Business Operations

The five additional features collectively improve the system in several important ways. First, they enhance professionalism and convenience for customers through better documentation and loyalty-based rewards. PDF-ready receipts and invoices provide customers with clear proof of transactions, while loyalty point redemption encourages repeat usage and improves the overall service experience.

Second, the features strengthen communication and operational efficiency. Automated email delivery reduces administrative effort and ensures that account information reaches customers and staff quickly. At the same time, the Manager AI Assistant helps management retrieve operational insights more efficiently, reducing dependency on manual searching or complex reporting steps.

Third, these features improve administrative governance and system security. The Super Manager role introduces stronger control over privileged actions and protects sensitive staff management tasks from ordinary access. Together, these enhancements make the system more reliable, scalable, and suitable for a realistic service-centre environment.

## 5. Conclusion

In conclusion, the additional features implemented in the APU Automotive Service Centre system significantly extend its functionality beyond the core service workflow. The Download PDF feature improves documentation, the Send Email feature enhances communication, the Manager AI Assistant supports intelligent decision-making, the Discount for Loyalty Points feature promotes customer retention, and the Super Manager role strengthens administrative control.

These enhancements demonstrate that the system is not only capable of handling day-to-day automotive service operations, but is also designed with usability, business value, and access security in mind. As a result, the project becomes more complete, more practical, and more aligned with the expectations of a modern enterprise service platform.

## 6. Appendix: Implementation Code Snippets

### Appendix A: Download PDF

The following snippets show that the system supports both print-friendly invoice output and downloadable PDF receipt generation. The first example uses a print-based invoice view, while the second uses `html2pdf` to save a receipt as a PDF file.

Source: `apu-automotive-service-centre-war/web/appointment_details.jsp`

```jsp
<div class="d-flex justify-content-between align-items-center mb-4 btn-print-hide">
    <a href="ManagerDashboardServlet#view-appointment" class="btn btn-outline-secondary fw-bold shadow-sm rounded-pill px-4 py-2">
        <i class="fa-solid fa-arrow-left me-2"></i> Back to Dashboard
    </a>
    <button class="btn btn-primary fw-bold shadow-sm rounded-pill px-4 py-2" onclick="window.print()">
        <i class="fa-solid fa-print me-2"></i> Print Invoice
    </button>
</div>
```

Source: `apu-automotive-service-centre-war/web/customer_dashboard.jsp`

```jsp
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>

const pdfOptions = {
    margin:       0.2,
    filename:     'APU_Care_Receipt_REC-' + receiptId + '.pdf',
    image:        { type: 'jpeg', quality: 1.0 },
    html2canvas:  { scale: 2, useCORS: true },
    jsPDF:        { unit: 'in', format: 'a4', orientation: 'landscape' }
};

html2pdf().set(pdfOptions).from(receiptElement).save();
```

### Appendix B: Send Email

This implementation shows that the system contains a reusable email utility for sending structured welcome emails. It is used during registration workflows so that customers and staff automatically receive their account-related information.

Source: `apu-automotive-service-centre-ejb/src/java/utility/EmailUtility.java`

```java
public static void sendCustomerWelcomeEmail(String targetEmail, String customerName, String tempPassword) {
    message.setFrom(new InternetAddress(SENDER_EMAIL));
    message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(targetEmail));
    message.setSubject("Welcome to APU Care! Your Account Details Inside");

    String htmlContent = "<h2>Welcome to APU Care, " + customerName + "!</h2>"
            + "<p>Your account has been successfully created.</p>"
            + "<strong>Email / Username:</strong> " + targetEmail + "<br>"
            + "<strong>Temporary Password:</strong> " + tempPassword;

    message.setContent(htmlContent, "text/html; charset=utf-8");
    Transport.send(message);
}
```

Source: `apu-automotive-service-centre-war/src/java/controller/RegisterStaffServlet.java`

```java
final String targetEmail = email;
final String targetName = fullName;
final String tempPass = password;
final String assignedRole = role;

new Thread(() -> {
    utility.EmailUtility.sendStaffWelcomeEmail(targetEmail, targetName, tempPass, assignedRole);
}).start();
```

### Appendix C: Manager AI Assistant

The following snippets show how the manager dashboard collects a natural-language question and sends it to the AI assistant servlet. The servlet then generates a SQL query, blocks destructive operations, and returns safe results for display.

Source: `apu-automotive-service-centre-war/web/manager_dashboard.jsp`

```jsp
<h5><i class="fa-solid fa-wand-magic-sparkles text-warning me-2"></i>Ask the AI Assistant</h5>
<div class="input-group">
    <input type="text" id="aiQuery" class="form-control" placeholder="e.g., Show me total revenue by service type for this month">
    <button class="btn btn-dark" onclick="askAI()">Ask</button>
</div>

<div id="aiResults" class="mt-3 table-responsive"></div>
```

Source: `apu-automotive-service-centre-war/src/java/controller/AIAssistantServlet.java`

```java
String generatedSql = callGemini(promptText);
generatedSql = generatedSql.replaceAll("```sql", "")
                           .replaceAll("```", "")
                           .replace(";", "")
                           .trim();

String upperSql = generatedSql.toUpperCase();
if (upperSql.contains("DROP") || upperSql.contains("DELETE")
        || upperSql.contains("UPDATE") || upperSql.contains("INSERT")) {
    response.getWriter().write("<div class='alert alert-danger'>Security Block: Destructive queries are not allowed.</div>");
    return;
}

List<Object[]> results = systemUserFacade.runAIGeneratedQuery(generatedSql);
```

### Appendix D: Discount for Loyalty Points

These snippets show that loyalty points are handled at both the user interface and payment-processing levels. The checkout form allows point redemption in fixed blocks, while the servlet updates the stored points after redemption and payment reward calculation.

Source: `apu-automotive-service-centre-war/web/component/checkoutAppointmentModal.jsp`

```jsp
<div class="alert alert-info border-info mb-4" id="loyaltyPointsBox" style="display: none;">
    <strong class="small text-muted d-block">Current Points</strong>
    <span class="badge bg-primary" id="checkout-currentPoints"></span>
    <input type="number" id="pointsToRedeem" name="pointsToRedeem"
           class="form-control form-control-sm border-primary text-center"
           value="0" min="0" step="100" onkeyup="applyDiscount()" onchange="applyDiscount()">
</div>
```

Source: `apu-automotive-service-centre-war/src/java/controller/ProcessPaymentServlet.java`

```java
String pointsStr = request.getParameter("pointsToRedeem");
int typedPoints = (pointsStr != null && !pointsStr.isEmpty()) ? Integer.parseInt(pointsStr) : 0;
int actualPointsToRedeem = (typedPoints / 100) * 100;

if (actualPointsToRedeem >= 100 && customer.getLoyaltyPoints() >= actualPointsToRedeem) {
    customer.setLoyaltyPoints(customer.getLoyaltyPoints() - actualPointsToRedeem);
}

int pointsEarned = (int) (amountPaid / 10);
customer.setLoyaltyPoints(customer.getLoyaltyPoints() + pointsEarned);
customerFacade.edit(customer);
```

### Appendix E: Super Manager

The following code shows how the Super Manager role is defined and how its higher privilege is enforced. The system restricts manager creation and protects Super Manager accounts from modification by ordinary managers.

Source: `apu-automotive-service-centre-ejb/src/java/model/SuperManager.java`

```java
@Entity
@DiscriminatorValue("SUPER_MANAGER")
@Table(name = "SUPER_MANAGER", schema = "APP")
public class SuperManager extends SystemUser implements Serializable {

    private String masterClearance;

    public String getMasterClearance() {
        return masterClearance;
    }
}
```

Source: `apu-automotive-service-centre-war/src/java/controller/RegisterStaffServlet.java`

```java
case "Manager":
    if (!(currentUser instanceof SuperManager)) {
        session.setAttribute("popupMessage", "Access Denied: Only a Super Manager can register new Managers.");
        session.setAttribute("popupType", "error");
        response.sendRedirect("ManagerDashboardServlet#manage-staff");
        return;
    }

    newStaff = new Manager();
    break;
```

Source: `apu-automotive-service-centre-war/src/java/controller/UpdateStaffServlet.java`

```java
if (staffToUpdate instanceof SuperManager && !(currentUser instanceof SuperManager)) {
    session.setAttribute("popupMessage", "CRITICAL SECURITY ALERT: You do not have clearance to modify a Super Manager account.");
    session.setAttribute("popupType", "error");
    response.sendRedirect("ManagerDashboardServlet#manage-staff");
    return;
}
```
