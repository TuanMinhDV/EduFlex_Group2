/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.common;

import dto.QuizDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Question;

/**
 *
 * @author dungm
 */
public class QuestionManageController extends HttpServlet {

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
            out.println("<title>Servlet QuestionManageController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet QuestionManageController at " + request.getContextPath() + "</h1>");
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
        int quizzID = Integer.parseInt(request.getParameter("quizzID"));
        LoadDBWithQuizzID(quizzID, request, response);
    }

    public void LoadDBWithQuizzID(int quizzID, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        QuizDAO dao = new QuizDAO();
        List<Question> listQuestion = dao.getAllQuestionsByQuizID(quizzID);
        request.setAttribute("quizzID", quizzID);
        request.setAttribute("listQuestion", listQuestion);
        request.getRequestDispatcher("ManageQuestionsByIns.jsp").forward(request, response);
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
        QuizDAO dao = new QuizDAO();
        String type = request.getParameter("type");
        if (type.equalsIgnoreCase("add")) {
            int quizzID = Integer.parseInt(request.getParameter("quizzID"));
            String contentQues = request.getParameter("text");
            String opt1 = request.getParameter("option1");
            String opt2 = request.getParameter("option2");
            String opt3 = request.getParameter("option3");
            String opt4 = request.getParameter("option4");
            int answer = Integer.parseInt(request.getParameter("correctAnswer"));
            Question ques = new Question(contentQues, opt1, opt2, opt3, opt4, answer, quizzID);
            dao.addQuestion(ques);
            LoadDBWithQuizzID(quizzID, request, response);
        } else if (type.equalsIgnoreCase("edit")) {
            int quizzID = Integer.parseInt(request.getParameter("quizzID"));
            int quesID = Integer.parseInt(request.getParameter("id"));
            String contentQues = request.getParameter("text");
            String opt1 = request.getParameter("option1");
            String opt2 = request.getParameter("option2");
            String opt3 = request.getParameter("option3");
            String opt4 = request.getParameter("option4");
            int answer = Integer.parseInt(request.getParameter("correctAnswer"));
            Question ques = new Question(quesID, contentQues, opt1, opt2, opt3, opt4, answer, quizzID, 0);
            dao.editQuestion(ques);
            LoadDBWithQuizzID(quizzID, request, response);
        } else if (type.equalsIgnoreCase("delete")) {
            int quizzID = Integer.parseInt(request.getParameter("quizzID"));
            int quesID = Integer.parseInt(request.getParameter("question_id"));
//            request.setAttribute("test", quesID);
//            request.getRequestDispatcher("test.jsp").forward(request, response);
            dao.deleteQuestion(quesID);
            LoadDBWithQuizzID(quizzID, request, response);
        } else if (type.equalsIgnoreCase("delete")) {
            int quizzID = Integer.parseInt(request.getParameter("quizzID"));
            String txtSearch = request.getParameter("txtSearch");
            List<Question> listQues = dao.searchByName(txtSearch, quizzID);
            request.setAttribute("quizzID", quizzID);
            request.setAttribute("listQuestion", listQues);
            request.getRequestDispatcher("ManageQuestionsByIns.jsp").forward(request, response);
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

    public static void main(String[] args) {
        
    }
}
