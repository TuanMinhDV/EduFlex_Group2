

package controller.auth;

import dto.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta .servlet.ServletException;
import jakarta .servlet.annotation.WebServlet;
import jakarta .servlet.http.HttpServlet;
import jakarta .servlet.http.HttpServletRequest;
import jakarta .servlet.http.HttpServletResponse;
import java.util.Map;


@WebServlet(name="HomAdminController", urlPatterns={"/homeadmincontroller"})
public class HomAdminController extends HttpServlet {
   
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet HomAdminController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HomAdminController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    
  

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        // Tạo đối tượng DAO để truy vấn dữ liệu
        AccountDAO accountDAO = new AccountDAO();

        // Lấy dữ liệu từ DB
        Map<String, Integer> roleCounts = accountDAO.getAccountCountByRole();

        // Chuyển dữ liệu sang mảng để JSP xử lý dễ dàng hơn
        String[] roles = roleCounts.keySet().toArray(new String[0]);
        int[] counts = roleCounts.values().stream().mapToInt(Integer::intValue).toArray();

        // Gửi dữ liệu đến JSP
        request.setAttribute("roles", roles);
        request.setAttribute("counts", counts);

        // Forward đến trang JSP
        request.getRequestDispatcher("HomeAdmin.jsp").forward(request, response);
    }



   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
