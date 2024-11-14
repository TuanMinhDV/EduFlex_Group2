package controller.auth;

import dto.AccountDAO;
import model.Account;
import utils.EmailUtilsByAdmin;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "ChangeRoleAccountByAdmin", urlPatterns = {"/changeroleaccountbyadmin"})
public class ChangeRoleAccountByAdmin extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accountIdParam = request.getParameter("accountId");
        String newRoleId = request.getParameter("newRoleId");
        String currentStatusParam = request.getParameter("currentStatus");
        String sendMailParam = request.getParameter("sendMail");

        AccountDAO dao = new AccountDAO();
        boolean isUpdated = false;
        String statusMessage = "Failed to save changes.";  // Default message if updates fail

        try {
            int accountId = Integer.parseInt(accountIdParam);
            boolean currentStatus = Boolean.parseBoolean(currentStatusParam);
            boolean sendEmail = "true".equals(sendMailParam);

            // Update role if newRoleId is provided
            if (newRoleId != null) {
                isUpdated = dao.updateAccountRole(accountId, Integer.parseInt(newRoleId));
            }

            // Toggle status
            boolean newStatus = !currentStatus;
            // Update status in the database
            isUpdated = dao.updateAccountStatus(accountId, newStatus);

            // If updates succeeded
            if (isUpdated) {
                statusMessage = "Changes saved successfully.";

                // If email notification is requested
                if (sendEmail) {
                    Account account = dao.getAccountByIdByAdmin(accountId);
                    if (account != null) {
                        String subject = "Account Status Change Notification";
                        String body = "Hello " + account.getFullname() + ",\n\n"
                                + "The status of your account has been updated.\n"
                                + "Account information:\n"
                                + "Username: " + account.getUsername() + "\n"
                                + "Email: " + account.getEmail() + "\n"
                                + "Phone Number: " + account.getPhone() + "\n"
                                + "Role: " + account.getRoleName() + "\n"
                                + "Status: " + (newStatus ? "Active" : "Blocked") + "\n\n"
                                + "Thank you!";

                        // Send email
                        EmailUtilsByAdmin.sendEmail(account.getEmail(), subject, body);
                        statusMessage += " Email sent successfully.";
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Set status message as a session attribute
        HttpSession session = request.getSession();
        session.setAttribute("statusMessage", statusMessage);

        // Redirect to the account list page
        // Redirect with status message as a URL parameter
        response.sendRedirect("accountcontrollerbyadmin?statusMessage=" + java.net.URLEncoder.encode(statusMessage, "UTF-8"));

    }
}
