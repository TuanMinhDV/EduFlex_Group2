/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.common;

import dto.AccountDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import utils.EmailUtils;

@WebServlet(name = "ForgetPasswordController", urlPatterns = "/forgetpassword")
public class ForgetPasswordController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("forgetpassword.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        AccountDAO dbAccount = new AccountDAO();
        boolean checkEmail = dbAccount.checkEmail(email);
        if (!checkEmail) {
            request.setAttribute("msg", "Your email is not registered");
            request.setAttribute("email", email);
            request.getRequestDispatcher("forgetpassword.jsp").forward(request, response);
        } else {
            try {
                String otp = EmailUtils.generateOTP();
                dbAccount.updateOTP(email, otp);
                System.out.println("Attemp to send Email");
                //EmailUtils.sendEmail(email, "EduFlex - Forget Password", "Hello, this is EduFlex!!! Your OTP code is: " + otp);
                EmailUtils.fakeSendEmail(email, "EduFlex - Forget Password", "Hello, this is EduFlex!!! Your OTP code is: " + otp);
                
                System.out.println("Send Email Success!!!");
                response.sendRedirect("verifyforgetpassword?email=" + email + "" );
//            //response.sendRedirect("verifyotp");
//            request.getRequestDispatcher("verifyotp.jsp").forward(request, response);
            } catch (IOException e) {
                System.out.println(e);
            } catch (MessagingException ex) {
                Logger.getLogger(ForgetPasswordController.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

    }

}
