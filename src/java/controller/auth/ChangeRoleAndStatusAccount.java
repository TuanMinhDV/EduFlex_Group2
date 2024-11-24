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

@WebServlet(name = "ChangeRoleAndStatusAccount", urlPatterns = {"/changeroleandstatusaccount"})
public class ChangeRoleAndStatusAccount extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accountIdParam = request.getParameter("accountId");
        String newRoleIdParam = request.getParameter("newRoleId");
        String newStatusParam = request.getParameter("newStatus");
        String sendMailParam = request.getParameter("sendMail");

        AccountDAO dao = new AccountDAO();
        boolean isUpdated = false;
        String statusMessage = "Failed to apply changes."; // Default message for failure

        try {
            int accountId = Integer.parseInt(accountIdParam);
            boolean newStatus = "1".equals(newStatusParam); // Convert newStatusParam to boolean
            boolean sendMail = "true".equals(sendMailParam);

            // Update role if a new role is provided
            if (newRoleIdParam != null) {
                int newRoleId = Integer.parseInt(newRoleIdParam);
                isUpdated = dao.updateAccountRole(accountId, newRoleId);
            }

            // Update account status
            isUpdated = dao.updateAccountStatus(accountId, newStatus) || isUpdated;

            // If update succeeded
            if (isUpdated) {
                statusMessage = "Changes applied successfully.";

                // Send email notification if requested
                if (sendMail) {
                    Account account = dao.getAccountByIdByAdmin(accountId);
                    if (account != null) {
                        String subject = "Account Role/Status Update";
                        String body = "Dear " + account.getFullname() + ",\n\n"
                                + "Your account information has been updated.\n"
                                + "Username: " + account.getUsername() + "\n"
                                + "Email: " + account.getEmail() + "\n"
                                + "Phone: " + account.getPhone() + "\n"
                                + "New Role: " + account.getRoleName() + "\n"
                                + "New Status: " + (newStatus ? "Active" : "Inactive") + "\n\n"
                                + "Best regards,\nAdmin Team";

                        // Send email
                        EmailUtilsByAdmin.sendEmail(account.getEmail(), subject, body);
                        statusMessage += " Email notification sent.";
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            statusMessage = "An error occurred while processing your request.";
        }

        // Set status message as a session attribute
        HttpSession session = request.getSession();
        session.setAttribute("statusMessage", statusMessage);

        // Redirect back to the account list page with the status message
        response.sendRedirect("accountcontrollerbyadmin?statusMessage=" + java.net.URLEncoder.encode(statusMessage, "UTF-8"));
    }
}
