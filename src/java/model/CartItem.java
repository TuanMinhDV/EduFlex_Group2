package model;

public class CartItem {

    private OrderCourse orderCourse;
    private double price;
    private Course course;
    private int category_id;
    private double discount;
    private int learnerId;

    public CartItem(OrderCourse orderCourse, double price, Course course, int category_id, double discount) {
        this.orderCourse = orderCourse;
        this.price = price;
        this.course = course;
        this.category_id = category_id;
        this.discount = discount;
    }

    public CartItem() {
    }

    public CartItem(Course course, double price) {
        this.course = course;
        this.price = price;
    }

    public CartItem(OrderCourse orderCourse,double price, int learnerId) {
        this.orderCourse = orderCourse;
        this.price = price;
        this.learnerId = learnerId;
    }
    
    public CartItem(OrderCourse orderCourse, double price) {
        this.orderCourse = orderCourse;
        this.price = price;
    }
    public CartItem(OrderCourse orderCourse, double price, Course course, int category_id) {
        this.orderCourse = orderCourse;
        this.price = price;
        this.course = course;
        this.category_id = category_id;
    }

    public int getLearnerId() {
        return learnerId;
    }

    public void setLearnerId(int learnerId) {
        this.learnerId = learnerId;
    }

    public OrderCourse getOrderCourse() {
        return orderCourse;
    }

    public void setOrderCourse(OrderCourse orderCourse) {
        this.orderCourse = orderCourse;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    @Override
    public String toString() {
        return "CartItem{" + "orderCourse=" + orderCourse + ", price=" + price + ", course=" + course + ", category_id=" + category_id + ", discount=" + discount + ", learnerId=" + learnerId + '}';
    }


    
}
