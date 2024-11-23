/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class Learner_Course {

    private int id;
    private int learner_id;
    private int course_id;
    private String enrolled_date;
    private String end_date;
    private int active;
    private int status;
    private int account_id;
    private String fullname;
    private String course_name;
    private String image;
    private String description;
    private int instructor_id;
    private String instructor_name;
    private int category_id;
    private String enroll_date;
    private float rate;

    public Learner_Course() {
    }

    public Learner_Course(int id, int learner_id, int course_id, String enrolled_date, String end_date, int active, int status, int account_id, String fullname, String course_name, String image, String description, int instructor_id, String instructor_name, int category_id, String enroll_date, float rate) {
        this.id = id;
        this.learner_id = learner_id;
        this.course_id = course_id;
        this.enrolled_date = enrolled_date;
        this.end_date = end_date;
        this.active = active;
        this.status = status;
        this.account_id = account_id;
        this.fullname = fullname;
        this.course_name = course_name;
        this.image = image;
        this.description = description;
        this.instructor_id = instructor_id;
        this.instructor_name = instructor_name;
        this.category_id = category_id;
        this.enroll_date = enroll_date;
        this.rate = rate;
    }

    public Learner_Course(int id, int learner_id, int course_id, String enrolled_date, String end_date, int active, int status, 
            int account_id, String fullname, String course_name, String image, int instructor_id, String instructor_name, 
            int category_id, String enroll_date, float rate) {
        this.id = id;
        this.learner_id = learner_id;
        this.course_id = course_id;
        this.enrolled_date = enrolled_date;
        this.end_date = end_date;
        this.active = active;
        this.status = status;
        this.account_id = account_id;
        this.fullname = fullname;
        this.course_name = course_name;
        this.image = image;
        this.instructor_id = instructor_id;
        this.instructor_name = instructor_name;
        this.category_id = category_id;
        this.enroll_date = enroll_date;
        this.rate = rate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getLearner_id() {
        return learner_id;
    }

    public void setLearner_id(int learner_id) {
        this.learner_id = learner_id;
    }

    public int getCourse_id() {
        return course_id;
    }

    public void setCourse_id(int course_id) {
        this.course_id = course_id;
    }

    public String getEnrolled_date() {
        return enrolled_date;
    }

    public void setEnrolled_date(String enrolled_date) {
        this.enrolled_date = enrolled_date;
    }

    public String getEnd_date() {
        return end_date;
    }

    public void setEnd_date(String end_date) {
        this.end_date = end_date;
    }

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getAccount_id() {
        return account_id;
    }

    public void setAccount_id(int account_id) {
        this.account_id = account_id;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public String getEnroll_date() {
        return enroll_date;
    }

    public void setEnroll_date(String enroll_date) {
        this.enroll_date = enroll_date;
    }

    public float getRate() {
        return rate;
    }

    public void setRate(float rate) {
        this.rate = rate;
    }

    @Override
    public String toString() {
        return "Learner_Course{" + "id=" + id + 
                ", learner_id=" + learner_id + 
                ", course_id=" + course_id + 
                ", enrolled_date=" + enrolled_date + 
                ", end_date=" + end_date + 
                ", active=" + active + 
                ", status=" + status + 
                ", account_id=" + account_id + 
                ", fullname=" + fullname + 
                ", course_name=" + course_name + 
                ", instructor_id=" + instructor_id + 
                ", instructor_name=" + instructor_name + 
                ", rate="+ rate + "}\n";
    }
    
    

}
