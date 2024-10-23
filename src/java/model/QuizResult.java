/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class QuizResult {
    private int id;
    private int learner_id;
    private int quiz_id;
    private float mark;
    private int status;

    public QuizResult() {
    }

    public QuizResult(int id, int learner_id, int quiz_id, float mark, int status) {
        this.id = id;
        this.learner_id = learner_id;
        this.quiz_id = quiz_id;
        this.mark = mark;
        this.status = status;
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

    public int getQuiz_id() {
        return quiz_id;
    }

    public void setQuiz_id(int quiz_id) {
        this.quiz_id = quiz_id;
    }

    public float getMark() {
        return mark;
    }

    public void setMark(float mark) {
        this.mark = mark;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "QuizResult{" + "id=" + id + ", learner_id=" + learner_id + ", quiz_id=" + quiz_id + ", mark=" + mark + ", status=" + status + '}';
    }
    
    
    
}
