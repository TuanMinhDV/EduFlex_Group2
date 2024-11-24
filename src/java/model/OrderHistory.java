package model;

import java.util.Date; // Import thư viện Date cho orderDate

public class OrderHistory {
    private int orderId;        // ID của đơn hàng
    private int accountId;      // ID của tài khoản người đặt hàng
    private String accountName; // Tên tài khoản hoặc khách hàng
    private Date orderDate;     // Ngày đặt hàng
    private float totalMoney;   // Tổng tiền của đơn hàng

    // Constructor không tham số
    public OrderHistory() {
    }

    // Constructor có tham số
    public OrderHistory(int orderId, int accountId, String accountName, Date orderDate, float totalMoney) {
        this.orderId = orderId;
        this.accountId = accountId;
        this.accountName = accountName;
        this.orderDate = orderDate;
        this.totalMoney = totalMoney;
    }

    // Getter và Setter cho từng thuộc tính
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

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
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

    // Override phương thức toString để dễ in ra thông tin
    @Override
    public String toString() {
        return "OrderHistory{" +
                "orderId=" + orderId +
                ", accountId=" + accountId +
                ", accountName='" + accountName + '\'' +
                ", orderDate=" + orderDate +
                ", totalMoney=" + totalMoney +
                '}';
    }
}
