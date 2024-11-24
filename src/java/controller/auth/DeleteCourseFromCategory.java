/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.auth;

import dto.CategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta .servlet.ServletException;
import jakarta .servlet.annotation.WebServlet;
import jakarta .servlet.http.HttpServlet;
import jakarta .servlet.http.HttpServletRequest;
import jakarta .servlet.http.HttpServletResponse;

@WebServlet(name="DeleteCourseFromCategory", urlPatterns={"/deletecoursefromcategory"})
public class DeleteCourseFromCategory extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Lấy thông tin từ request
            String courseIdParam = request.getParameter("course_id");
            String categoryIdParam = request.getParameter("category_id");

            if (courseIdParam == null || categoryIdParam == null || 
                !courseIdParam.matches("\\d+") || !categoryIdParam.matches("\\d+")) {
                request.setAttribute("error", "Invalid course or category ID.");
                response.sendRedirect("viewcourseofcategory?category_id=" + categoryIdParam);
                return;
            }

            int courseId = Integer.parseInt(courseIdParam);
            int categoryId = Integer.parseInt(categoryIdParam);

            // Thực hiện xóa khóa học khỏi danh mục
            CategoryDAO categoryDAO = new CategoryDAO();
            boolean isDeleted = categoryDAO.removeCourseFromCategory(courseId, categoryId);

            if (isDeleted) {
                // Đặt thông báo thành công
                request.getSession().setAttribute("success", "Course removed successfully!");
            } else {
                // Đặt thông báo lỗi
                request.getSession().setAttribute("error", "Failed to remove the course.");
            }

            // Quay lại trang chi tiết danh mục
            response.sendRedirect("viewcourseofcategory?category_id=" + categoryId);
        } catch (Exception e) {
            System.out.println("Error in DeleteCourseFromCategory: " + e.getMessage());
            request.getSession().setAttribute("error", "An unexpected error occurred.");
            response.sendRedirect("viewcourseofcategory?category_id=" + request.getParameter("category_id"));
        }
    }
}
