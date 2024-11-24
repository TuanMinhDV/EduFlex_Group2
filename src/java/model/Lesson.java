/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author dungm
 */
public class Lesson {
    private int id;
    private String name;
    private String video;
    private String document;
    private String description;
    private int chapter_id;
    private int isDisable;

    public Lesson() {
    }

    
    
    public Lesson(String name, String video, String document, String description, int chapter_id) {
        this.name = name;
        this.video = video;
        this.document = document;
        this.description = description;
        this.chapter_id = chapter_id;
    }

    public Lesson(int id, String name, String video, String document, String description, int chapter_id, int isDisable) {
        this.id = id;
        this.name = name;
        this.video = video;
        this.document = document;
        this.description = description;
        this.chapter_id = chapter_id;
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

    public String getVideo() {
        return video;
    }

    public void setVideo(String video) {
        this.video = video;
    }

    public String getDocument() {
        return document;
    }

    public void setDocument(String document) {
        this.document = document;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getChapter_id() {
        return chapter_id;
    }

    public void setChapter_id(int chapter_id) {
        this.chapter_id = chapter_id;
    }

    public int getIsDisable() {
        return isDisable;
    }

    public void setIsDisable(int isDisable) {
        this.isDisable = isDisable;
    }
    
}
