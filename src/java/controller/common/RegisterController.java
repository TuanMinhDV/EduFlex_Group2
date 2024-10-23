/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.common;

import dto.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.time.Period;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import model.Account;
import utils.EmailUtils;


@WebServlet(name = "RegisterController", urlPatterns = "/register")
public class RegisterController extends HttpServlet {

    private static final String PASSWORD_REGEX = "(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%]).{8,20}";
    private static final String USERNAME_REGEX = "[a-z0-9]{4,20}";
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AccountDAO ad = new AccountDAO();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirm = request.getParameter("confirm");
        String fullname = request.getParameter("fullname");
        String dob_raw = request.getParameter("dob");
        String email = request.getParameter("email");
        String address = request.getParameter("address");

        // set attribute
        request.setAttribute("username", username);
        request.setAttribute("password", password);
        request.setAttribute("fullname", fullname);
        request.setAttribute("dob", dob_raw);
        request.setAttribute("email", email);
        request.setAttribute("address", address);
        int count = 3;
        request.setAttribute("count", count);

        // check age <= 3
        LocalDate dob = LocalDate.parse(dob_raw);
        LocalDate curDate = LocalDate.now();
        Period age = Period.between(dob, curDate);
        boolean checkDob = age.getYears() <= 3;
        if(!username.matches(USERNAME_REGEX)){
            request.setAttribute("mess", "Your username can only be consecutive lowercase letters and numbers");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }else if (!password.matches(PASSWORD_REGEX)) {
            request.setAttribute("mess", "Your password must has at least 8 characters and contain uppercase, lowercase, number and specical syntax (!, @, #, $, %)");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } else if (checkDob) {
            request.setAttribute("mess", "Your age is not enough");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } else if (ad.checkExistedEmail(email)) {
            request.setAttribute("mess", "This email already registered of another account");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } else if (ad.checkExistedUsername(username)) {
            request.setAttribute("mess", "This username already existed");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } else if (password.equals(confirm)) {
            //Generate OTP
            String otp = EmailUtils.generateOTP();
            try {
                //send OTP to mail
                //EmailUtils.sendEmail(email, "OCMS - Register", "Hello, this is Online Course Management System!!! Your OTP code is: " + otp);
                EmailUtils.fakeSendEmail(email, "OCMS - Register", "Hello, this is Online Course Management System!!! Your OTP code is: " + otp);
            } catch (MessagingException ex) {
                Logger.getLogger(RegisterController.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.setAttribute("otp", otp);
            request.getRequestDispatcher("VerifyRegister.jsp").forward(request, response);
        } else {
            request.setAttribute("mess", "Confirm password is incorrect");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
