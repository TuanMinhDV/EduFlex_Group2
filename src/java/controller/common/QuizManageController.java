/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.common;

import dto.ChapterDAO;
import dto.QuizDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Chapter;
import model.Quiz;

/**
 *
 * @author dungm
 */
public class QuizManageController extends HttpServlet {
   
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
            out.println("<title>Servlet QuizManageController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet QuizManageController at " + request.getContextPath () + "</h1>");
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
        int chapID = Integer.parseInt(request.getParameter("chapID"));
        LoadDBWithChapterID(chapID, request, response);
    } 

    public void LoadDBWithChapterID(int chapterID, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ChapterDAO daoChap = new ChapterDAO();
        Chapter chap = daoChap.getChapterByChapterID(chapterID);
        QuizDAO daoQuizz = new QuizDAO();
        List<Quiz> listQuizz = daoQuizz.getAllQuizzesByChapterID(chapterID);
        request.setAttribute("chapter", chap);
        request.setAttribute("listQuizz", listQuizz);
        request.getRequestDispatcher("ManageQuizzByIns.jsp").forward(request, response);
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
        QuizDAO dao = new QuizDAO();
        String type = request.getParameter("type");
        if (type.equalsIgnoreCase("add")) {
            int chapID = Integer.parseInt(request.getParameter("chapterID"));
            String quizzTitle = request.getParameter("quizTitle");
            Quiz newQuiz = new Quiz(quizzTitle, chapID);
            dao.addQuizz(newQuiz);
            LoadDBWithChapterID(chapID, request, response);
        } else if (type.equalsIgnoreCase("delete")) {
            int quizId = Integer.parseInt(request.getParameter("quizId"));
            dao.deleteQuizz(quizId);
            int chapterID = Integer.parseInt(request.getParameter("chapterId"));
            LoadDBWithChapterID(chapterID, request, response);
        } else if (type.equalsIgnoreCase("edit")) {
            int chapterID = Integer.parseInt(request.getParameter("chapterId"));
            int quizID = Integer.parseInt(request.getParameter("quizId"));
            String quizTitle = request.getParameter("quizTitle");
            Quiz editedQuiz = new Quiz(quizID, quizTitle);
//            request.setAttribute("test", editedQuiz);
//            request.getRequestDispatcher("test.jsp").forward(request, response);
            dao.editQuizz(editedQuiz);
            LoadDBWithChapterID(chapterID, request, response);
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
