// ShowCourseDetailsByCategory.java
package controller.common;

import dto.SubjectControllerByAdminDAO;
import model.CourseControlByAdmin;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ShowCourseDetailsByCategory", urlPatterns = {"/showcoursedetails"})
public class ShowCourseDetailsByCategory extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        String keyword = request.getParameter("keyword") != null ? request.getParameter("keyword") : "";
        int page = Integer.parseInt(request.getParameter("page") != null ? request.getParameter("page") : "1");
        int recordsPerPage = 5;
        int offset = (page - 1) * recordsPerPage;

        SubjectControllerByAdminDAO dao = new SubjectControllerByAdminDAO();
        ArrayList<CourseControlByAdmin> courseList = dao.searchCoursesByCategoryId(categoryId, keyword, offset, recordsPerPage);

        int totalRecords = dao.getTotalCoursesByCategoryId(categoryId, keyword);
        int noOfPages = (int) Math.ceil(totalRecords * 1.0 / recordsPerPage);

        boolean hasNextPage = page < noOfPages;
        boolean hasPreviousPage = page > 1;

        request.setAttribute("courseList", courseList);
        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", page);
        request.setAttribute("hasNextPage", hasNextPage);
        request.setAttribute("hasPreviousPage", hasPreviousPage);
        request.setAttribute("keyword", keyword);
        request.getRequestDispatcher("ViewCourseDetails.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));

        SubjectControllerByAdminDAO dao = new SubjectControllerByAdminDAO();

        if ("deleteCourse".equals(action)) {
            int courseId = Integer.parseInt(request.getParameter("courseId"));
            boolean isDeleted = dao.removeCourseFromCategory(categoryId, courseId);

            if (isDeleted) {
                request.setAttribute("message", "Course removed from category successfully.");
            } else {
                request.setAttribute("message", "Failed to remove course from category.");
            }
        }

        // Redirect lại với các khóa học còn lại sau khi xóa
        response.sendRedirect("showcoursedetails?categoryId=" + categoryId);
    }

    @Override
    public String getServletInfo() {
        return "Servlet displays course details by category";
    }

}
