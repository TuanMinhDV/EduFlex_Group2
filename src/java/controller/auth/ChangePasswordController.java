package controller.auth;

import dto.AccountDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Constants;

import security.MD5Encryption;

@WebServlet(name = "ChangePasswordController", urlPatterns = "/changepassword")
public class ChangePasswordController extends BaseRequiredAuthorizationController {

    //private static final String PASSWORD_REGEX = "(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%]).{8,20}";
    @Override
    protected void doAuthGet(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        if (acc == null) {
            response.sendRedirect("login.jsp");
        } else {
            response.sendRedirect("changepassword.jsp");
        }

    }

    @Override
    protected void doAuthPost(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {

        String username = request.getParameter("username");
        String oldPass = request.getParameter("oldPassword");
        String newPass = request.getParameter("newPassword");
        String confirmPass = request.getParameter("confirmPassword");
        String curPass = request.getParameter("curPass");

        List<String> errors = new ArrayList<>();

        if (oldPass.contains(" ") || newPass.contains(" ") || confirmPass.contains(" ")) {
            errors.add("Do not add blank space into your password");
        } else {
            if (newPass.equals(oldPass)) {
                errors.add("New password must be different from old password");
            }

            if (!newPass.equals(confirmPass)) {
                errors.add("Confirm password is incorrect");
            }

            if (!newPass.matches(Constants.PASSWORD_REGEX)) {
                errors.add("Your password must have at least 8 characters and contain uppercase, lowercase, number, and special syntax (!, @, #, $, %)");
            }
        }
        try {
            oldPass = new MD5Encryption().convertPassword(oldPass);
            newPass = new MD5Encryption().convertPassword(newPass);
            if (!oldPass.equals(curPass)) {
                errors.add("Your old password is not correct");
            }
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(ChangePasswordController.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (!errors.isEmpty()) {
            request.setAttribute("errors", errors);
            request.getRequestDispatcher("changepassword.jsp").forward(request, response);
        } else {
            
            
            AccountDAO ad = new AccountDAO();
            ad.changePassword(username, newPass);
            request.setAttribute("mess", "Your password has been changed successfully");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

    }

}
