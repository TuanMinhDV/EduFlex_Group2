package controller.auth;

import dto.CommentDAO;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Comment;

@WebServlet(name = "CommentControllerByAdmin", urlPatterns = {"/commentcontrollerbyadmin"})
public class CommentControllerByAdmin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CommentDAO commentDAO = new CommentDAO();

        // Lấy tham số từ request
        String pageParam = request.getParameter("page");
        int page = (pageParam == null || pageParam.isEmpty()) ? 1 : Integer.parseInt(pageParam);

        int pageSize = 10;

        // Lấy action để xác định nút nhấn
        String action = request.getParameter("action"); // "filter", "search", hoặc "clearFilter"

        // Lấy tham số lọc và tìm kiếm
        String startDateParam = request.getParameter("startDate");
        String endDateParam = request.getParameter("endDate");
        String startReportDateParam = request.getParameter("startReportDate");
        String endReportDateParam = request.getParameter("endReportDate");
        String statusParam = request.getParameter("status");
        String onlyReportedParam = request.getParameter("onlyReported");
        String searchKeyword = request.getParameter("searchKeyword");

        java.sql.Date startDate = null;
        java.sql.Date endDate = null;
        java.sql.Date startReportDate = null;
        java.sql.Date endReportDate = null;

        boolean onlyReported = "true".equalsIgnoreCase(onlyReportedParam);

        // Xử lý các tham số ngày
        if (startDateParam != null && !startDateParam.isEmpty()) {
            startDate = java.sql.Date.valueOf(startDateParam);
        }
        if (endDateParam != null && !endDateParam.isEmpty()) {
            endDate = java.sql.Date.valueOf(endDateParam);
        }
        if (startReportDateParam != null && !startReportDateParam.isEmpty()) {
            startReportDate = java.sql.Date.valueOf(startReportDateParam);
        }
        if (endReportDateParam != null && !endReportDateParam.isEmpty()) {
            endReportDate = java.sql.Date.valueOf(endReportDateParam);
        }

        List<Comment> comments;

        // Phân biệt hành động
        if ("filter".equalsIgnoreCase(action)) {
            comments = commentDAO.getCommentsByPage(page, pageSize, startDate, endDate, statusParam, onlyReported, searchKeyword, startReportDate, endReportDate);
        } else if ("search".equalsIgnoreCase(action)) {
            comments = commentDAO.getCommentsByPage(page, pageSize, null, null, null, false, searchKeyword, null, null);
        } else if ("clearFilter".equalsIgnoreCase(action)) {
            // Reset tất cả bộ lọc
            comments = commentDAO.getCommentsByPage(page, pageSize, null, null, null, false, null, null, null);

            startDateParam = null;
            endDateParam = null;
            startReportDateParam = null;
            endReportDateParam = null;
            statusParam = null;
            onlyReported = false;
            searchKeyword = null;
        } else {
            // Mặc định hiển thị tất cả
            comments = commentDAO.getCommentsByPage(page, pageSize, startDate, endDate, statusParam, onlyReported, searchKeyword, startReportDate, endReportDate);
        }

        // Tính tổng số trang
        int totalComments = commentDAO.getTotalComments();
        int totalPages = (int) Math.ceil((double) totalComments / pageSize);

        // Gửi dữ liệu tới JSP
        request.setAttribute("comments", comments);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("startDate", startDateParam);
        request.setAttribute("endDate", endDateParam);
        request.setAttribute("startReportDate", startReportDateParam);
        request.setAttribute("endReportDate", endReportDateParam);
        request.setAttribute("status", statusParam);
        request.setAttribute("onlyReported", onlyReportedParam);
        request.setAttribute("searchKeyword", searchKeyword);

        request.getRequestDispatcher("CommentListControllerByAdmin.jsp").forward(request, response);
    }
}
