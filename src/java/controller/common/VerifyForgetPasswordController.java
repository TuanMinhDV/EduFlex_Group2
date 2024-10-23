package controller.common;

import dto.AccountDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

@WebServlet(name="VerifyController", urlPatterns={"/verifyforgetpassword"})
public class VerifyForgetPasswordController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        request.setAttribute("email", email);
        request.setAttribute("username", username);
        request.getRequestDispatcher("verifyforgetpassword.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String otp = request.getParameter("otp");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        AccountDAO dbAccount = new AccountDAO();
        HttpSession session = request.getSession();
        Integer otpAttemptCount = (Integer) session.getAttribute("otpAttemptCount");
        if (otpAttemptCount == null) {
            otpAttemptCount = 0;
        }
        
        if (otpAttemptCount < 3) {
            if (email.length() == 0) {
                Account acc = dbAccount.findByAccount(username);
                if (acc == null) {
                    request.getRequestDispatcher("verifyforgetpassword.jsp").forward(request, response);
                } else {
                    if (!acc.getOtp().equals(otp)) {
                        otpAttemptCount++;
                        session.setAttribute("otpAttemptCount", otpAttemptCount);
                        if (otpAttemptCount == 3) {
                            response.sendRedirect("home.jsp");  // Chuyển đến trang home.jsp sau khi nhập sai 3 lần
                            return;
                        } else {
                            request.setAttribute("msgVerify", "Your verify code is wrong. Please enter again. You have " + (3 - otpAttemptCount) + " times to try.");
                        }
                        request.setAttribute("username", username);
                        request.getRequestDispatcher("verifyforgetpassword.jsp").forward(request, response);
                    } else {
                        dbAccount.verify(username);
                        request.getSession().setAttribute("account", acc);
                        response.sendRedirect("home.jsp");
                    }
                }
            } else {
                Account acc = dbAccount.findByEmail(email);
                if (acc == null) {
                    request.getRequestDispatcher("verifyforgetpassword.jsp").forward(request, response);
                } else {
                    if (!acc.getOtp().equals(otp)) {
                        otpAttemptCount++;
                        if (otpAttemptCount == 3) {
                            response.sendRedirect("home.jsp");  
                            return;
                        } else {
                            request.setAttribute("msgVerify", "Your verify code is wrong. Please enter again. You have " + (3 - otpAttemptCount) + " times to try.");
                        }
                        session.setAttribute("otpAttemptCount", otpAttemptCount);
                        request.setAttribute("email", email);
                        request.getRequestDispatcher("verifyforgetpassword.jsp").forward(request, response);
                    } else {
                        response.sendRedirect("resetpassword?username=" + acc.getUsername());
                        dbAccount.verify(acc.getUsername());
                        request.getSession().setAttribute("account", acc);
                        return;
                    }
                }
            }
        }
    }
}
