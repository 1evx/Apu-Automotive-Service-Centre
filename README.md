# APU Automotive Service Centre

A role-based automotive service centre management system built as a Java EE 7 enterprise application. It brings customer registration, appointment scheduling, technician job tracking, payments, loyalty rewards, reporting, and staff administration into one web application.

The project uses a multi-module EAR structure: a JSP/Servlet web module provides the user interface and request handling, while an EJB module contains the JPA entities, session facades, validation utilities, and persistence logic.

## Table of contents

- [Key features](#key-features)
- [User roles](#user-roles)
- [Typical workflow](#typical-workflow)
- [Technology stack](#technology-stack)
- [Architecture](#architecture)
- [Data model](#data-model)
- [Getting started](#getting-started)
- [Optional integrations](#optional-integrations)
- [Security notes](#security-notes)
- [Project structure](#project-structure)
- [Building from the command line](#building-from-the-command-line)
- [Troubleshooting](#troubleshooting)
- [License](#license)

## Key features

### Customer and account management

- Public customer registration and login
- Staff-assisted customer registration at the service counter
- Customer record viewing, editing, and deletion
- Profile updates for authenticated users
- Malaysian IC number, email, and phone number validation
- Account activation checks and session-based access control
- Automated welcome emails for newly registered customers and staff

### Appointment management

- Appointment booking by counter staff
- Service, date, time, vehicle registration number, and remarks capture
- Available-technician assignment with schedule conflict checks
- Appointment editing and status tracking
- Active-job checks that help prevent invalid customer or technician deletion
- Detailed appointment and invoice views
- Appointment lifecycle support, including scheduled, in-progress, completed, cancelled, rejected, and paid records

### Technician operations

- Dedicated technician dashboard
- Assigned-task and workload views
- Technician specialisation and availability tracking
- Job status updates
- Completion reports and technical feedback attached to appointments
- Customer ratings used to calculate technician performance averages

### Payments and loyalty rewards

- Checkout and payment recording for completed services
- Payment method, amount, and transaction date capture
- Automatic appointment transition to paid status
- Loyalty points earned from completed payments
- Redemption in blocks of 100 points to reduce the checkout total
- Customer payment history and receipt access
- Downloadable PDF receipts through `html2pdf.js`
- Print-friendly appointment invoices

### Manager dashboard

- Operational summary cards and dashboard views
- Revenue totals and service-demand statistics
- Appointment, payment, feedback, customer, and staff oversight
- Service catalogue creation, editing, and deletion
- Staff registration, editing, activation, and removal
- Technician rating and performance information
- Natural-language AI assistant for querying management data

### Super Manager controls

- A separate `SUPER_MANAGER` role above the standard Manager role
- Only Super Managers can register new Manager accounts
- Super Manager accounts are protected from modification by ordinary Managers
- Master-clearance information can be maintained for privileged accounts

### Public website

- Home, About, Services, Contact, Login, and Registration pages
- Responsive Bootstrap-based interface
- Reusable JSP components for navigation, footers, modals, alerts, search, and loading states

## User roles

| Role | Main capabilities |
| --- | --- |
| Customer | Register, sign in, update a profile, view appointments and service history, inspect technician feedback, view payments, download receipts, and submit ratings/comments. |
| Counter Staff | Register and maintain customers, book and edit appointments, assign technicians, and complete checkout/payment processing. |
| Technician | View assigned jobs, update task progress, complete work, and submit technical reports. |
| Manager | Monitor operations, appointments, revenue, services, customers, feedback, and staff; manage the service catalogue and authorised staff accounts; use the AI assistant. |
| Super Manager | Has Manager access plus authority over Manager creation and protected high-privilege accounts. |

Access to protected servlets is enforced by `AuthFilter`. The filter reloads the signed-in user from the database, rejects inactive accounts, and checks the user's actual entity type against the roles permitted for each route.

## Typical workflow

1. A customer self-registers, or counter staff creates the customer account.
2. Counter staff selects a service, date, time, vehicle plate, and available technician to create an appointment.
3. The assigned technician sees the task on the technician dashboard and updates its status while work progresses.
4. When the work is complete, the technician records a service report.
5. Counter staff checks out the appointment, optionally applies eligible loyalty points, and records the payment.
6. The customer can view the completed service, technician report, payment record, and downloadable receipt, then leave a rating and comment.
7. Managers monitor revenue, service popularity, staff performance, customer feedback, and overall operations.

## Technology stack

| Area | Technology |
| --- | --- |
| Language | Java 8 |
| Enterprise platform | Java EE 7 |
| Web layer | JSP, Servlets, JSTL, HTML, CSS, JavaScript |
| Business layer | Stateless EJB session facades |
| Persistence | JPA 2.1 with JTA transactions |
| Database | Apache Derby Network Server |
| Application server | GlassFish 4 / Java EE 7-compatible GlassFish configuration |
| Build | Apache Ant and NetBeans project metadata |
| UI libraries | Bootstrap, jQuery, Font Awesome, Swiper, WOW.js |
| PDF export | html2pdf.js, html2canvas, jsPDF |
| Email | JavaMail with Gmail SMTP |
| AI integration | Google Gemini REST API (`gemini-2.5-flash`) |

## Architecture

The repository follows a four-tier design:

1. **Presentation tier** — JSP pages, reusable JSP components, CSS, JavaScript, and browser-side PDF generation.
2. **Web/controller tier** — Servlets process requests, validate input, prepare dashboard data, and route users to views.
3. **Business and persistence tier** — EJB facades encapsulate CRUD operations, reporting queries, scheduling checks, and JPA access.
4. **Data tier** — Apache Derby stores users, appointments, service types, payments, feedback, and comments.

The deployable enterprise archive contains two modules:

- `apu-automotive-service-centre-war`: JSP views, static assets, authentication filter, and controllers.
- `apu-automotive-service-centre-ejb`: entities, EJB facades, persistence configuration, validators, and email utility.

## Data model

The main domain objects are:

- `SystemUser`: shared account information and the parent entity for all user types.
- `Customer`: a system user with a loyalty-points balance.
- `CounterStaff`: a system user with shift information.
- `Technician`: a system user with specialisation and availability.
- `Manager`: a system user with office-location information.
- `SuperManager`: a privileged system user with master-clearance information.
- `ServiceType`: service name, description, estimated duration, and price.
- `Appointment`: customer, technician, service, date/time, vehicle plate, remarks, and status.
- `Payment`: one-to-one payment information for an appointment.
- `Feedback`: a technician's service report associated with an appointment.
- `Comment`: a customer's written review and 1–5 star rating for an appointment.

User subtypes use JPA inheritance and discriminator values. Entity relationships connect appointments to customers, technicians, services, payments, reports, and reviews.

## Getting started

### Prerequisites

Install the following software:

- JDK 8
- NetBeans with Java EE support
- GlassFish 4.x configured in NetBeans
- Apache Derby Network Server (commonly included with GlassFish/NetBeans)
- Apache Ant if you want to build outside NetBeans

The project metadata targets Java EE 7, Java source level 1.8, and the GlassFish `gfv4ee7` server type. Newer Jakarta EE servers use the `jakarta.*` namespace and will require migration before this application can run on them.

### 1. Clone and open the project

```bash
git clone <repository-url>
cd APU-Automotive-Service-Centre/apu-automotive-service-centre
```

In NetBeans, choose **File > Open Project** and select the inner `apu-automotive-service-centre` directory. NetBeans should recognise the EAR and its EJB and WAR subprojects.

### 2. Start and configure Derby

Start the Derby Network Server on `localhost:1527`, then create a database with these values:

| Setting | Default project value |
| --- | --- |
| Database name | `apu_asc_db` |
| JDBC URL | `jdbc:derby://localhost:1527/apu_asc_db` |
| User | `APP` |
| Password | `APP` |
| JNDI resource | `jdbc/apu_asc_db` |

The GlassFish resource descriptor is located at:

```text
apu-automotive-service-centre-ejb/src/conf/META-INF/glassfish-resources.xml
```

GlassFish must expose the `jdbc/apu_asc_db` JNDI data source. The included descriptor defines both the JDBC connection pool and resource, so NetBeans/GlassFish can create them during deployment. If automatic resource creation does not occur, create the pool and JNDI resource manually in the GlassFish Admin Console using the values above.

> **Important:** `persistence.xml` currently sets `javax.persistence.schema-generation.database.action` to `create`. Redeployment may recreate the schema and remove existing data. Change this setting to `none` after initial schema creation when you need persistent development data.

### 3. Configure optional services

Email and the Manager AI Assistant require valid external-service credentials. See [Optional integrations](#optional-integrations) before using those features.

### 4. Build and run

In NetBeans:

1. Confirm that GlassFish is selected as the application server.
2. Clean and Build the EAR project.
3. Run or Deploy the EAR project.
4. Open the URL shown by NetBeans. The configured start page is `login.jsp`.

The final package is generated as:

```text
apu-automotive-service-centre/dist/apu-automotive-service-centre.ear
```

### 5. Create the initial privileged account

Public registration creates Customer accounts only, and the application does not include a database seeder for an initial Manager or Super Manager. After the schema is created, seed the first privileged account through a controlled database administration process. Ensure the base `SYSTEM_USER` row and the appropriate inherited subtype data/discriminator match the JPA mapping before signing in.

Do not publish production or demonstration credentials in this README.

## Optional integrations

### Welcome email

`EmailUtility` sends HTML welcome messages through Gmail SMTP on port 587 with STARTTLS. Customer and staff registration still completes if delivery fails, but the welcome message will not arrive.

Before deployment, provide a dedicated sender account and Google App Password. The current implementation stores SMTP settings in `EmailUtility.java`; for a shared or production environment, move them to environment variables, JVM properties, or a server-managed mail session.

### Manager AI Assistant

The manager dashboard can send natural-language questions to Gemini, convert the response into SQL, execute the query, and render the results as a table. Access is limited to Manager and Super Manager routes, and the servlet blocks SQL containing common destructive keywords.

To enable it, configure a valid Google Gemini API key in `AIAssistantServlet.java`. For secure deployments, load the key from an environment variable or secret manager instead of committing it to source control.

Because model-generated SQL is executed against the application database, keyword blocking alone is not a complete security boundary. Use a read-only database account, validate queries with a strict allowlist/parser, restrict accessible tables, and apply query/time limits before production use.

## Security notes

This is an academic/demo project and should be hardened before production use:

- Rotate any API keys, SMTP passwords, or other secrets that have ever been committed to the repository.
- Move all credentials out of Java/XML source and into protected deployment configuration.
- Passwords are currently compared directly with the stored `passwordHash` field; introduce a modern password hashing scheme such as Argon2, bcrypt, or PBKDF2 before handling real accounts.
- Use HTTPS and secure cookie settings in production.
- Add CSRF protection to state-changing requests.
- Validate and encode all user-controlled content to reduce injection and cross-site scripting risks.
- Give the application's database identity only the minimum required permissions.
- Replace automatic schema creation with managed, versioned database migrations.
- Do not rely solely on AI-generated SQL keyword filtering.

See [SECURITY.md](SECURITY.md) for the repository's vulnerability-reporting guidance.

## Project structure

```text
APU-Automotive-Service-Centre/
├── README.md
├── ADDITIONAL_FEATURES_REPORT.md
├── SECURITY.md
├── LICENSE
└── apu-automotive-service-centre/          # EAR project
    ├── build.xml
    ├── nbproject/
    ├── apu-automotive-service-centre-ejb/  # Entities, facades, utilities, JPA config
    │   └── src/
    │       ├── java/model/
    │       ├── java/utility/
    │       └── conf/
    └── apu-automotive-service-centre-war/  # Servlets, auth, JSPs, static assets
        ├── src/java/
        │   ├── auth/
        │   └── controller/
        └── web/
            ├── component/
            └── static/
```

Generated `build/` and `dist/` content is not application source and can be recreated by the build.

## Building from the command line

The checked-in Ant scripts were generated by NetBeans and depend on a valid NetBeans/GlassFish Java EE configuration. From the EAR project directory, run:

```bash
ant clean
ant dist
```

If Ant reports missing Java EE libraries, server paths, or NetBeans build properties, open the project in NetBeans, assign GlassFish, and build it there first. Deployment can then be performed through NetBeans or with the GlassFish `asadmin deploy` command against the generated EAR.

No automated test suite is currently included. After deployment, manually verify registration/login, each role's route restrictions, appointment assignment, technician completion, checkout and loyalty calculations, receipt generation, and dashboard reporting.

## Troubleshooting

### The application cannot connect to the database

- Confirm Derby Network Server is running on port `1527`.
- Confirm the `apu_asc_db` database exists and accepts the configured credentials.
- Test the `ApuAscPool` connection in the GlassFish Admin Console.
- Confirm the JNDI name is exactly `jdbc/apu_asc_db`.

### The build cannot find Java EE classes

- Use JDK 8 and a Java EE 7-compatible GlassFish installation.
- Reassign the application server for all three NetBeans projects.
- Resolve any missing NetBeans library references, then clean and rebuild the EAR.

### A dashboard redirects to the login page

Protected routes require a valid active-user session and the correct role. Sign in with the appropriate account and confirm its database record is active and has the correct JPA subtype/discriminator.

### Email is not delivered

- Verify internet access from the application server.
- Use a Google App Password rather than the account's normal password.
- Confirm SMTP port `587` is not blocked.
- Check the GlassFish server log for JavaMail errors.

### The AI assistant returns an API error

- Confirm that the Gemini API key is valid and enabled for the selected model.
- Verify outbound HTTPS access from GlassFish.
- Review the server log for the HTTP response code and API message.

## Additional documentation

- [Additional Features Report](ADDITIONAL_FEATURES_REPORT.md) — implementation discussion and code excerpts for PDF export, email, AI assistance, loyalty discounts, and Super Manager controls.
- [Security Policy](SECURITY.md) — supported versions and vulnerability reporting.

## License

This project is licensed under the [Apache License 2.0](LICENSE).
