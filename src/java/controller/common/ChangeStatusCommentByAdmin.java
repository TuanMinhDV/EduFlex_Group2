package controller.common;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import dto.CommentControllerByAdminDAO;

@WebServlet(name = "ChangeStatusCommentByAdmin", urlPatterns = {"/changestatuscommentbyadmin"})
public class ChangeStatusCommentByAdmin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String commentIdParam = request.getParameter("commentId");
        String newStatusParam = request.getParameter("newStatus");

        if (commentIdParam != null && newStatusParam != null) {
            int commentId = Integer.parseInt(commentIdParam);
            int newStatus = Integer.parseInt(newStatusParam);

            CommentControllerByAdminDAO commentDAO = new CommentControllerByAdminDAO();
            boolean updated = commentDAO.updateCommentStatus(commentId, newStatus);

            if (updated) {
                response.sendRedirect("viewcommentlistbyadmin"); // Chuyển hướng về danh sách bình luận
            } else {
                response.getWriter().println("Error updating status");
            }
        } else {
            response.getWriter().println("Invalid parameters");
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet to change status of comments by admin";
    }
}
