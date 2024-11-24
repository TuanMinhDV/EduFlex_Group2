package controller.auth;

import dto.CategoryDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import model.CategoryByAdmin;

@WebServlet(name = "ViewCategoryListByAdmin", urlPatterns = {"/viewcategorylistbyadmin"})
public class ViewCategoryListByAdmin extends HttpServlet {

@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    int currentPage = 1;
    int itemsPerPage = 10; // Số mục hiển thị trên mỗi trang
    String searchQuery = request.getParameter("searchQuery");
    if (searchQuery == null) {
        searchQuery = ""; // Nếu không có từ khóa tìm kiếm, mặc định là chuỗi rỗng
    }

    String pageParam = request.getParameter("page");
    if (pageParam != null) {
        try {
            currentPage = Integer.parseInt(pageParam);
        } catch (NumberFormatException e) {
            currentPage = 1;
        }
    }

    CategoryDAO dao = new CategoryDAO();
    int totalItems = dao.getTotalCategoryCountWithSearch(searchQuery);
    int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);
    int offset = (currentPage - 1) * itemsPerPage;

    List<CategoryByAdmin> categories = dao.searchCategoriesWithPagination(searchQuery, offset, itemsPerPage);
    Map<Integer, Integer> totalCoursesMap = dao.getTotalCoursesForAllCategories();

    request.setAttribute("categories", categories);
    request.setAttribute("totalCoursesMap", totalCoursesMap);
    request.setAttribute("currentPage", currentPage);
    request.setAttribute("totalPages", totalPages);
    request.setAttribute("searchQuery", searchQuery); // Đưa searchQuery để giữ giá trị trong form tìm kiếm

    // Đọc message và messageType từ query string
    String message = request.getParameter("message");
    String messageType = request.getParameter("messageType");

    if (message != null && messageType != null) {
        request.setAttribute("message", message);
        request.setAttribute("messageType", messageType);
    }

    request.getRequestDispatcher("ViewCategoryListByAdmin.jsp").forward(request, response);
}






    
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
