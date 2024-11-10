/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.common.DungBT;

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

/**
 *
 * @author dungm
 */
public class ChapterListController extends HttpServlet {

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
            out.println("<title>Servlet ChapterListController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChapterListController at " + request.getContextPath() + "</h1>");
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
        ChapterDAO chapDAO = new ChapterDAO();
        CourseDAO courseDAO = new CourseDAO();
        int courseID = Integer.parseInt(request.getParameter("courseID"));
        List<Chapter> listChapter = chapDAO.getChaptersByCourseID(courseID);
        request.setAttribute("listChapter", listChapter);
        request.setAttribute("course", courseDAO.getCourseByID_DungBT(courseID));
        request.getRequestDispatcher("DungBT_Pages/chapters.jsp").forward(request, response);
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
        CourseDAO daoC = new CourseDAO();
        String type = request.getParameter("type");
        if (type.equalsIgnoreCase("add")) {
            int courseID = Integer.parseInt(request.getParameter("courseId"));
            String nameC = request.getParameter("chapterName");
            List<Chapter> listChaps = dao.getChaptersByCourseID(courseID);
            int chapLast = 0;
            if (!listChaps.isEmpty()) {
                chapLast = listChaps.getLast().getChapter_no();
            }
            Chapter chapNew = new Chapter(0, chapLast + 1, nameC, courseID);
            dao.addChapter(chapNew);
            loadDBwithCourseID(courseID, request, response);
        } else if (type.equalsIgnoreCase("edit")) {
            int chapter_id = Integer.parseInt(request.getParameter("chapterId"));
            String newName = request.getParameter("chapterName");
            if (!newName.isEmpty()) {
                Chapter chap = dao.getChapterByChapterID(chapter_id);
                chap.setChapter_name(newName);
                dao.editChapter(chap);
                int courseID = Integer.parseInt(request.getParameter("courseId"));
                List<Chapter> listChapter = dao.getChaptersByCourseID(courseID);
                request.setAttribute("listChapter", listChapter);
                request.setAttribute("course", daoC.getCourseByID_DungBT(courseID));
//                request.getRequestDispatcher("DungBT_Pages/test.jsp").forward(request, response);
                request.getRequestDispatcher("DungBT_Pages/chapters.jsp").forward(request, response);
            }
        } else if (type.equalsIgnoreCase("delete")) {
            int courseID = Integer.parseInt(request.getParameter("courseId"));
            int chapter_id = Integer.parseInt(request.getParameter("chapterId"));
            if (dao.getChapterByChapterID(chapter_id) != null) {
                dao.deleteChapter(chapter_id);
                loadDBwithCourseID(courseID, request, response);
            }
        } else if (type.equalsIgnoreCase("search")) {
            CourseDAO courseDAO = new CourseDAO();
            int courseID = Integer.parseInt(request.getParameter("courseId"));
            String txt = request.getParameter("nameSearch");
            List<Chapter> listC = dao.searchByName(txt, courseID);
            request.setAttribute("course", courseDAO.getCourseByID_DungBT(courseID));
            request.setAttribute("listChapter", listC);
            request.getRequestDispatcher("DungBT_Pages/chapters.jsp").forward(request, response);
        }
    }

    public void loadDBwithCourseID(int courseID, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ChapterDAO dao = new ChapterDAO();
        CourseDAO courseDAO = new CourseDAO();
        List<Chapter> listChaps = dao.getChaptersByCourseID(courseID);
        listChaps = dao.getChaptersByCourseID(courseID);
        request.setAttribute("listChapter", listChaps);
        request.setAttribute("course", courseDAO.getCourseByID_DungBT(courseID));
        request.getRequestDispatcher("DungBT_Pages/chapters.jsp").forward(request, response);
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
