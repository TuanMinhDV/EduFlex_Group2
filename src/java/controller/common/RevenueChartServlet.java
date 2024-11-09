/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.common;

import dto.OrderControllerByAdminDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta .servlet.ServletException;
import jakarta .servlet.annotation.WebServlet;
import jakarta .servlet.http.HttpServlet;
import jakarta .servlet.http.HttpServletRequest;
import jakarta .servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;
import model.OrderControlByAdmin;

/**
 *
 * @author admin
 */
@WebServlet("/revenueChart")
public class RevenueChartServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OrderControllerByAdminDAO orderDao = new OrderControllerByAdminDAO();
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");

        ArrayList<OrderControlByAdmin> orders = orderDao.getOrderList(startDate, endDate, null, null, 1, 1000);
        
        Map<String, Double> revenueMap = new LinkedHashMap<>();
        for (OrderControlByAdmin order : orders) {
            String month = order.getOrderDate().substring(0, 7); // YYYY-MM
            revenueMap.put(month, revenueMap.getOrDefault(month, 0.0) + order.getTotalMoney());
        }
        
         double totalRevenue = orderDao.getTotalRevenue(startDate, endDate);
        double averageOrderValue = orderDao.getAverageOrderValue(startDate, endDate);

        
        request.setAttribute("totalRevenue", totalRevenue);
        request.setAttribute("averageOrderValue", averageOrderValue);
        request.setAttribute("revenueData", revenueMap);
        request.getRequestDispatcher("/revenueChart.jsp").forward(request, response);
    }
}
