/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.common;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dto.BlogDAO;
import dto.SliderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Blog;
import model.Slider;

/**
 *
 * @author Admin
 */
@WebServlet(name="SliderListController", urlPatterns={"/sliderlist"})
public class SliderListController extends HttpServlet {
   
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
            out.println("<title>Servlet SliderListController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SliderListController at " + request.getContextPath () + "</h1>");
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
        //processRequest(request, response);
        SliderDAO sdao = new SliderDAO();
        List<Slider> listS2 = sdao.getAllSliderDiscount();
        List<Slider> listS = sdao.getAllSliderCourse();
        List<Slider> listS1 = sdao.getAllSliderBlog();
        request.setAttribute("listS", listS);
        request.setAttribute("listS1", listS1);
        request.setAttribute("listS2", listS2);
        request.getRequestDispatcher("sliderlisthome.jsp").forward(request, response);
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
        //processRequest(request, response);
        response.setContentType("text/html;charset=UTF-8");
        Gson gson = new Gson();
        JsonObject jsonobj = new JsonObject();
        
        SliderDAO sdao = new SliderDAO();
        List<Slider> listS = sdao.getAllSliderCourse();
        List<Slider> listS1 = sdao.getAllSliderBlog();
        List<Slider> listS2 = sdao.getAllSliderDiscount();

        String list1 = gson.toJson(listS);
        String list2 = gson.toJson(listS1);
        String list3 = gson.toJson(listS2);
        jsonobj.addProperty("list1", list1);
        jsonobj.addProperty("list2", list2);
        jsonobj.addProperty("list3", list3);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonobj.toString());
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
