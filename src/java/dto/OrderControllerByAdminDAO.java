package dto;

import java.sql.*;
import java.util.ArrayList;
import model.AccountControlByAdmin;
import model.OrderControlByAdmin;
import model.OrderDetailControlByAdmin;

public class OrderControllerByAdminDAO extends DBContext {

    PreparedStatement stm;
    ResultSet rs;

    public ArrayList<OrderControlByAdmin> getOrderList(String startDate, String endDate, Double minMoney, Double maxMoney, int page, int pageSize) {
        ArrayList<OrderControlByAdmin> orderList = new ArrayList<>();
        try {
            String sql = "SELECT o.order_id, a.username, o.order_date, o.total_money "
                    + "FROM [Order] o "
                    + "JOIN [Account] a ON o.account_id = a.account_id "
                    + "WHERE 1=1";
            if (startDate != null && !startDate.isEmpty()) {
                sql += " AND o.order_date >= ?";
            }
            if (endDate != null && !endDate.isEmpty()) {
                sql += " AND o.order_date <= ?";
            }
            if (minMoney != null) {
                sql += " AND o.total_money >= ?";
            }
            if (maxMoney != null) {
                sql += " AND o.total_money <= ?";
            }
            sql += " ORDER BY o.order_date OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

            stm = connection.prepareStatement(sql);

            int index = 1;
            if (startDate != null && !startDate.isEmpty()) {
                stm.setString(index++, startDate);
            }
            if (endDate != null && !endDate.isEmpty()) {
                stm.setString(index++, endDate);
            }
            if (minMoney != null) {
                stm.setDouble(index++, minMoney);
            }
            if (maxMoney != null) {
                stm.setDouble(index++, maxMoney);
            }
            stm.setInt(index++, (page - 1) * pageSize);
            stm.setInt(index, pageSize);

            rs = stm.executeQuery();
            while (rs.next()) {
                OrderControlByAdmin order = new OrderControlByAdmin(
                        rs.getString("order_id"),
                        rs.getString("username"), // Lấy giá trị của username
                        rs.getString("order_date"),
                        rs.getDouble("total_money")
                );
                orderList.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return orderList;
    }

    public int getTotalOrders(String startDate, String endDate, Double minMoney, Double maxMoney) {
        int total = 0;
        try {
            String sql = "SELECT COUNT(*) FROM [Order] WHERE 1=1";
            if (startDate != null && !startDate.isEmpty()) {
                sql += " AND order_date >= ?";
            }
            if (endDate != null && !endDate.isEmpty()) {
                sql += " AND order_date <= ?";
            }
            if (minMoney != null) {
                sql += " AND total_money >= ?";
            }
            if (maxMoney != null) {
                sql += " AND total_money <= ?";
            }

            stm = connection.prepareStatement(sql);
            int index = 1;
            if (startDate != null && !startDate.isEmpty()) {
                stm.setString(index++, startDate);
            }
            if (endDate != null && !endDate.isEmpty()) {
                stm.setString(index++, endDate);
            }
            if (minMoney != null) {
                stm.setDouble(index++, minMoney);
            }
            if (maxMoney != null) {
                stm.setDouble(index++, maxMoney);
            }
            rs = stm.executeQuery();
            if (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return total;
    }

    public OrderDetailControlByAdmin getOrderDetail(int orderId) {
    OrderDetailControlByAdmin orderDetail = null;
    try {
        String sql = "SELECT o.[order_id], o.[account_id], o.[order_date], o.[total_money], "
                   + "od.[course_id], od.[price], c.[course_name], a.[username], a.[fullname], r.[role_name] "
                   + "FROM [Order] AS o "
                   + "JOIN [Order_Detail] AS od ON o.[order_id] = od.[order_id] "
                   + "JOIN [Course] AS c ON od.[course_id] = c.[course_id] "
                   + "JOIN [Account] AS a ON o.[account_id] = a.[account_id] " // Đổi từ User thành Account
                   + "JOIN [Role] AS r ON a.[role_id] = r.[role_id] "
                   + "WHERE o.[order_id] = ?";

        stm = connection.prepareStatement(sql);
        stm.setInt(1, orderId);

        rs = stm.executeQuery();
        if (rs.next()) {
            orderDetail = new OrderDetailControlByAdmin(
                    rs.getInt("order_id"),
                    rs.getInt("account_id"),
                    rs.getDate("order_date"),
                    rs.getDouble("total_money"),
                    rs.getInt("course_id"),
                    rs.getDouble("price"),
                    rs.getString("course_name"),
                    rs.getString("username"),
                    rs.getString("fullname"),
                    rs.getString("role_name") // Lấy role_name thay vì role_id
            );
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    return orderDetail;
}



    public AccountControlByAdmin getAccountById(int accountId) {
        AccountControlByAdmin account = null;
        try {
            String sql = "SELECT A.account_id, A.username, A.fullname, A.email, A.phone, A.otp, R.role_name, A.active AS status "
                    + "FROM Account AS A JOIN Role AS R ON A.role_id = R.role_id WHERE A.account_id = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, accountId);
            rs = stm.executeQuery();

            if (rs.next()) {
                account = new AccountControlByAdmin(
                        rs.getInt("account_id"),
                        rs.getString("username"),
                        rs.getString("fullname"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getString("otp"),
                        rs.getString("role_name"),
                        rs.getBoolean("status")
                );
            }
        } catch (SQLException e) {
            System.out.println("Error in getAccountById: " + e.getMessage());
        } finally {
            closeResources();
        }
        return account;
    }

    private void closeResources() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
        } catch (SQLException ex) {
            System.out.println("Error closing resources: " + ex.getMessage());
        }
    }

    public String getUserNameByAccountId(int accountId) {
        String username = null;
        try {
            String sql = "SELECT username FROM Account WHERE account_id = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, accountId);
            rs = stm.executeQuery();

            if (rs.next()) {
                username = rs.getString("username");
            }
        } catch (SQLException e) {
            System.out.println("Error in getUserNameByAccountId: " + e.getMessage());
        } finally {
            closeResources();
        }
        return username;
    }

    
    
}
