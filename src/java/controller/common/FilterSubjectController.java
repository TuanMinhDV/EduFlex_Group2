/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.common;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Learner_Course;
import model.Course;

/**
 *
 * @author admin
 */
@WebServlet(name = "FilterSubjectController", urlPatterns = {"/filtersubject"})
public class FilterSubjectController extends HttpServlet {

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
        String cate = request.getParameter("string1");
        String price = request.getParameter("string2");
        String key = request.getParameter("key");
        String[] s1 = {};
        String[] s2 = {};
        if ((cate == null || cate.length() == 0) && (price == null || price.length() == 0)) {

        } else {
            s1 = cate.split(",");
            s2 = price.split(",");

        }
//        Subject1DAO s = new Subject1DAO();
//        List<Subject> listS = s.filterSubject(s1, s2, key);
//        List<Learner_Subject> listLSS = s.getLearnerSubject();
//        int numberOfSubject = listS.size();
//        int numberOfPage = numberOfSubject / 9;
//        if (numberOfSubject % 9 != 0) {
//            numberOfPage++;
//        }
//        Gson gson = new Gson();
//        String list = gson.toJson(listS);
//        String listLS = gson.toJson(listLSS);
//        JsonObject jsonobj = new JsonObject();
//        jsonobj.addProperty("numberOfPage", numberOfPage);
//        jsonobj.addProperty("list", list);
//        jsonobj.addProperty("listLS", listLS);
//        response.setContentType("application/json");
//        response.setCharacterEncoding("UTF-8");
//        response.getWriter().write(jsonobj.toString());
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
        processRequest(request, response);
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
