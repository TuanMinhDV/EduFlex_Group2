package dto;

import model.OrderHistory;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.OrderHistoryDetail;
import model.OrderHistoryDetail.CourseDetail;

public class OrderCourseDAO extends DBContext {
    PreparedStatement stm;
    ResultSet rs;

    public List<OrderHistory> getOrderHistoryListPaginatedWithFilters(
        int page, int pageSize, String startDate, String endDate, Float minMoney, Float maxMoney) {
    List<OrderHistory> list = new ArrayList<>();
    try {
        String sql = "SELECT o.order_id AS orderId, o.account_id AS accountId, a.fullname AS accountName, " +
                     "o.order_date AS orderDate, o.total_money AS totalMoney " +
                     "FROM [Order] o " +
                     "JOIN [Account] a ON o.account_id = a.account_id " +
                     "WHERE 1=1 ";
        
        if (startDate != null && !startDate.isEmpty()) {
            sql += "AND o.order_date >= ? ";
        }
        if (endDate != null && !endDate.isEmpty()) {
            sql += "AND o.order_date <= ? ";
        }
        if (minMoney != null) {
            sql += "AND o.total_money >= ? ";
        }
        if (maxMoney != null) {
            sql += "AND o.total_money <= ? ";
        }

        sql += "ORDER BY o.order_date DESC " +
               "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        stm = connection.prepareStatement(sql);

        int index = 1;
        if (startDate != null && !startDate.isEmpty()) {
            stm.setDate(index++, Date.valueOf(startDate));
        }
        if (endDate != null && !endDate.isEmpty()) {
            stm.setDate(index++, Date.valueOf(endDate));
        }
        if (minMoney != null) {
            stm.setFloat(index++, minMoney);
        }
        if (maxMoney != null) {
            stm.setFloat(index++, maxMoney);
        }
        stm.setInt(index++, (page - 1) * pageSize);
        stm.setInt(index, pageSize);

        rs = stm.executeQuery();
        while (rs.next()) {
            OrderHistory order = new OrderHistory(
                rs.getInt("orderId"),
                rs.getInt("accountId"),
                rs.getString("accountName"),
                rs.getDate("orderDate"),
                rs.getFloat("totalMoney")
            );
            list.add(order);
        }
    } catch (SQLException e) {
        System.out.println("Error: " + e.getMessage());
    } finally {
        try {
            if (rs != null) rs.close();
            if (stm != null) stm.close();
        } catch (SQLException e) {
            System.out.println("Error closing resources: " + e.getMessage());
        }
    }
    return list;
}


    // Lấy tổng số đơn hàng
    public int getTotalOrders() {
        int total = 0;
        try {
            String sql = "SELECT COUNT(*) AS total FROM [Order]";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            if (rs.next()) {
                total = rs.getInt("total");
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (stm != null) stm.close();
            } catch (SQLException e) {
                System.out.println("Error closing resources: " + e.getMessage());
            }
        }
        return total;
    }
    
   public OrderHistoryDetail getOrderDetailById(int orderId) {
    OrderHistoryDetail orderDetail = null;
    List<CourseDetail> courses = new ArrayList<>();
    try {
        String sql = "SELECT o.order_id AS orderId, a.username AS username, a.fullname AS fullName, " +
                     "r.role_name AS roleName, c.course_name AS courseName, c.price AS price, " +
                     "o.order_date AS orderDate, o.total_money AS totalMoney " +
                     "FROM [Order] o " +
                     "JOIN [Account] a ON o.account_id = a.account_id " +
                     "JOIN [Role] r ON a.role_id = r.role_id " +
                     "JOIN [Order_Detail] od ON o.order_id = od.order_id " +
                     "JOIN [Course] c ON od.course_id = c.course_id " +
                     "WHERE o.order_id = ?";

        stm = connection.prepareStatement(sql);
        stm.setInt(1, orderId);
        rs = stm.executeQuery();

        while (rs.next()) {
            if (orderDetail == null) {
                orderDetail = new OrderHistoryDetail(
                    rs.getInt("orderId"),
                    rs.getString("username"),
                    rs.getString("fullName"),
                    rs.getString("roleName"),
                    rs.getDate("orderDate"),
                    rs.getFloat("totalMoney"),
                    courses
                );
            }
            courses.add(new CourseDetail(
                rs.getString("courseName"),
                rs.getFloat("price")
            ));
        }
    } catch (SQLException e) {
        System.out.println("Error: " + e.getMessage());
    } finally {
        try {
            if (rs != null) rs.close();
            if (stm != null) stm.close();
        } catch (SQLException e) {
            System.out.println("Error closing resources: " + e.getMessage());
        }
    }
    return orderDetail;
}


}
