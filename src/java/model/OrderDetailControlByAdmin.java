package model;

import java.util.Date;

public class OrderDetailControlByAdmin {
    
    // Fields
    private int orderId;
    private int accountId;
    private Date orderDate;
    private double totalMoney;
    private int courseId;
    private double price;
    
    // New Fields
    private String courseName;
    private String username;
    private String fullname;
    private String roleName; // Đổi từ roleId thành roleName
    
    // Constructor
    public OrderDetailControlByAdmin(int orderId, int accountId, Date orderDate, double totalMoney, int courseId, double price, String courseName, String username, String fullname, String roleName) {
        this.orderId = orderId;
        this.accountId = accountId;
        this.orderDate = orderDate;
        this.totalMoney = totalMoney;
        this.courseId = courseId;
        this.price = price;
        this.courseName = courseName;
        this.username = username;
        this.fullname = fullname;
        this.roleName = roleName; // Sử dụng roleName thay vì roleId
    }

    // Getters and Setters
    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    // New Getters and Setters for the added fields
    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getRoleName() { // Đổi thành getRoleName
        return roleName;
    }

    public void setRoleName(String roleName) { // Đổi thành setRoleName
        this.roleName = roleName;
    }

    // Methods to manage orders
    public void displayOrderDetails() {
        System.out.println("Order ID: " + orderId);
        System.out.println("Account ID: " + accountId);
        System.out.println("Order Date: " + orderDate);
        System.out.println("Total Money: " + totalMoney);
        System.out.println("Course ID: " + courseId);
        System.out.println("Course Name: " + courseName);
        System.out.println("Username: " + username);
        System.out.println("Full Name: " + fullname);
        System.out.println("Role Name: " + roleName); // Hiển thị roleName thay vì roleId
        System.out.println("Price: " + price);
    }
    
    // Additional methods for processing and modifying orders can be added here
}
