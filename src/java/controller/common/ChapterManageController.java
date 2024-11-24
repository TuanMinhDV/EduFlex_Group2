/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.common;

import dto.ChapterDAO;
import dto.CourseDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Chapter;
import model.Course;

/**
 *
 * @author dungm
 */
public class ChapterManageController extends HttpServlet {

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
            out.println("<title>Servlet ChapterManageController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChapterManageController at " + request.getContextPath() + "</h1>");
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
        int courseID = Integer.parseInt(request.getParameter("cID"));
        CourseDAO daoCourse = new CourseDAO();
        Course course = daoCourse.getCourseByID(courseID);
        ChapterDAO dao = new ChapterDAO();
        List<Chapter> listChap = dao.getChaptersByCourseID(courseID);
        request.setAttribute("course", course);
        request.setAttribute("listChapters", listChap);
        request.getRequestDispatcher("ManageChaptersByIns.jsp").forward(request, response);
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
        ChapterDAO dao = new ChapterDAO();
        String type = request.getParameter("type");
        if (type.equalsIgnoreCase("add")) {
            int courseID = Integer.parseInt(request.getParameter("courseId"));
            String nameC = request.getParameter("chapterName");
            Chapter chapNew = new Chapter(nameC, courseID);
            dao.addChapter(chapNew);
            loadDBwithCourseID(courseID, request, response);
        } else if (type.equalsIgnoreCase("edit")) {
            int chapter_id = Integer.parseInt(request.getParameter("chapterId"));
            String newName = request.getParameter("chapterName");
            if (!newName.isEmpty()) {
                Chapter chap = dao.getChapterByChapterID(chapter_id);
                chap.setName(newName);
                dao.editChapter(chap);
                int courseID = Integer.parseInt(request.getParameter("courseId"));
                loadDBwithCourseID(courseID, request, response);
            }
        } else if (type.equalsIgnoreCase("delete")) {
            int courseID = Integer.parseInt(request.getParameter("courseId"));
            int chapter_id = Integer.parseInt(request.getParameter("chapterId"));
            if (dao.getChapterByChapterID(chapter_id)!=null){
                dao.deleteChapter(chapter_id);
                loadDBwithCourseID(courseID, request, response);
            }
        } else if (type.equalsIgnoreCase("search")) {
            CourseDAO courseDAO = new CourseDAO();
            int courseID = Integer.parseInt(request.getParameter("courseId"));
            String txt = request.getParameter("nameSearch");
            List<Chapter> listC = dao.searchByName(txt, courseID);
            request.setAttribute("course", courseDAO.getCourseByID(courseID));
            request.setAttribute("listChapters", listC);
            request.getRequestDispatcher("ManageChaptersByIns.jsp").forward(request, response);
        }
        
    }
    
    public void loadDBwithCourseID(int courseID, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CourseDAO daoCourse = new CourseDAO();
        Course course = daoCourse.getCourseByID(courseID);
        ChapterDAO dao = new ChapterDAO();
        List<Chapter> listChap = dao.getChaptersByCourseID(courseID);
        request.setAttribute("course", course);
        request.setAttribute("listChapters", listChap);
        request.getRequestDispatcher("ManageChaptersByIns.jsp").forward(request, response);
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

    }

}
