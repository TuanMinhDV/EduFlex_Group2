

package controller.auth;


import dto.CategoryDAO;
import java.io.IOException;

import jakarta .servlet.ServletException;
import jakarta .servlet.annotation.WebServlet;
import jakarta .servlet.http.HttpServlet;
import jakarta .servlet.http.HttpServletRequest;
import jakarta .servlet.http.HttpServletResponse;
import java.util.List;
import model.CategoryByAdmin;
import model.Course;


@WebServlet(name="ViewCourseDetailOfCategory", urlPatterns={"/viewcourseofcategory"})
public class ViewCourseDetailOfCategory extends HttpServlet {
    
    
 @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    try {
        // Lấy category_id từ request và kiểm tra hợp lệ
        String categoryIdParam = request.getParameter("category_id");
        if (categoryIdParam == null || !categoryIdParam.matches("\\d+")) {
            request.setAttribute("error", "Invalid category_id. Please provide a valid numeric category_id.");
            request.getRequestDispatcher("ViewCourseDetailOfCategory.jsp").forward(request, response);
            return;
        }

        int categoryId = Integer.parseInt(categoryIdParam);

        // Lấy thông tin danh mục
        CategoryDAO categoryDAO = new CategoryDAO();
        CategoryByAdmin category = categoryDAO.getCategoryById(categoryId);
        if (category == null) {
            request.setAttribute("error", "Category not found.");
            request.getRequestDispatcher("ViewCourseDetailOfCategory.jsp").forward(request, response);
            return;
        }

        // Xử lý tìm kiếm và phân trang
        String searchQuery = request.getParameter("searchQuery");
        if (searchQuery == null) {
            searchQuery = ""; // Nếu không có từ khóa tìm kiếm, mặc định là chuỗi rỗng
        }

        int currentPage = 1; // Mặc định trang đầu tiên
        int itemsPerPage = 10; // Số mục hiển thị trên mỗi trang
        String pageParam = request.getParameter("page");
        if (pageParam != null && pageParam.matches("\\d+")) {
            currentPage = Integer.parseInt(pageParam);
        }

        // Tính toán offset
        int offset = (currentPage - 1) * itemsPerPage;

        // Lấy danh sách khóa học và tổng số khóa học
        List<Course> courses;
        int totalCourses;
        if (!searchQuery.isEmpty()) {
            courses = categoryDAO.searchCoursesByCategoryWithPagination(categoryId, searchQuery, offset, itemsPerPage);
            totalCourses = categoryDAO.getTotalSearchCoursesByCategory(categoryId, searchQuery);
        } else {
            courses = categoryDAO.getCoursesByCategoryWithPagination(categoryId, offset, itemsPerPage);
            totalCourses = categoryDAO.getTotalCoursesByCategory(categoryId);
        }
        int totalPages = (int) Math.ceil((double) totalCourses / itemsPerPage);

        // Truyền dữ liệu sang JSP
        request.setAttribute("category", category);
        request.setAttribute("courses", courses);
        request.setAttribute("searchQuery", searchQuery); // Giữ lại từ khóa tìm kiếm
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);

        // Chuyển hướng đến JSP
        request.getRequestDispatcher("ViewCourseDetailOfCategory.jsp").forward(request, response);
    } catch (Exception e) {
        System.out.println("Error in ViewCourseDetailOfCategory: " + e.getMessage());
        request.setAttribute("error", "An unexpected error occurred. Please try again later.");
        request.getRequestDispatcher("ViewCourseDetailOfCategory.jsp").forward(request, response);
    }
}


}

    
  

