/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class Comment_Report {
    private int report_id;
    private int comment_id;
    private int account_id;
    private String cause;
    private String report_date;

    public Comment_Report() {
    }

    public Comment_Report(int report_id, int comment_id, int account_id, String cause, String report_date) {
        this.report_id = report_id;
        this.comment_id = comment_id;
        this.account_id = account_id;
        this.cause = cause;
        this.report_date = report_date;
    }

    public int getReport_id() {
        return report_id;
    }

    public void setReport_id(int report_id) {
        this.report_id = report_id;
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

    public String getCause() {
        return cause;
    }

    public void setCause(String cause) {
        this.cause = cause;
    }

    public String getReport_date() {
        return report_date;
    }

    public void setReport_date(String report_date) {
        this.report_date = report_date;
    }
    
}
