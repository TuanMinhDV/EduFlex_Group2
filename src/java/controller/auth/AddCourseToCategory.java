package controller.auth;

import dto.CategoryDAO;
import dto.CourseDAO;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Course;

@WebServlet(name = "AddCourseToCategory", urlPatterns = {"/addcoursetocategory"})
public class AddCourseToCategory extends HttpServlet {

   @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    try {
        String categoryIdParam = request.getParameter("category_id");
        if (categoryIdParam == null || !categoryIdParam.matches("\\d+")) {
            request.setAttribute("error", "Invalid category_id.");
            request.getRequestDispatcher("AddCourseToCategory.jsp").forward(request, response);
            return;
        }
        int categoryId = Integer.parseInt(categoryIdParam);

        // Lấy từ khóa tìm kiếm
        String searchQuery = request.getParameter("searchQuery");
        if (searchQuery == null) {
            searchQuery = ""; // Nếu không có từ khóa tìm kiếm, mặc định là rỗng
        }

        // Phân trang
        int itemsPerPage = 10; // Số lượng mục trên mỗi trang
        int currentPage = 1; // Mặc định là trang đầu tiên
        String pageParam = request.getParameter("page");
        if (pageParam != null && pageParam.matches("\\d+")) {
            currentPage = Integer.parseInt(pageParam);
        }
        int offset = (currentPage - 1) * itemsPerPage;

        // Lấy dữ liệu từ DAO
        CategoryDAO dao = new CategoryDAO();
        List<Course> coursesNotInCategory = dao.searchCoursesNotInCategoryWithPagination(categoryId, searchQuery, offset, itemsPerPage);
        int totalCourses = dao.getTotalCoursesNotInCategoryWithSearch(categoryId, searchQuery);

        int totalPages = (int) Math.ceil((double) totalCourses / itemsPerPage);

        // Truyền dữ liệu sang JSP
        request.setAttribute("categoryId", categoryId);
        request.setAttribute("coursesNotInCategory", coursesNotInCategory);
        request.setAttribute("searchQuery", searchQuery);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);

        request.getRequestDispatcher("AddCourseToCategory.jsp").forward(request, response);
    } catch (Exception e) {
        request.setAttribute("error", "An unexpected error occurred: " + e.getMessage());
        request.getRequestDispatcher("AddCourseToCategory.jsp").forward(request, response);
    }
}


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Lấy category_id và danh sách course_id từ request
            int categoryId = Integer.parseInt(request.getParameter("category_id"));
            String[] selectedCourseIds = request.getParameterValues("course_id");

            if (selectedCourseIds != null) {
                CategoryDAO dao = new CategoryDAO();
                for (String courseIdStr : selectedCourseIds) {
                    int courseId = Integer.parseInt(courseIdStr);
                    dao.addCourseToCategory(courseId, categoryId);
                }
                request.getSession().setAttribute("success", "Courses added successfully!");
            } else {
                request.getSession().setAttribute("error", "No courses selected.");
            }

            response.sendRedirect("viewcourseofcategory?category_id=" + categoryId);
        } catch (Exception e) {
            request.getSession().setAttribute("error", "An unexpected error occurred: " + e.getMessage());
            response.sendRedirect("viewcourseofcategory");
        }
    }
}
