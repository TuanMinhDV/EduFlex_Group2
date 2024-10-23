/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class Lesson {
    private int lesson_id;
    private int lesson_no;
    private String lesson_name;
    private String video;
    private String document;
    private String description;
    private int chapter_id;

    public Lesson() {
    }

    public Lesson(int lesson_id, int lesson_no, String lesson_name, String video, String document, String description, int chapter_id) {
        this.lesson_id = lesson_id;
        this.lesson_no = lesson_no;
        this.lesson_name = lesson_name;
        this.video = video;
        this.document = document;
        this.description = description;
        this.chapter_id = chapter_id;
    }
    public Lesson(int lesson_id, int lesson_no, String lesson_name, String video, String document, int chapter_id, String description) {
        this.lesson_id = lesson_id;
        this.lesson_no = lesson_no;
        this.lesson_name = lesson_name;
        this.video = video;
        this.document = document;
        this.chapter_id = chapter_id;
        this.description = description;
    }

    public int getLesson_id() {
        return lesson_id;
    }

    public void setLesson_id(int lesson_id) {
        this.lesson_id = lesson_id;
    }

    public int getLesson_no() {
        return lesson_no;
    }

    public void setLesson_no(int lesson_no) {
        this.lesson_no = lesson_no;
    }

    public String getLesson_name() {
        return lesson_name;
    }

    public void setLesson_name(String lesson_name) {
        this.lesson_name = lesson_name;
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

    
        
}
