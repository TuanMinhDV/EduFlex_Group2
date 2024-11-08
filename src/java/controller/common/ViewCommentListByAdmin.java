package controller.common;

import java.io.IOException;
import java.sql.Date;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dto.CommentControllerByAdminDAO;
import model.CommentControlByAdmin;
import model.AccountControlByAdmin;
import model.CourseControlByAdmin;
import model.ModelControlByAdmin;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name="ViewCommentListByAdmin", urlPatterns={"/viewcommentlistbyadmin"})
public class ViewCommentListByAdmin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    
        // Lấy tham số tìm kiếm và bộ lọc từ request
        String keyword = request.getParameter("keyword"); // Tìm kiếm
        String status = request.getParameter("status"); // Lọc trạng thái
        boolean reportedOnly = "true".equals(request.getParameter("reportedOnly")); // Lọc báo cáo

        Date startCommentDate = request.getParameter("startCommentDate") != null && !request.getParameter("startCommentDate").isEmpty() 
                ? Date.valueOf(request.getParameter("startCommentDate")) : null;
        Date endCommentDate = request.getParameter("endCommentDate") != null && !request.getParameter("endCommentDate").isEmpty() 
                ? Date.valueOf(request.getParameter("endCommentDate")) : null;
        Date startReportDate = request.getParameter("startReportDate") != null && !request.getParameter("startReportDate").isEmpty() 
                ? Date.valueOf(request.getParameter("startReportDate")) : null;
        Date endReportDate = request.getParameter("endReportDate") != null && !request.getParameter("endReportDate").isEmpty() 
                ? Date.valueOf(request.getParameter("endReportDate")) : null;

        // Xử lý phân trang
        int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
        int limit = 10;
        int offset = (page - 1) * limit;

        // Lấy danh sách bình luận từ DAO
        CommentControllerByAdminDAO commentDAO = new CommentControllerByAdminDAO();
        ArrayList<CommentControlByAdmin> comments = commentDAO.getCommentsWithPagination(
                keyword, status, startCommentDate, endCommentDate, startReportDate, endReportDate, reportedOnly, limit, offset);

        // Lấy tên tài khoản và tên bài học
        Map<Integer, String> accountNames = new HashMap<>();
        Map<Integer, String> lessonNames = new HashMap<>();

        for (CommentControlByAdmin comment : comments) {
            int accountId = comment.getAccountId();
            if (!accountNames.containsKey(accountId)) {
                AccountControlByAdmin account = commentDAO.getUserNameAccountById(accountId);
                if (account != null) {
                    accountNames.put(accountId, account.getUsername());
                }
            }

            int lessonId = comment.getLessonId();
            if (!lessonNames.containsKey(lessonId)) {
                ModelControlByAdmin lesson = commentDAO.getLessonById(lessonId);
                if (lesson != null) {
                    lessonNames.put(lessonId, lesson.getLessonName());
                }
            }
        }

        // Truyền dữ liệu vào JSP
        request.setAttribute("comments", comments);
        request.setAttribute("accountNames", accountNames);
        request.setAttribute("lessonNames", lessonNames);
        request.setAttribute("keyword", keyword);
        request.setAttribute("status", status);
        request.setAttribute("reportedOnly", reportedOnly);
        request.setAttribute("startCommentDate", startCommentDate);
        request.setAttribute("endCommentDate", endCommentDate);
        request.setAttribute("startReportDate", startReportDate);
        request.setAttribute("endReportDate", endReportDate);
        request.setAttribute("currentPage", page);

        request.getRequestDispatcher("ViewCommentListByAdmin.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet to view, search, and filter list of comments by admin";
    }
}
