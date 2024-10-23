/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class OrderCourse {

    private int course_id;
    private String course_name;
    private String image;
    private double price;
    private int category_id;
    private double discount;

    public OrderCourse(int course_id, String course_name, String image, double price, int category_id, double discount) {
        this.course_id = course_id;
        this.course_name = course_name;
        this.image = image;
        this.price = price;
        this.category_id = category_id;
        this.discount = discount;
    }

    public OrderCourse(int course_id, String course_name, String image, double price, int category_id) {
        this.course_id = course_id;
        this.course_name = course_name;
        this.image = image;
        this.price = price;
        this.category_id = category_id;
    }

    public OrderCourse() {
    }

    public OrderCourse(int course_id, String course_name, String image, double price) {
        this.course_id = course_id;
        this.course_name = course_name;
        this.image = image;
        this.price = price;
    }

    public int getCourse_id() {
        return course_id;
    }

    public void setCourse_id(int course_id) {
        this.course_id = course_id;
    }

    public String getCourse_name() {
        return course_name;
    }

    public void setCourse_name(String course_name) {
        this.course_name = course_name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
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

   

}
