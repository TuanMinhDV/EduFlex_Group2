/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.common.DungBT;

import dto.ChapterDAO;
import dto.LessonDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Chapter;
import model.Lesson;

/**
 *
 * @author dungm
 */
public class LessonListController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet LessonListController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LessonListController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int chap_Id = Integer.parseInt(request.getParameter("chID"));
        loadDBwithChapterID(chap_Id, request, response);
    } 

    public void loadDBwithChapterID(int chap_Id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LessonDAO daoLesson = new LessonDAO();
        ChapterDAO daoChap = new ChapterDAO();
        List<Lesson> listLesson = daoLesson.getAllLessionsByChapterID(chap_Id);
        Chapter chap = daoChap.getChapterByChapterID(chap_Id);
        request.setAttribute("chapter", chap);
        request.setAttribute("listLesson", listLesson);
        request.getRequestDispatcher("DungBT_Pages/lessons.jsp").forward(request, response);
    }
    
    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        LessonDAO dao = new LessonDAO();
        String type = request.getParameter("type");
        if (type.equalsIgnoreCase("add")) {
            int chapID = Integer.parseInt(request.getParameter("chapterId"));
            String nameLesson = request.getParameter("lessonName");
            String video = request.getParameter("videoFile");
            String document = request.getParameter("documentFile");
            List<Lesson> listLessons = dao.getAllLessionsByChapterID(chapID);
            int lessonLast = 0;
            if (!listLessons.isEmpty()) {
                lessonLast = listLessons.getLast().getLesson_no();
            }
            Lesson lessNew = new Lesson(0, lessonLast + 1, nameLesson, video, document, chapID, null);
            dao.addLesson(lessNew);
            loadDBwithChapterID(chapID, request, response);
//            request.setAttribute("test", lessNew.getLesson_name());
//            request.getRequestDispatcher("test.jsp").forward(request, response);
        } else if (type.equalsIgnoreCase("edit")) {
            int lesson_id = Integer.parseInt(request.getParameter("lessonId"));
            int chapterID = Integer.parseInt(request.getParameter("chapterId"));
            String newName = request.getParameter("lessonName");
            String newVideo = request.getParameter("lessonVideo");
            String newDocument = request.getParameter("lessonDocument");

            if (!newName.isEmpty()) {
                Lesson lesson = dao.getLessonByID(lesson_id);
                lesson.setLesson_name(newName);
                lesson.setVideo(newVideo);
                lesson.setDocument(newDocument);
                dao.editLesson(lesson);
                loadDBwithChapterID(chapterID, request, response);
            }
        } else if (type.equalsIgnoreCase("delete")) {
            int lesson_id = Integer.parseInt(request.getParameter("lessonId"));
            if (dao.getLessonByID(lesson_id) != null) {
                dao.deleteLesson(lesson_id);
                int chapterID = Integer.parseInt(request.getParameter("chapterId"));
                loadDBwithChapterID(chapterID, request, response);
            }
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
