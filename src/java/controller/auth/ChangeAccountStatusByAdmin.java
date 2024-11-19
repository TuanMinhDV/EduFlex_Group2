package controller.auth;

import dto.CommentDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ChangeAccountStatusByAdmin", urlPatterns = {"/changeaccountstatusbyadmin"})
public class ChangeAccountStatusByAdmin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CommentDAO commentDAO = new CommentDAO();
        
        // Lấy tham số từ request
        String commentIdParam = request.getParameter("commentId");
        String statusParam = request.getParameter("status");
        
        try {
            int commentId = Integer.parseInt(commentIdParam);
            int status = Integer.parseInt(statusParam);

            // Đảo trạng thái (nếu đang 1 thì đổi thành 0, và ngược lại)
            int newStatus = (status == 1) ? 0 : 1;

            // Cập nhật trạng thái
            boolean isUpdated = commentDAO.updateCommentStatus(commentId, newStatus);

            if (isUpdated) {
                response.sendRedirect("commentcontrollerbyadmin");
            } else {
                response.getWriter().write("Failed to update status.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error occurred while updating status.");
        }
    }
}
