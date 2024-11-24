package controller.auth;

import dto.OrderCourseDAO;
import model.OrderHistory;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ViewOrderCourseListByAdmin", urlPatterns = {"/viewordercourselistbyadmin"})
public class ViewOrderCourseListByAdmin extends HttpServlet {
    private static final int PAGE_SIZE = 10; // Số lượng đơn hàng trên mỗi trang

   @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    String pageStr = request.getParameter("page");
    int page = pageStr == null ? 1 : Integer.parseInt(pageStr);

    String startDate = request.getParameter("startDate");
    String endDate = request.getParameter("endDate");
    String minMoneyStr = request.getParameter("minMoney");
    String maxMoneyStr = request.getParameter("maxMoney");

    Float minMoney = (minMoneyStr != null && !minMoneyStr.isEmpty()) ? Float.parseFloat(minMoneyStr) : null;
    Float maxMoney = (maxMoneyStr != null && !maxMoneyStr.isEmpty()) ? Float.parseFloat(maxMoneyStr) : null;

    OrderCourseDAO dao = new OrderCourseDAO();
    List<OrderHistory> orderList = dao.getOrderHistoryListPaginatedWithFilters(page, PAGE_SIZE, startDate, endDate, minMoney, maxMoney);

    int totalOrders = dao.getTotalOrders(); // Bạn có thể thêm bộ lọc tương tự ở đây nếu muốn tính tổng theo bộ lọc
    int totalPages = (int) Math.ceil((double) totalOrders / PAGE_SIZE);

    request.setAttribute("orderList", orderList);
    request.setAttribute("currentPage", page);
    request.setAttribute("totalPages", totalPages);

    // Để hiển thị lại giá trị bộ lọc trên giao diện
    request.setAttribute("startDate", startDate);
    request.setAttribute("endDate", endDate);
    request.setAttribute("minMoney", minMoneyStr);
    request.setAttribute("maxMoney", maxMoneyStr);

    request.getRequestDispatcher("ViewOrderCourseListByAdmin.jsp").forward(request, response);
}

}
