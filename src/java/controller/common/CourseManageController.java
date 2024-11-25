/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.common;

import dto.AccountDAO;
import dto.CourseDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Account;
import model.Category;
import model.Course;

/**
 *
 * @author dungm
 */
public class CourseManageController extends HttpServlet {

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
            out.println("<title>Servlet CourseManageController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CourseManageController at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        CourseDAO daoC = new CourseDAO();
        List<Course> listCourse = new ArrayList<>();
        String reqCateFilter = request.getParameter("cateID");
        if (reqCateFilter != null) {
            Account acLogin = (Account) session.getAttribute("account");
            listCourse = daoC.getAllCoursesByInsId_CateID(acLogin.getAccount_id(), Integer.parseInt(reqCateFilter));
            List<Category> listCate = daoC.getAllCategory();
            request.setAttribute("listCategory", listCate);
            request.setAttribute("listCourse", listCourse);
            request.getRequestDispatcher("ManageCoursesByIns.jsp").forward(request, response);
        } else {
            // Create Account
//            AccountDAO daoAccount = new AccountDAO();
//            Account acToLog = daoAccount.login("tamnt", "123");
//            session.setAttribute("account", acToLog);

            Account acLogin = (Account) session.getAttribute("account");
            listCourse = daoC.getAllCoursesByInsID(acLogin.getAccount_id());

            List<Category> listCate = daoC.getAllCategory();
            request.setAttribute("account", acLogin);
            request.setAttribute("listCategory", listCate);
            request.setAttribute("listCourse", listCourse);
            request.getRequestDispatcher("ManageCoursesByIns.jsp").forward(request, response);
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
        String type = request.getParameter("type");
        HttpSession session = request.getSession();
        Account acLogin = (Account) session.getAttribute("account");
        CourseDAO dao = new CourseDAO();

        switch (type) {
            case "add" -> {
                String courseName = request.getParameter("courseName");
                String description = request.getParameter("courseDescription");
                String urlImage = request.getParameter("courseImage");
                if (!isValid(courseName, true)) {
                    request.setAttribute("error", "inputs aren't valid!");
                    List<Course> listCourse = dao.getAllCoursesByInsID(acLogin.getAccount_id());
                    List<Category> listCate = dao.getAllCategory();
                    request.setAttribute("listCategory", listCate);
                    request.setAttribute("listCourse", listCourse);
                    request.getRequestDispatcher("ManageCoursesByIns.jsp").forward(request, response);
                    return;
                } else {
                    Course c = new Course();
                    c.setName(courseName);
                    c.setImage(urlImage);
                    c.setDescription(description);
                    c.setInstructor_id(acLogin.getAccount_id());
                    dao.addCourseByInstructor(c);
                    List<Course> listCourse = dao.getAllCoursesByInsID(acLogin.getAccount_id());
                    List<Category> listCate = dao.getAllCategory();
                    request.setAttribute("listCategory", listCate);
                    request.setAttribute("listCourse", listCourse);
                    request.getRequestDispatcher("ManageCoursesByIns.jsp").forward(request, response);
                }
            }
            case "edit" -> {
                int courseID = Integer.parseInt(request.getParameter("courseID"));
                String courseName = request.getParameter("courseName");
                String description = request.getParameter("courseDescription");
                String urlImage = request.getParameter("courseImage");
                if (!isValid(courseName, true)) {
                    request.setAttribute("error", "inputs aren't valid!");
                    List<Course> listCourse = dao.getAllCoursesByInsID(acLogin.getAccount_id());
                    List<Category> listCate = dao.getAllCategory();
                    request.setAttribute("listCategory", listCate);
                    request.setAttribute("listCourse", listCourse);
                    request.getRequestDispatcher("ManageCoursesByIns.jsp").forward(request, response);
                    return;
                } else {
                    Course course = dao.getCourseByID(courseID);
                    course.setName(courseName);
                    course.setDescription(description);
                    course.setImage(urlImage);
                    dao.updateCourseByInstructor(course);
                    List<Course> listCourse = dao.getAllCoursesByInsID(acLogin.getAccount_id());
                    List<Category> listCate = dao.getAllCategory();
                    request.setAttribute("listCategory", listCate);
                    request.setAttribute("listCourse", listCourse);
                    request.getRequestDispatcher("ManageCoursesByIns.jsp").forward(request, response);
                }
            }
            case "delete" -> {
                int courseID = Integer.parseInt(request.getParameter("courseID"));
                dao.deleteCourseByInstructor(courseID);
                List<Course> listCourse = dao.getAllCoursesByInsID(acLogin.getAccount_id());
                List<Category> listCate = dao.getAllCategory();
                request.setAttribute("listCategory", listCate);
                request.setAttribute("listCourse", listCourse);
                request.getRequestDispatcher("ManageCoursesByIns.jsp").forward(request, response);
            }
            case "search" -> {
                String searchInput = request.getParameter("searchName");
                List<Course> listCourse = dao.searchCourseByInstructor(acLogin.getAccount_id(), searchInput);
                List<Category> listCate = dao.getAllCategory();
                request.setAttribute("listCategory", listCate);
                request.setAttribute("listCourse", listCourse);
                request.getRequestDispatcher("ManageCoursesByIns.jsp").forward(request, response);
            }
            default ->
                throw new AssertionError();
        }

    }

    public boolean isValid(String input, boolean allowSpecial) {
        // Kiểm tra null hoặc rỗng
        if (input == null || input.trim().isEmpty()) {
            return false;
        }
        // Kiểm tra ký tự đặc biệt
        if (!allowSpecial) {
            String regex = "^[a-zA-Z0-9 ]+$"; // Chỉ cho phép chữ cái, số và khoảng trắng
            if (!input.matches(regex)) {
                return false;
            }
            // Kiểm tra khoảng trắng liên tiếp
            String whitespaceRegex = ".*\\s{2,}.*"; // Tìm các khoảng trắng liên tiếp
            if (input.matches(whitespaceRegex)) {
                return false;
            }
        }
        return true; // Chuỗi hợp lệ
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

    public static void main(String[] args) {
        CourseManageController c = new CourseManageController();
        System.out.println(c.isValid("123", true));
    }
}
