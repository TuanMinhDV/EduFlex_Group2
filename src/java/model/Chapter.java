/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author dungm
 */
public class Chapter {
    private int id;
    private String name;
    private int course_id;
    private int isDisable;

    public Chapter() {
    }

    public Chapter(int id, String name, int course_id, int isDisable) {
        this.id = id;
        this.name = name;
        this.course_id = course_id;
        this.isDisable = isDisable;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCourse_id() {
        return course_id;
    }

    public void setCourse_id(int course_id) {
        this.course_id = course_id;
    }

    public int getIsDisable() {
        return isDisable;
    }

    public void setIsDisable(int isDisable) {
        this.isDisable = isDisable;
    }
    
    
}
