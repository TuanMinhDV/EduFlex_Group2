package dto;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;
import model.Account;
import model.Cart;
import model.CartItem;
import model.Order;
import model.OrderDetail;
import model.OrderCourse;

public class RegistrationDAO extends DBContext {

    public List<OrderCourse> getAll() {
        PreparedStatement ps;
        ResultSet rs;
        List<OrderCourse> list = new ArrayList<>();
        String sql = "SELECT * FROM Course ";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                byte[] imageData = null;
                String base64Image = "";
                if (rs.getString("image") != null) {
                    imageData = rs.getBytes("image");
                    base64Image = new String(Base64.getEncoder().encode(imageData));
                }
                OrderCourse sub = new OrderCourse(rs.getInt("course_id"),
                        rs.getString("course_name"),
                        base64Image,
                        rs.getDouble("price"));
                list.add(sub);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public OrderCourse getCoursebyId(int course_id) {
        String sql = "SELECT * FROM Course WHERE course_id = ?";
        PreparedStatement ps;
        ResultSet rs;
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, course_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                byte[] imageData = null;
                String base64Image = "";
                if (rs.getString("image") != null) {
                    imageData = rs.getBytes("image");
                    base64Image = new String(Base64.getEncoder().encode(imageData));
                }
                OrderCourse sub = new OrderCourse(rs.getInt("course_id"),
                        rs.getString("course_name"),
                        base64Image,
                        rs.getDouble("price"));
                sub.setDiscount(rs.getDouble("discount"));
                return sub;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public OrderCourse addOrderCourse(Account a, Cart cart, double subtotal) {
        try {
            String sql = "INSERT into [Order] values(?,?,?)";
            PreparedStatement ps;
            int orderId = -1;
            Date currentDate = new Date(Calendar.getInstance().getTime().getTime());
            ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            
            ps.setInt(1, a.getAccount_id());
            ps.setDate(2, currentDate);
            ps.setDouble(3, subtotal);
            ps.executeUpdate();
            
            ResultSet generatedKeys = ps.getGeneratedKeys();
            if (generatedKeys.next()) {
                orderId = generatedKeys.getInt(1);
            }

            String sql2 = "INSERT into Order_Detail values(?,?,?)";
            PreparedStatement ps2 = connection.prepareStatement(sql2);

            for (CartItem i : cart.getItems()) {
                ps2.setInt(1, orderId);
                ps2.setInt(2, i.getOrderCourse().getCourse_id());
                ps2.setDouble(3, i.getPrice());
                ps2.executeUpdate();
            }
            connection.commit();
            connection.setAutoCommit(true);
            
            String sql3 = "SELECT od.course_id FROM [Order] o "
                    + "INNER JOIN Order_Detail od "
                    + "ON o.order_id = od.order_id "
                    + "WHERE o.order_id = ?";
            PreparedStatement ps3 = connection.prepareStatement(sql3);
            ps3.setInt(1, orderId);
            ResultSet resultsset3 = ps3.executeQuery();
            String sql4 = "INSERT INTO Learner_Course (learner_id, course_id, enrolled_date, end_date, active, status, rate) "
                    + "VALUES (?, ?, ?, ?, ?, 0, 0)";
            PreparedStatement ps4 = connection.prepareStatement(sql4);

            while (resultsset3.next()) {
                int learner_id = a.getAccount_id();
                int course_id = resultsset3.getInt("course_id");
                Date enroll_date = currentDate;
                Date end_date = calculateOneYearFromDate(enroll_date);

                ps4.setInt(1, learner_id);
                ps4.setInt(2, course_id);
                ps4.setDate(3, enroll_date);
                ps4.setDate(4, end_date);
                ps4.setBoolean(5, true);
                ps4.executeUpdate();
            }
            connection.commit();
            connection.setAutoCommit(true);     
        } catch (SQLException e) {
            try {
                connection.rollback();
            } catch (SQLException e2) {
            }
            System.out.println(e);
        }

        return null;
    }

    private Date calculateOneYearFromDate(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.YEAR, 1);
        return new Date(calendar.getTime().getTime());
    }

    //Cancel
    public List<Order> getOrdersByLecturerId(int lecturerId) {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT o.order_date, COUNT(DISTINCT o.order_id) AS total_orders, SUM(o.total_money) AS total_money\n"
                + "FROM [Order] o\n"
                + "JOIN Order_Detail od ON o.order_id = od.order_id\n"
                + "JOIN Subject s ON od.subject_id = s.subject_id\n"
                + "WHERE s.instructor_id = ?\n"
                + "GROUP BY o.order_date;";
        try (
                PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, lecturerId); // Truyền giá trị của lecturerId vào câu lệnh SQL
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Date orderDate = rs.getDate("order_date");
                    double totalMoney = rs.getDouble("total_money");

                    Order order = new Order(orderDate, totalMoney);
                    orders.add(order);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error retrieving orders: " + e.getMessage());
        }
        return orders;
    }

    public static void main(String[] args) {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
         Date currentDate = new Date(Calendar.getInstance().getTime().getTime());
        System.out.println(currentDate);
    }
}
