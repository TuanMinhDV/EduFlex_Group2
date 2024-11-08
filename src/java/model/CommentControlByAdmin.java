package model;

import java.util.Date;

public class CommentControlByAdmin {
    
    // Define attributes
    private int commentId;
    private int accountId;
    private int lessonId;
    private String comment;
    private Date commentDate;
    private String status;
    private String cause;
    private Date reportDate;

    // Constructor
    public CommentControlByAdmin(int commentId, int accountId, int lessonId, String comment, 
            Date commentDate, String status, String cause, Date reportDate) {
        this.commentId = commentId;
        this.accountId = accountId;
        this.lessonId = lessonId;
        this.comment = comment;
        this.commentDate = commentDate;
        this.status = status;
        this.cause = cause;
        this.reportDate = reportDate;
    }

    // Getters and Setters
    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public int getLessonId() {
        return lessonId;
    }

    public void setLessonId(int lessonId) {
        this.lessonId = lessonId;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Date getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(Date commentDate) {
        this.commentDate = commentDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCause() {
        return cause;
    }

    public void setCause(String cause) {
        this.cause = cause;
    }

    public Date getReportDate() {
        return reportDate;
    }

    public void setReportDate(Date reportDate) {
        this.reportDate = reportDate;
    }

    // Methods for admin control
    public void approveComment() {
        this.status = "Approved";
    }

    public void rejectComment(String cause) {
        this.status = "Rejected";
        this.cause = cause;
    }

    public void reportComment(String cause) {
        this.status = "Reported";
        this.cause = cause;
        this.reportDate = new Date(); // Set report date to current date
    }

    public void resetReport() {
        this.status = "Active";
        this.cause = null;
        this.reportDate = null;
    }

    @Override
    public String toString() {
        return "CommentControlByAdmin{" +
                "commentId=" + commentId +
                ", accountId=" + accountId +
                ", lessonId=" + lessonId +
                ", comment='" + comment + '\'' +
                ", commentDate=" + commentDate +
                ", status='" + status + '\'' +
                ", cause='" + cause + '\'' +
                ", reportDate=" + reportDate +
                '}';
    }
}
