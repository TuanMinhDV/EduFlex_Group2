/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.common;

import dto.CourseDAO;
//import dto.SubjectDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Account;
import model.Course;
//import model.Subject;

@WebServlet(name = "SubjectDetailController", urlPatterns = "/subjectdetail")
public class SubjectDetailController extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CourseDetailController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CourseDetailController at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
//        SubjectDAO s = new SubjectDAO();
        CourseDAO c = new CourseDAO();
        String course_id_raw = request.getParameter("course_id");
        String category_id_raw = request.getParameter("category_id");
        int active;
        HttpSession session = request.getSession();
        Account account = (Account)session.getAttribute("account");

        try {
//            int subject_id = Integer.parseInt(subject_id_raw);
//            int category_id = Integer.parseInt(category_id_raw);
//            if(account != null){
//                 active = s.getSubjectActive(subject_id,account.getAccount_id());
//            } else {
//                active = 0;
//        }
//            List<Course> listC = c.getCourseBySubjectId(subject_id);
//            List<Subject> listRS = s.getRelatedSubjectByCategoryID(subject_id, category_id);
//            Subject subject = s.getSubject(subject_id);
//            request.setAttribute("active", active);
//            request.setAttribute("subject", subject);
//            request.setAttribute("listRS", listRS);
//            request.setAttribute("listC", listC);
//            request.setAttribute("category_id", category_id);
            request.getRequestDispatcher("subject_detail.jsp").forward(request, response);
        } catch (Exception e) {
        }
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
        processRequest(request, response);
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
