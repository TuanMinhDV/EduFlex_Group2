package model;

import java.util.Date;

public class Order {

    private int orderId;
    private int accountId;
    private Date orderDate;
    private double total_money;

    public Order(int orderId, int accountId, Date orderDate, double total_money) {
        this.orderId = orderId;
        this.accountId = accountId;
        this.orderDate = orderDate;
        this.total_money = total_money;
    }

    public Order() {
    }

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

    public double getTotal_money() {
        return total_money;
    }

    public void setTotal_money(double total_money) {
        this.total_money = total_money;
    }

    public Order(Date orderDate, double total_money) {
        this.orderDate = orderDate;
        this.total_money = total_money;
    }

}
