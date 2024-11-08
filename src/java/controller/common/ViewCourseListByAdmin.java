package controller.common;

import dto.CourseControllerByAdminDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.CourseControlByAdmin;
import model.CategoryControlByAdmin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

@WebServlet(name = "ViewCourseListByAdmin", urlPatterns = {"/viewcourselistbyadmin"})
public class ViewCourseListByAdmin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CourseControllerByAdminDAO dao = new CourseControllerByAdminDAO();

        // Retrieve search keyword and page parameters
        String searchKeyword = request.getParameter("search") != null ? request.getParameter("search") : "";
        int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
        int pageSize = 10; // Set page size

        // Fetch paginated and filtered list of courses
        ArrayList<CourseControlByAdmin> courseList = dao.getCoursesWithPaginationAndSearch(searchKeyword, page, pageSize);

        // Fetch remaining categories for each course
        HashMap<Integer, ArrayList<CategoryControlByAdmin>> categoryMap = new HashMap<>();
        for (CourseControlByAdmin course : courseList) {
            ArrayList<CategoryControlByAdmin> remainingCategories = dao.getCategories(course.getCourseId());
            categoryMap.put(course.getCourseId(), remainingCategories);
        }

        // Get total course count for pagination
        int totalCourses = dao.getTotalCourseCount(searchKeyword);
        int totalPages = (int) Math.ceil((double) totalCourses / pageSize);

        // Set attributes to pass to JSP page
        request.setAttribute("courseList", courseList);
        request.setAttribute("categoryMap", categoryMap);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", page);
        request.setAttribute("searchKeyword", searchKeyword);

        // Forward request to JSP page
        request.getRequestDispatcher("ViewCourseListByAdmin.jsp").forward(request, response);
    }
}
