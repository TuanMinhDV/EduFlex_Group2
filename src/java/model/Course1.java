/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class Course1 {

    private int course_id;
    private String course_name;
    private String description;
    private String image;
    private float price;
    private float discount;
    private int sold;
    private String created_date;
    private String updated_date;
    private int instructor_id;
    private String instructor_name;
    private int category_id;
    private String category_name;
    private double rate_course;
    private int chapter_num;
    private int lesson_num;
    private int isDisable;

    public int getIsDisable() {
        return isDisable;
    }

    public void setIsDisable(int isDisable) {
        this.isDisable = isDisable;
    }

    public Course1() {
    }

    public Course1(int course_id, String course_name, String description, String image, float price, float discount, int sold, String created_date, String updated_date, int instructor_id, String instructor_name, double rate_course, int chapter_num, int lesson_num) {
        this.course_id = course_id;
        this.course_name = course_name;
        this.description = description;
        this.image = image;
        this.price = price;
        this.discount = discount;
        this.sold = sold;
        this.created_date = created_date;
        this.updated_date = updated_date;
        this.instructor_id = instructor_id;
        this.instructor_name = instructor_name;
        this.rate_course = rate_course;
        this.chapter_num = chapter_num;
        this.lesson_num = lesson_num;
    }
    public Course1(int course_id, String course_name, String description, String image, float price, float discount, int sold, String created_date, String updated_date, int instructor_id) {
        this.course_id = course_id;
        this.course_name = course_name;
        this.description = description;
        this.image = image;
        this.price = price;
        this.discount = discount;
        this.sold = sold;
        this.created_date = created_date;
        this.updated_date = updated_date;
        this.instructor_id = instructor_id;
    }
  
    public Course1(int course_id, String course_name, String description, String image, float price, float discount, int sold, String created_date, String updated_date, int instructor_id, String instructor_name, double rate_course, int chapter_num, int lesson_num, int isDisable) {
        this.course_id = course_id;
        this.course_name = course_name;
        this.description = description;
        this.image = image;
        this.price = price;
        this.discount = discount;
        this.sold = sold;
        this.created_date = created_date;
        this.updated_date = updated_date;
        this.instructor_id = instructor_id;
        this.instructor_name = instructor_name;
        this.rate_course = rate_course;
        this.chapter_num = chapter_num;
        this.lesson_num = lesson_num;
        this.isDisable = isDisable;
    }


   public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public String getCategory_name() {
        return category_name;
    }

    public void setCategory_name(String category_name) {
        this.category_name = category_name;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public float getDiscount() {
        return discount;
    }

    public void setDiscount(float discount) {
        this.discount = discount;
    }

    public int getSold() {
        return sold;
    }

    public void setSold(int sold) {
        this.sold = sold;
    }

    public String getCreated_date() {
        return created_date;
    }

    public void setCreated_date(String created_date) {
        this.created_date = created_date;
    }

    public String getUpdated_date() {
        return updated_date;
    }

    public void setUpdated_date(String updated_date) {
        this.updated_date = updated_date;
    }

    public int getInstructor_id() {
        return instructor_id;
    }

    public void setInstructor_id(int instructor_id) {
        this.instructor_id = instructor_id;
    }

    public String getInstructor_name() {
        return instructor_name;
    }

    public void setInstructor_name(String instructor_name) {
        this.instructor_name = instructor_name;
    }

    public double getRate_course() {
        return rate_course;
    }

    public void setRate_course(double rate_course) {
        this.rate_course = rate_course;
    }

    public int getChapter_num() {
        return chapter_num;
    }

    public void setChapter_num(int chapter_num) {
        this.chapter_num = chapter_num;
    }

    public int getLesson_num() {
        return lesson_num;
    }

    public void setLesson_num(int lesson_num) {
        this.lesson_num = lesson_num;
    }

    @Override
    public String toString() {
        return "Course{" + "course_id=" + course_id + 
                "\n course_name=" + course_name + 
                "\n description=" + description + 
                "\n image=" + image + 
                "\n price=" + price + 
                "\n discount=" + discount + 
                "\n sold=" + sold + 
                "\n created_date=" + created_date + 
                "\n updated_date=" + updated_date + 
                "\n instructor_id=" + instructor_id + 
                "\n instructor_name=" + instructor_name + 
                "\n category_id=" + category_id + 
                "\n category_name=" + category_name + 
                "\n rate_course=" + rate_course + 
                "\n chapter_num=" + chapter_num + 
                "\n lesson_num=" + lesson_num + 
                "\n isDisable=" + isDisable + '}';
    }


   
}
