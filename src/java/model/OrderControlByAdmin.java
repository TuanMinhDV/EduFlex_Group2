/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class OrderControlByAdmin {
    private String orderId;       // ID của đơn hàng
    private String accountId;     // ID của tài khoản
    private String orderDate;     // Ngày đặt hàng
    private double totalMoney;    // Tổng tiền của đơn hàng

    // Constructor
    public OrderControlByAdmin(String orderId, String accountId, String orderDate, double totalMoney) {
        this.orderId = orderId;
        this.accountId = accountId;
        this.orderDate = orderDate;
        this.totalMoney = totalMoney;
    }

    // Getter và Setter cho các thuộc tính
    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getAccountId() {
        return accountId;
    }

    public void setAccountId(String accountId) {
        this.accountId = accountId;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
    }

    // Phương thức toString để hiển thị thông tin đối tượng
    @Override
    public String toString() {
        return "OrderControlByAdmin{" +
                "orderId='" + orderId + '\'' +
                ", accountId='" + accountId + '\'' +
                ", orderDate='" + orderDate + '\'' +
                ", totalMoney=" + totalMoney +
                '}';
    }
}
