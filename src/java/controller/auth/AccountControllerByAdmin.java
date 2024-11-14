package controller.auth;

import dto.AccountDAO;
import java.io.IOException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import model.Role;
    
    @WebServlet(name="AccountControllerByAdmin", urlPatterns={"/accountcontrollerbyadmin"})
public class AccountControllerByAdmin extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        
        AccountDAO dao = new AccountDAO();
        
        // Lấy tham số tìm kiếm và lọc
        String searchQuery = request.getParameter("searchQuery");
        String role = request.getParameter("role");
        String status = request.getParameter("status");
        
        // Phân trang
        int page = 1;
        int pageSize = 10;
        String pageParam = request.getParameter("page");
        if (pageParam != null) {
            page = Integer.parseInt(pageParam);
        }
        
        // Tính tổng số trang
        int totalAccounts = dao.getTotalAccounts(searchQuery, role, status);
        int totalPages = (int) Math.ceil((double) totalAccounts / pageSize);
        
        // Lấy danh sách tài khoản theo tìm kiếm và lọc
        ArrayList<Account> data = dao.getListAccountBySearchAndFilter(searchQuery, role, status, page, pageSize);
        
        // Lấy danh sách role từ cơ sở dữ liệu
        ArrayList<Role> roles = dao.getListRoleByAdmin(); // Lấy danh sách role
        
        // Thiết lập các tham số để gửi về JSP
        request.setAttribute("data", data);
        request.setAttribute("roles", roles); // Truyền danh sách role vào JSP
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("searchQuery", searchQuery);
        request.setAttribute("role", role);
        request.setAttribute("status", status);
        
        // Chuyển tiếp tới JSP
        request.getRequestDispatcher("AccountControllerByAdmin.jsp").forward(request, response);
    }
}
