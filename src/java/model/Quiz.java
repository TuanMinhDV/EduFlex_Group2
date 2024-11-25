/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author dungm
 */
public class Quiz {
    private int quiz_id;
    private String name;
    private int chapter_id;
    private int numOfQues;
    private int isDisable;
    
    public Quiz(String name, int chapter_id) {
        this.name = name;
        this.chapter_id = chapter_id;
    }

    public Quiz(int quiz_id, String name, int chapter_id, int numOfQues) {
        this.quiz_id = quiz_id;
        this.name = name;
        this.chapter_id = chapter_id;
        this.numOfQues = numOfQues;
    }

    public Quiz(int quiz_id, String name) {
        this.quiz_id = quiz_id;
        this.name = name;
    }

    public int getQuiz_id() {
        return quiz_id;
    }

    public void setQuiz_id(int quiz_id) {
        this.quiz_id = quiz_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getChapter_id() {
        return chapter_id;
    }

    public void setChapter_id(int chapter_id) {
        this.chapter_id = chapter_id;
    }

    public int getNumOfQues() {
        return numOfQues;
    }

    public void setNumOfQues(int numOfQues) {
        this.numOfQues = numOfQues;
    }

    public int getIsDisable() {
        return isDisable;
    }

    public void setIsDisable(int isDisable) {
        this.isDisable = isDisable;
    }
}
