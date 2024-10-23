package model;

public class OrderDetail {

    private String id;
    private String order_id;
    private String subject_id;
    private double price;
    private float total;
    private float subtotal;
    private String customerId;
    private String customerName;
    private String orderId;
    private String subjectId;
    private String subjectName; 
    private String subjectImage; 

    public OrderDetail(String orderId, String subjectId, double price) {
        this.orderId = orderId;
        this.subjectId = subjectId;
        this.price = price;
    }

    // Thêm getter và setter cho subjectName
    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    // Thêm getter và setter cho subjectImage
    public String getSubjectImage() {
        return subjectImage;
    }

    public void setSubjectImage(String subjectImage) {
        this.subjectImage = subjectImage;
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



    public OrderDetail() {
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

    public String getSubject_id() {
        return subject_id;
    }

    public void setSubject_id(String subject_id) {
        this.subject_id = subject_id;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setSubtotal(float subtotal) {
        this.subtotal = subtotal;
    }

    public OrderDetail(String id, String order_id, String subject_id, double price) {
        this.id = id;
        this.order_id = order_id;
        this.subject_id = subject_id;
        this.price = price;
    }

    public OrderDetail(String subtotal, String total) {
        this.subtotal = Float.parseFloat(subtotal);
        this.total = Float.parseFloat(total);
    }

    public String getSubtotal() {
        return String.format("%.2f", subtotal);
    }

    public String getTotal() {
        return String.format("%.2f", total);
    }
}
