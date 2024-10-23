/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class Comment {
    private int comment_id;
    private int account_id;
    private int lesson_id;
    private String comment;
    private String comment_date;
    private int status;
    private String fullname;
    private String avatar;
    private String role_name;

    public Comment() {
    }

    public Comment(int comment_id, int account_id, int lesson_id, String comment, String comment_date, int status, String fullname, String avatar, String role_name) {
        this.comment_id = comment_id;
        this.account_id = account_id;
        this.lesson_id = lesson_id;
        this.comment = comment;
        this.comment_date = comment_date;
        this.status = status;
        this.fullname = fullname;
        this.avatar = avatar;
        this.role_name = role_name;
    }

    public int getComment_id() {
        return comment_id;
    }

    public void setComment_id(int comment_id) {
        this.comment_id = comment_id;
    }

    public int getAccount_id() {
        return account_id;
    }

    public void setAccount_id(int account_id) {
        this.account_id = account_id;
    }

    public int getLesson_id() {
        return lesson_id;
    }

    public void setLesson_id(int lesson_id) {
        this.lesson_id = lesson_id;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getComment_date() {
        return comment_date;
    }

    public void setComment_date(String comment_date) {
        this.comment_date = comment_date;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getRole_name() {
        return role_name;
    }

    public void setRole_name(String role_name) {
        this.role_name = role_name;
    }

    
}
