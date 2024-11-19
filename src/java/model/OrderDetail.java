package model;

public class OrderDetail {

    private String id;
    private String order_id;
    private String course_id;
    private double price;
    private float total;
    private float subtotal;
    private String customerId;
    private String customerName;
    private String orderId;
    private String courseName; 
    private String courseImage; 

    public OrderDetail(String orderId, String course_id, double price) {
        this.orderId = orderId;
        this.course_id = course_id;
        this.price = price;
    }

    public OrderDetail() {
    }

    public OrderDetail(String id, String order_id, String course_id, double price) {
        this.id = id;
        this.order_id = order_id;
        this.course_id = course_id;
        this.price = price;
    }
    public OrderDetail(String subtotal, String total) {
        this.subtotal = Float.parseFloat(subtotal);
        this.total = Float.parseFloat(total);
    }

    @Override
    public String toString() {
        return "OrderDetail{" + "id=" + id + ", order_id=" + order_id + ", course_id=" + course_id + ", price=" + price + ", total=" + total + ", subtotal=" + subtotal + ", customerId=" + customerId + ", customerName=" + customerName + ", orderId=" + orderId + ", courseName=" + courseName + ", courseImage=" + courseImage + '}';
    }
    

    public String getSubtotal() {
        return String.format("%.2f", subtotal);
    }

    public String getTotal() {
        return String.format("%.2f", total);
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getOrder_id() {
        return order_id;
    }

    public void setOrder_id(String order_id) {
        this.order_id = order_id;
    }

    public String getCourse_id() {
        return course_id;
    }

    public void setCourse_id(String course_id) {
        this.course_id = course_id;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }


    public void setTotal(float total) {
        this.total = total;
    }

   
    public void setSubtotal(float subtotal) {
        this.subtotal = subtotal;
    }

    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getCourseImage() {
        return courseImage;
    }

    public void setCourseImage(String courseImage) {
        this.courseImage = courseImage;
    }
}
