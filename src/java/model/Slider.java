/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class Slider {
    private int id;
    private String image;
    private String title;
    private int status;
    private String link;
    private int marketer_id;
    private String type;
    private String endtime;
    private String description;
    private String fullname;

    public Slider() {
    }

    public Slider(int id, String image, String title, int status, String link, int marketer_id, String type, String endtime, String description, String fullname) {
        this.id = id;
        this.image = image;
        this.title = title;
        this.status = status;
        this.link = link;
        this.marketer_id = marketer_id;
        this.type = type;
        this.endtime = endtime;
        this.description = description;
        this.fullname = fullname;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public int getMarketer_id() {
        return marketer_id;
    }

    public void setMarketer_id(int marketer_id) {
        this.marketer_id = marketer_id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getEndtime() {
        return endtime;
    }

    public void setEndtime(String endtime) {
        this.endtime = endtime;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    @Override
    public String toString() {
        return "Slider{" + "id=" + id + ", image=" + image + ", title=" + title + ", status=" + status + ", link=" + link + ", marketer_id=" + marketer_id + ", type=" + type + ", endtime=" + endtime + ", description=" + description + ", fullname=" + fullname + '}';
    }
    
    
}
