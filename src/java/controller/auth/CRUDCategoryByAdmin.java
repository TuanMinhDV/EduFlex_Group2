package controller.auth;

import dto.CategoryDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import model.CategoryByAdmin;

@WebServlet(name = "CRUDCategoryByAdmin", urlPatterns = {"/crudcategorybyadmin"})
public class CRUDCategoryByAdmin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String name = request.getParameter("categoryName");
        String idParam = request.getParameter("categoryId");
        int categoryId = 0;

        // Parse category ID
        if (idParam != null && !idParam.isEmpty()) {
            try {
                categoryId = Integer.parseInt(idParam);
            } catch (NumberFormatException e) {
                response.sendRedirect("viewcategorylistbyadmin?message=Invalid+category+ID&messageType=error");
                return;
            }
        }

        CategoryDAO dao = new CategoryDAO();

        // Handle delete action
        if ("delete".equals(action)) {
            boolean success = dao.deleteCategory(categoryId);
            if (success) {
                response.sendRedirect("viewcategorylistbyadmin?message=Category+deleted+successfully&messageType=success");
            } else {
                response.sendRedirect("viewcategorylistbyadmin?message=Failed+to+delete+category&messageType=error");
            }
            return;
        }

        // Handle add or update action
        if ("addOrUpdate".equals(action)) {
            // Validate category name with regex
            if (name == null || !name.matches("[A-Za-z0-9 ]+")) {
                response.sendRedirect("viewcategorylistbyadmin?message=Invalid+category+name&messageType=error");
                return;
            }

            // Check if category already exists (exclude current category for update)
            if (dao.isCategoryExists(name) && categoryId == 0) {
                response.sendRedirect("viewcategorylistbyadmin?message=Category+already+exists&messageType=error");
                return;
            }

            java.sql.Date currentDate = new java.sql.Date(System.currentTimeMillis());
            CategoryByAdmin category = new CategoryByAdmin();
            category.setId(categoryId);
            category.setName(name);
            category.setUpdated_date(currentDate);

            boolean success;
            if (categoryId > 0) {
                // Update category
                success = dao.updateCategory(category);
            } else {
                // Add new category
                success = dao.addCategory(category);
            }

            if (success) {
                response.sendRedirect("viewcategorylistbyadmin?message=Operation+successful&messageType=success");
            } else {
                response.sendRedirect("viewcategorylistbyadmin?message=Failed+to+process+operation&messageType=error");
            }
        }
    }
}
