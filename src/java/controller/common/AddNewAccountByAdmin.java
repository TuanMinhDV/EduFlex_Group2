package controller.common;

import java.io.IOException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.AccountControlByAdmin;
import model.RoleControlByAdmin;
import dto.AccountControllerByAdminDAO;
import utils.EmailUtilsByAdmin;

@WebServlet(name = "AddNewAccountByAdmin", urlPatterns = {"/addaccountbyadmin"})
public class AddNewAccountByAdmin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Load roles to populate role dropdown in JSP
        AccountControllerByAdminDAO dao = new AccountControllerByAdminDAO();
        ArrayList<RoleControlByAdmin> roles = dao.getRoles();
        request.setAttribute("roles", roles);

        // Forward to JSP
        request.getRequestDispatcher("/AddAccountByAdmin.jsp").forward(request, response);
    }

   @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    String username = request.getParameter("username");
    String fullname = request.getParameter("fullname");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String otp = generateOTP();
    boolean status = "1".equals(request.getParameter("status"));
    String roleName = request.getParameter("role");
    boolean sendEmail = "true".equals(request.getParameter("sendEmail"));

    AccountControllerByAdminDAO dao = new AccountControllerByAdminDAO();

    // Validate input fields
    if (!username.matches("^[A-Za-z0-9]{5,16}$")) {
        request.setAttribute("message", "Error: Username phải có từ 5 đến 16 kí tự chỉ chứa chữ cái và số.");
        reloadRolesAndRedirect(request, response, dao);
        return;
    }
    if (!fullname.matches("^[A-Za-z0-9 ]+$")) {
        request.setAttribute("message", "Error: Full name chỉ chứa chữ cái, số và khoảng trắng.");
        reloadRolesAndRedirect(request, response, dao);
        return;
    }
    if (!email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$")) {
        request.setAttribute("message", "Error: Email không đúng định dạng.");
        reloadRolesAndRedirect(request, response, dao);
        return;
    }
    if (!phone.matches("^\\d{10,11}$")) {
        request.setAttribute("message", "Error: Phone phải là số và có từ 10 đến 11 chữ số.");
        reloadRolesAndRedirect(request, response, dao);
        return;
    }

    // Check for duplicates and get specific message
    String duplicateMessage = dao.checkDuplicateFields(username, email, phone);
    if (duplicateMessage != null) {
        request.setAttribute("message", "Error: " + duplicateMessage);
        reloadRolesAndRedirect(request, response, dao);
        return;
    }

    int roleId = dao.getRoleIdByName(roleName);
    if (roleId == -1) {
        request.setAttribute("message", "Invalid role name provided.");
        reloadRolesAndRedirect(request, response, dao);
        return;
    }

    AccountControlByAdmin account = new AccountControlByAdmin(0, username, fullname, email, phone, otp, roleName, status);
    boolean success = dao.addAccount(account);
    request.setAttribute("message", success ? "Account added successfully!" : "Failed to add account. Try again.");

    if (success && sendEmail) {
        String emailSubject = "New Account Created";
        String emailBody = String.format("Hello %s,\n\nYour account has been created on the EduFlex system with the following details:\n\n"
                + "Username: %s\nPassword: defaultPassword\nFull Name: %s\nEmail: %s\nPhone: %s\nRole: %s\nOTP: %s\n\nThank you!",
                fullname, username, fullname, email, phone, roleName, otp);

        EmailUtilsByAdmin.sendEmail(email, emailSubject, emailBody);
        request.setAttribute("message", "Account added successfully! Email sent.");
    }

    reloadRolesAndRedirect(request, response, dao);
}



    private void reloadRolesAndRedirect(HttpServletRequest request, HttpServletResponse response, AccountControllerByAdminDAO dao)
            throws ServletException, IOException {
        ArrayList<RoleControlByAdmin> roles = dao.getRoles();
        request.setAttribute("roles", roles);
        request.getRequestDispatcher("/AddAccountByAdmin.jsp").forward(request, response);
    }

    private String generateOTP() {
        int otpLength = 6;
        String numbers = "0123456789";
        StringBuilder otp = new StringBuilder(otpLength);
        for (int i = 0; i < otpLength; i++) {
            otp.append(numbers.charAt((int) (Math.random() * numbers.length())));
        }
        return otp.toString();
    }

    @Override
    public String getServletInfo() {
        return "Servlet for adding new accounts by admin";
    }
}
