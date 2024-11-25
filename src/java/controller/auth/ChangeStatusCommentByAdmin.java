/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.auth;

import dto.CommentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta .servlet.ServletException;
import jakarta .servlet.annotation.WebServlet;
import jakarta .servlet.http.HttpServlet;
import jakarta .servlet.http.HttpServletRequest;
import jakarta .servlet.http.HttpServletResponse;

/**
 *
 * @author admin
 */
@WebServlet(name="ChangeStatusCommentByAdmin", urlPatterns={"/changestatuscommentbyadmin"})
public class ChangeStatusCommentByAdmin extends HttpServlet {
   
   @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    // Lấy thông tin từ form
    int commentId = Integer.parseInt(request.getParameter("commentId"));
    String currentStatus = request.getParameter("status");
    int newStatus = currentStatus.equals("1") ? 0 : 1; // Đổi trạng thái

    // Sử dụng DAO để cập nhật trạng thái
    CommentDAO commentDAO = new CommentDAO();
    boolean isUpdated = commentDAO.updateCommentStatus(commentId, newStatus);

    // Redirect về trang quản lý comment với thông báo
    if (isUpdated) {
        response.sendRedirect("commentcontrollerbyadmin?success=1");
    } else {
        response.sendRedirect("commentcontrollerbyadmin?error=1");
    }
}


}
