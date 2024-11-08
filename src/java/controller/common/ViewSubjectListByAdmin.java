package controller.common;

import dto.SubjectControllerByAdminDAO;
import model.SubjectControlByAdmin;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;

@WebServlet(name = "ViewSubjectListByAdmin", urlPatterns = {"/viewsubjectbyadmin"})
public class ViewSubjectListByAdmin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String searchName = request.getParameter("searchName");
        SubjectControllerByAdminDAO dao = new SubjectControllerByAdminDAO();
        ArrayList<SubjectControlByAdmin> subjectList;

        int page = 1;
        int recordsPerPage = 10;

        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        if (searchName != null && !searchName.trim().isEmpty()) {
            subjectList = dao.searchSubjectsByName(searchName, (page - 1) * recordsPerPage, recordsPerPage);
        } else {
            subjectList = dao.getListSubjectControlByAdmin((page - 1) * recordsPerPage, recordsPerPage);
        }

        int noOfRecords = dao.getNoOfRecords(searchName);
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);

        request.setAttribute("subjectList", subjectList);
        request.setAttribute("searchName", searchName);
        request.setAttribute("currentPage", page);
        request.setAttribute("noOfPages", noOfPages);
        request.getRequestDispatcher("ViewSubjectListByAdmin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        SubjectControllerByAdminDAO dao = new SubjectControllerByAdminDAO();
        String message = "";

        if ("addOrUpdate".equals(action)) {
            int categoryId = Integer.parseInt(request.getParameter("categoryId"));
            String categoryName = request.getParameter("categoryName").trim();

            if (!categoryName.matches("[A-Za-z0-9 ]+")) {
                message = "Category name can only contain letters, numbers, and spaces.";
                response.sendRedirect("viewsubjectbyadmin?errorMessage=" + URLEncoder.encode(message, "UTF-8"));
                return;
            }

            if (dao.isCategoryNameExists(categoryName, categoryId)) {
                message = "Category name already exists.";
                response.sendRedirect("viewsubjectbyadmin?errorMessage=" + URLEncoder.encode(message, "UTF-8"));
                return;
            }

            boolean isSuccess;
            if (categoryId > 0) {
                isSuccess = dao.updateCategory(categoryId, categoryName);
                message = isSuccess ? "Category updated successfully." : "Failed to update category.";
            } else {
                isSuccess = dao.addCategory(categoryName);
                message = isSuccess ? "Category added successfully." : "Failed to add category.";
            }
            response.sendRedirect("viewsubjectbyadmin?" + (isSuccess ? "successMessage" : "errorMessage") + "=" + URLEncoder.encode(message, "UTF-8"));
        } else if ("delete".equals(action)) {
            int categoryId = Integer.parseInt(request.getParameter("categoryId"));
            boolean isDeleted = dao.deleteCategory(categoryId);
            message = isDeleted ? "Category deleted successfully." : "Failed to delete category.";
            response.sendRedirect("viewsubjectbyadmin?" + (isDeleted ? "successMessage" : "errorMessage") + "=" + URLEncoder.encode(message, "UTF-8"));
        }
    }
}
