package controller.auth;

import dto.OrderCourseDAO;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.OrderHistoryDetail;
import model.OrderHistoryDetail.CourseDetail;

@WebServlet(name = "OrderCourseDetailById", urlPatterns = {"/ordercoursedetailbyid"})
public class OrderCourseDetailById extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String orderIdStr = request.getParameter("orderId");
        if (orderIdStr != null) {
            try {
                int orderId = Integer.parseInt(orderIdStr);
                OrderCourseDAO dao = new OrderCourseDAO();
                OrderHistoryDetail orderDetail = dao.getOrderDetailById(orderId);

                if (orderDetail != null) {
                    request.setAttribute("orderDetail", orderDetail);
                    request.getRequestDispatcher("OrderCourseDetailById.jsp").forward(request, response);
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Order not found.");
                }
            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Order ID.");
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Order ID is required.");
        }
    }
}
