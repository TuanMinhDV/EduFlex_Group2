package controller.common;

import dto.BlogDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Blog;


@WebServlet(name = "BlogDetailController", urlPatterns = "/blogdetail")
public class BlogDetailController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BlogDetailServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BlogDetailServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        String id_raw = request.getParameter("id");
        BlogDAO dao = new BlogDAO();
        Blog b = dao.getBlogByID(id_raw);
        Blog nextblog = dao.getNextBlogByID(id_raw);
        Blog preblog = dao.getPreviousBlogByID(id_raw);
        List<Blog> listB = dao.getAllBlog();
        int id1 = Integer.parseInt(id_raw);
        List<Blog> listB1 = dao.getRelatedBlogRecent(id1);
        Blog maxBlog = dao.getBlogWithMaxId();
        int maxId = maxBlog.getId();
        
        request.setAttribute("detail", b);
        request.setAttribute("total", maxId);
        request.setAttribute("nextblog", nextblog);
        request.setAttribute("preblog", preblog);
        request.setAttribute("listB", listB);
        request.setAttribute("listB1", listB1);
        request.getRequestDispatcher("blogdetail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
