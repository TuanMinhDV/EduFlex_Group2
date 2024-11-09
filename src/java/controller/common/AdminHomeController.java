/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.common;

import dto.AccountControllerByAdminDAO;
import dto.CourseControllerByAdminDAO;
import dto.SubjectControllerByAdminDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author admin
 */
@WebServlet(name = "AdminHomeController", urlPatterns = {"/adminhomeservlet"})
public class AdminHomeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        AccountControllerByAdminDAO dao = new AccountControllerByAdminDAO();

        int totalAccounts = dao.getTotalAccounts();
        int totalLearner = dao.getTotalLearners();
        
        
        CourseControllerByAdminDAO  dao2 = new CourseControllerByAdminDAO();
        int totalCourse = dao2.getTotalCourse();

        SubjectControllerByAdminDAO dao3 = new SubjectControllerByAdminDAO();
        int totalCategories = dao3.getTotalCategories();
        
        
        request.setAttribute("totalAccounts", totalAccounts);
        request.setAttribute("totalLearner", totalLearner);
        request.setAttribute("totalCourse", totalCourse);
        request.setAttribute("totalCategories", totalCategories);
        

        request.getRequestDispatcher("HomeAdmin.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
