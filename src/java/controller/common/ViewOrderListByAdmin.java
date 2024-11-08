package controller.common;

import dto.OrderControllerByAdminDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import model.OrderControlByAdmin;

@WebServlet(name = "ViewOrderListByAdmin", urlPatterns = {"/ViewOrderListByAdmin"})
public class ViewOrderListByAdmin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String minMoneyStr = request.getParameter("minMoney");
        String maxMoneyStr = request.getParameter("maxMoney");

        Double minMoney = minMoneyStr != null && !minMoneyStr.isEmpty() ? Double.parseDouble(minMoneyStr) : null;
        Double maxMoney = maxMoneyStr != null && !maxMoneyStr.isEmpty() ? Double.parseDouble(maxMoneyStr) : null;

        int page = 1;
        int pageSize = 10;
        String pageStr = request.getParameter("page");
        if (pageStr != null) {
            page = Integer.parseInt(pageStr);
        }

        OrderControllerByAdminDAO dao = new OrderControllerByAdminDAO();
        ArrayList<OrderControlByAdmin> orderList = dao.getOrderList(startDate, endDate, minMoney, maxMoney, page, pageSize);
        int totalOrders = dao.getTotalOrders(startDate, endDate, minMoney, maxMoney);
        int totalPages = (int) Math.ceil((double) totalOrders / pageSize);

        request.setAttribute("orderList", orderList);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", page);
        request.setAttribute("startDate", startDate);
        request.setAttribute("endDate", endDate);
        request.setAttribute("minMoney", minMoney);
        request.setAttribute("maxMoney", maxMoney);

        request.getRequestDispatcher("ViewOrderListByAdmin.jsp").forward(request, response);
    }

}
