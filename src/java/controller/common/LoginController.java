/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.common;

import dto.AccountDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

@WebServlet(name = "LoginController", urlPatterns = "/login")
public class LoginController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

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
        request.getRequestDispatcher("login.jsp").forward(request, response);
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
    String username = request.getParameter("user");
    String password = request.getParameter("pass");
    String remember = request.getParameter("remember");
    Cookie cuser = new Cookie("cuser", username);
    Cookie cpass = new Cookie("cpass", password);
    Cookie crem = new Cookie("crem", remember);
    if (remember != null) {
        cuser.setMaxAge(3600 * 24);
        cpass.setMaxAge(3600 * 24);
        crem.setMaxAge(3600 * 24);
    } else {
        cuser.setMaxAge(0);
        cpass.setMaxAge(0);
        crem.setMaxAge(0);
    }
    response.addCookie(cuser);
    response.addCookie(cpass);
    response.addCookie(crem);

    Account a = ad.login(username, password);
    if (a == null) {
        request.setAttribute("mess", "Username or Password is incorrect!!");
        request.getRequestDispatcher("login.jsp").forward(request, response);
    } else if (a.getActive() == 0) {
        request.setAttribute("mess", "Your account has been BLOCKED");
        request.getRequestDispatcher("login.jsp").forward(request, response);
    } else {
        HttpSession session = request.getSession();
        session.setAttribute("account", a);
        session.setMaxInactiveInterval(15 * 60); // Session timeout: 15 minutes

        // Kiểm tra role của tài khoản
        if (a.getRole_id() == 1) { // Nếu role = 1
            response.sendRedirect("homeadmincontroller");
        } else {
            response.sendRedirect("home");
        }
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
