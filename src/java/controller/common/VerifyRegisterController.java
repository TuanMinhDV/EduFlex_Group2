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
import java.time.LocalDateTime;
import java.time.format.DateTimeParseException;

@WebServlet(name = "VerifyRegisterController", urlPatterns = "/verifyregister")
public class VerifyRegisterController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet VerifyRegisterController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VerifyRegisterController at " + request.getContextPath() + "</h1>");
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
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullname = request.getParameter("fullname");
        String dob = request.getParameter("dob");
        String email = request.getParameter("email");
        String otp = request.getParameter("otp");

        request.setAttribute("username", username);
        request.setAttribute("password", password);
        request.setAttribute("fullname", fullname);
        request.setAttribute("dob", dob);
        request.setAttribute("email", email);
        request.setAttribute("otp", otp);
        request.getRequestDispatcher("verifyregister.jsp").forward(request, response);
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
        try {
            AccountDAO ad = new AccountDAO();
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String fullname = request.getParameter("fullname");
            String dob = request.getParameter("dob");
            String email = request.getParameter("email");
            String otp = request.getParameter("otp");
            String otpInput = request.getParameter("otpInput");
            int count = Integer.parseInt(request.getParameter("count"));

//            String startTimeString = (String) request.getParameter("startTime");
//            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
//            LocalDateTime startTime = LocalDateTime.parse(startTimeString, formatter);
            LocalDateTime currentTime = LocalDateTime.now();
            if (ad.isWithinOneMinute(currentTime, 60)) {
                if (otpInput.equals(otp)) {
                    ad.register(username, password, fullname, dob, email);
                    request.setAttribute("mess", "You can login now");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                    response.sendRedirect("login");

                } else {
                    count--;
                    if (count == 0) {
                        request.setAttribute("err", "Your OTP is not valid, verify email failed");
                        request.getRequestDispatcher("register.jsp").forward(request, response);
                    } else {
                        request.setAttribute("count", count);
                        request.setAttribute("mess", "Your OTP is not valid, " + count + " times remaining");
                        request.setAttribute("username", username);
                        request.setAttribute("password", password);
                        request.setAttribute("fullname", fullname);
                        request.setAttribute("dob", dob);
                        request.setAttribute("email", email);
                        request.setAttribute("otp", otp);
                        request.getRequestDispatcher("verifyregister.jsp").forward(request, response);
                    }
                }
            } else {
                // Sau khi hết thời gian cho phép
                request.setAttribute("err", "OTP is expaise!!!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
        } catch (ServletException | IOException | NumberFormatException | DateTimeParseException e) {

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
