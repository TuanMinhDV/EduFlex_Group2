package controller.common;

import dto.AccountDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Constants;
import security.MD5Encryption;

@WebServlet(name = "ResetPasswordController", urlPatterns = "/resetpassword")
public class ResetPasswordController extends HttpServlet {

    //private static final String PASSWORD_REGEX = "(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%]).{8,20}";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        request.setAttribute("username", username);
        request.getRequestDispatcher("resetpassword.jsp").forward(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String repassword = request.getParameter("repassword");
        boolean checkpassword = password.matches(Constants.PASSWORD_REGEX);
        if (!checkpassword) {
            request.setAttribute("username", username);
            request.setAttribute("messPassword", "*Your password must has at least 8 characters and contain uppercase, lowercase, number and specical syntax (!, @, #, $, %)");
            request.getRequestDispatcher("resetpassword.jsp").forward(request, response);
        } else if (!password.equals(repassword)) {
            request.setAttribute("username", username);
            request.setAttribute("mess", "Confirm password is incorrect");
            request.getRequestDispatcher("resetpassword.jsp").forward(request, response);
        } else {
            AccountDAO dbAccount = new AccountDAO();
            Account acc = dbAccount.findByAccount(username);
            if (acc == null) {
                request.getRequestDispatcher("resetpassword.jsp").forward(request, response);
            } else {
                try {
                    String hashedPassword = new MD5Encryption().convertPassword(password);
                    dbAccount.changePassword(username, hashedPassword);
                    request.getSession().setAttribute("successMessage", "Reset password successful. You can now log in with your new password.");
                    response.sendRedirect("login.jsp");
                } catch (NoSuchAlgorithmException ex) {
                    Logger.getLogger(ResetPasswordController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }
}
