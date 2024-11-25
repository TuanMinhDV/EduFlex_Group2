/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.auth;

import dto.OrderCourseDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta .servlet.ServletException;
import jakarta .servlet.annotation.WebServlet;
import jakarta .servlet.http.HttpServlet;
import jakarta .servlet.http.HttpServletRequest;
import jakarta .servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 *
 * @author admin
 */
@WebServlet(name="ViewRevenueStatisticsByAdmin", urlPatterns={"/viewrevenuestatisticsbyadmin"})
public class ViewRevenueStatisticsByAdmin extends HttpServlet {
   
  @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    OrderCourseDAO dao = new OrderCourseDAO();

    // Lấy các tham số từ request
    String startDate = request.getParameter("startDate");
    String endDate = request.getParameter("endDate");

    // Lấy dữ liệu doanh thu theo khoảng thời gian
    List<Map<String, Object>> revenueData = dao.getMonthlyRevenueWithFilters(startDate, endDate);

    // Chuẩn bị dữ liệu cho biểu đồ
    List<String> months = new ArrayList<>();
    List<Float> revenues = new ArrayList<>();
    float totalRevenue = 0; // Tổng doanh thu
    for (Map<String, Object> entry : revenueData) {
        months.add("Month " + entry.get("month"));
        float revenue = (Float) entry.get("revenue");
        revenues.add(revenue);
        totalRevenue += revenue;
    }

    // Đặt dữ liệu vào request
    request.setAttribute("months", months);
    request.setAttribute("revenues", revenues);
    request.setAttribute("totalRevenue", totalRevenue); // Tổng doanh thu

    // Chuyển hướng tới JSP
    request.getRequestDispatcher("ViewRevenueStatisticsByAdmin.jsp").forward(request, response);
}



}
