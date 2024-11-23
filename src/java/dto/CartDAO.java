/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.CartItem;
import model.Course;
import model.Course1;
import model.OrderCourse;

/**
 *
 * @author PC
 */
public class CartDAO extends DBContext {

    public List<CartItem> loadCart(int learner_id) {
        CourseDAO dao = new CourseDAO();
        List<CartItem> list = new ArrayList<>();
        String sql = "SELECT * FROM [CartItem]\n"
                + "WHERE [account_id] = ? ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, learner_id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                CartItem c_item = new CartItem();
                c_item.setLearnerId(learner_id);
                int course_id = rs.getInt("course_id");
                Course1 course = dao.getCourseByCourseId(course_id);
                c_item.setCourse(course);
                c_item.setDiscount(course.getDiscount());
                c_item.setPrice(course.getPrice());
                list.add(c_item);
            }
            return list;
        } catch (SQLException e) {
        }
        return null;
    }

    public void addCartItem(CartItem cartitem) {
        String sql = "INSERT into [CartItem]([account_id], [course_id])\n"
                + "values(?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, cartitem.getLearnerId());
            ps.setInt(2, cartitem.getOrderCourse().getCourse_id());

            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    public void deleteCartItem(CartItem cartitem){
        String sql = "DELETE FROM [CartItem] "
                + "WHERE account_id = ? "
                + "AND course_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, cartitem.getLearnerId());
            ps.setInt(2, cartitem.getOrderCourse().getCourse_id());

            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public static void main(String[] args) {
        CartDAO s = new CartDAO();
        List<CartItem> list = s.loadCart(2);
        System.out.println(list);
    }
}
