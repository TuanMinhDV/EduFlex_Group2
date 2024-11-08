package controller.common;

import dto.CourseControllerByAdminDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AddCategoryToCourse", urlPatterns = {"/addcategorytocourse"})
public class AddCategoryToCourse extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int courseId = Integer.parseInt(request.getParameter("courseId"));
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));

        CourseControllerByAdminDAO dao = new CourseControllerByAdminDAO();
        
        // Call the method to add the category to the course
        boolean success = dao.addCategoryToCourse(courseId, categoryId);
        
        if (success) {
            response.sendRedirect("viewcourselistbyadmin"); // Redirect to the course list page on success
        } else {
            request.setAttribute("errorMessage", "Failed to add category to course.");
            request.getRequestDispatcher("ViewCourseListByAdmin.jsp").forward(request, response);
        }
    }
}
