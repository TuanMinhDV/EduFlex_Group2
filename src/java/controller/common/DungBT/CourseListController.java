/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.common.DungBT;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dto.CourseDAO;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import model.Account;
import model.Course;

/**
 *
 * @author dungm
 */
public class CourseListController extends HttpServlet {

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
            out.println("<title>Servlet CourseListController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CourseListController at " + request.getContextPath() + "</h1>");
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
        loadData(request, response);
    }

    protected void loadData(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account loginedAcc = (Account) session.getAttribute("account");
        CourseDAO daoCourse = new CourseDAO();
        List<Course> listCourse = daoCourse.getAllCoursesByInstructorID_DungBT(loginedAcc.getAccount_id());
        request.setAttribute("listCourse", listCourse);
        request.getRequestDispatcher("DungBT_Pages/courses.jsp").forward(request, response);
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
        CourseDAO dao = new CourseDAO();
        String type = request.getParameter("type");
        if (type.equalsIgnoreCase("edit")) {
            int idC = Integer.parseInt(request.getParameter("courseID"));
            String nameC = request.getParameter("courseName");
            String desC = request.getParameter("courseDes");
            String desImg = request.getParameter("courseImage");
            float price = Float.parseFloat(request.getParameter("coursePrice"));
            float discount = Float.parseFloat(request.getParameter("courseDiscount"));
            Course c = dao.getCourseByID_DungBT(idC);
            Course cNew = new Course(idC, nameC, desC, desImg, price, discount, c.getSold(), c.getCreated_date(), c.getUpdated_date(), c.getCourse_id());
            dao.updateCourse_DungBT(cNew);
            loadData(request, response);
        } else if (type.equalsIgnoreCase("add")) {
            String nameC = request.getParameter("courseName");
            String desC = request.getParameter("courseDescription");
            String desImg = request.getParameter("courseImage");
            float price = Float.parseFloat(request.getParameter("coursePrice"));
            float discount = Float.parseFloat(request.getParameter("courseDiscount"));
            HttpSession ses = request.getSession();
            Account instructor = (Account) ses.getAttribute("account");
            int idIns = instructor.getAccount_id();
            Course c = new Course(0, nameC, desC, desImg, price, discount, 0, "2024-01-09", "2024-10-05", idIns);
            dao.addCourse_DungBT(c);
            loadData(request, response);
        } else if (type.equalsIgnoreCase("delete")) {
            int idC = Integer.parseInt(request.getParameter("idC"));
            dao.deleteCourse_DungBT(idC);
            loadData(request, response);
        } else if (type.equalsIgnoreCase("search")) {
            String txt = request.getParameter("nameSearch");
            List<Course> listC = dao.searchByName_DungBT(txt);
            request.setAttribute("listCourse", listC);
            request.getRequestDispatcher("DungBT_Pages/courses.jsp").forward(request, response);
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
