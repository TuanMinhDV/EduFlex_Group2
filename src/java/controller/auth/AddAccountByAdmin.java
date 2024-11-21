package controller.auth;

import java.io.IOException;
import java.util.UUID;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import model.Role;
import dto.AccountDAO;
import utils.EmailUtilsByAdmin;

@WebServlet(name = "AddAccountByAdmin", urlPatterns = {"/addaccountbyadmin"})
public class AddAccountByAdmin extends HttpServlet {

    // Phương thức doGet: Lấy danh sách vai trò từ database và chuyển đến trang JSP
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AccountDAO dao = new AccountDAO();

        // Lấy danh sách vai trò
        ArrayList<Role> roleList = dao.getListRoleByAdmin();

        // Gán danh sách role vào request attribute
        request.setAttribute("roles", roleList);

        // Chuyển tiếp đến trang JSP
        request.getRequestDispatcher("AddNewAccountByAdmin.jsp").forward(request, response);
    }

    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    // Lấy thông tin từ form
    String username = request.getParameter("username").trim();
    String fullname = request.getParameter("fullname").trim();
    String email = request.getParameter("email").trim();
    String phone = request.getParameter("phone").trim();
    String roleId = request.getParameter("role");
    String status = request.getParameter("status");
    String sendEmail = request.getParameter("sendEmail"); // Checkbox

    // Tạo mật khẩu ngẫu nhiên
    String password = generateRandomPassword();

    // Tạo đối tượng DAO
    AccountDAO accountDAO = new AccountDAO();

    boolean hasError = false;

    // Kiểm tra trùng username
    if (accountDAO.checkExistedUsername(username)) {
        request.setAttribute("usernameError", "Username already exists. Please choose another one.");
        hasError = true;
    }
    // Kiểm tra trùng email
    if (accountDAO.checkExistedEmail(email)) {
        request.setAttribute("emailError", "Email already exists. Please choose another one.");
        hasError = true;
    }
    // Kiểm tra trùng phone
    if (accountDAO.checkExistedPhone(phone)) {
        request.setAttribute("phoneError", "Phone number already exists. Please choose another one.");
        hasError = true;
    }

    // Nếu có lỗi, quay lại trang với thông báo lỗi
    if (hasError) {
        request.setAttribute("username", username);
        request.setAttribute("fullname", fullname);
        request.setAttribute("email", email);
        request.setAttribute("phone", phone);
        request.setAttribute("roleId", roleId);
        request.setAttribute("status", status);
        doGet(request, response);
        return;
    }

    // Lấy tên vai trò từ ID
    String roleName = accountDAO.getRoleNameById(Integer.parseInt(roleId));

    // Tạo đối tượng Account
    Account account = new Account();
    account.setUsername(username);
    account.setPassword(password);
    account.setFullname(fullname);
    account.setEmail(email);
    account.setPhone(phone);
    account.setActive(Integer.parseInt(status));
    account.setRole_id(Integer.parseInt(roleId));

    // Gọi DAO để thêm tài khoản
    boolean success = accountDAO.addAccountByAdmin(account);

    if (success) {
        // Nếu checkbox "Send Email" được chọn, gửi thông tin tài khoản qua email
        if ("true".equals(sendEmail)) {
            String subject = "Your Account Information";
            String body = "Dear " + fullname + ",\n\n"
                    + "Here is your account information:\n"
                    + "Username: " + username + "\n"
                    + "Password: " + password + "\n"
                    + "Email: " + email + "\n"
                    + "Phone: " + phone + "\n"
                    + "Role: " + roleName + "\n" // Gửi tên vai trò
                    + "Status: " + (status.equals("1") ? "Active" : "Inactive") + "\n\n"
                    + "Please change your password upon first login for security purposes.\n\n"
                    + "Best regards,\nAdmin Team";

            try {
                EmailUtilsByAdmin.sendEmail(email, subject, body);
                request.setAttribute("success", "Account added successfully. An email has been sent to the user.");
            } catch (Exception e) {
                request.setAttribute("success", "Account added successfully, but email failed to send.");
            }
        } else {
            request.setAttribute("success", "Account added successfully.");
        }
    } else {
        request.setAttribute("error", "Failed to add account. Try again.");
    }

    // Chuyển về trang JSP với thông báo
    doGet(request, response);
}


    /**
     * Hàm tạo mật khẩu ngẫu nhiên gồm 8 ký tự (A-Z, a-z, 0-9)
     */
    private String generateRandomPassword() {
        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        StringBuilder password = new StringBuilder();
        for (int i = 0; i < 8; i++) {
            int randomIndex = (int) (Math.random() * chars.length());
            password.append(chars.charAt(randomIndex));
        }
        return password.toString();
    }

    @Override
    public String getServletInfo() {
        return "Add Account By Admin Servlet";
    }
}
