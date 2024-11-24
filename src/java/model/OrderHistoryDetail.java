package model;

import java.util.Date;
import java.util.List;

public class OrderHistoryDetail {
    private int orderId;           // ID của đơn hàng
    private String username;       // Tên người dùng
    private String fullName;       // Tên đầy đủ
    private String roleName;       // Vai trò (admin/user/etc.)
    private Date orderDate;        // Ngày đặt hàng
    private float totalMoney;      // Tổng tiền của đơn hàng
    private List<CourseDetail> courses; // Danh sách các khóa học

    // Constructor có danh sách khóa học
    public OrderHistoryDetail(int orderId, String username, String fullName, String roleName, 
                              Date orderDate, float totalMoney, List<CourseDetail> courses) {
        this.orderId = orderId;
        this.username = username;
        this.fullName = fullName;
        this.roleName = roleName;
        this.orderDate = orderDate;
        this.totalMoney = totalMoney;
        this.courses = courses;
    }

    // Getters và Setters
    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public float getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(float totalMoney) {
        this.totalMoney = totalMoney;
    }

    public List<CourseDetail> getCourses() {
        return courses;
    }

    public void setCourses(List<CourseDetail> courses) {
        this.courses = courses;
    }

    // Inner class cho CourseDetail
    public static class CourseDetail {
        private String courseName;
        private float price;

        public CourseDetail(String courseName, float price) {
            this.courseName = courseName;
            this.price = price;
        }

        public String getCourseName() {
            return courseName;
        }

        public void setCourseName(String courseName) {
            this.courseName = courseName;
        }

        public float getPrice() {
            return price;
        }

        public void setPrice(float price) {
            this.price = price;
        }
    }
}
