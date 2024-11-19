
package model;


import java.util.Date;

public class Comment {
    private int commentId;
    private int accountId;
    private String accountName;
    private int lessonId;
    private String lessonName;
    private String comment;
    private Date commentDate;
    private String status;
    private Date reportDate;
    private String cause;

    // Constructor
    public Comment(int commentId, int accountId, String accountName, int lessonId, 
                   String lessonName, String comment, Date commentDate, 
                   String status, Date reportDate, String cause) {
        this.commentId = commentId;
        this.accountId = accountId;
        this.accountName = accountName;
        this.lessonId = lessonId;
        this.lessonName = lessonName;
        this.comment = comment;
        this.commentDate = commentDate;
        this.status = status;
        this.reportDate = reportDate;
        this.cause = cause;
    }

    // Getter and Setter methods
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

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public int getLessonId() {
        return lessonId;
    }

    public void setLessonId(int lessonId) {
        this.lessonId = lessonId;
    }

    public String getLessonName() {
        return lessonName;
    }

    public void setLessonName(String lessonName) {
        this.lessonName = lessonName;
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

    public Date getReportDate() {
        return reportDate;
    }

    public void setReportDate(Date reportDate) {
        this.reportDate = reportDate;
    }

    public String getCause() {
        return cause;
    }

    public void setCause(String cause) {
        this.cause = cause;
    }

    // ToString method to display the comment object information
    @Override
    public String toString() {
        return "Comment{" +
               "commentId=" + commentId +
               ", accountId=" + accountId +
               ", accountName='" + accountName + '\'' +
               ", lessonId=" + lessonId +
               ", lessonName='" + lessonName + '\'' +
               ", comment='" + comment + '\'' +
               ", commentDate=" + commentDate +
               ", status='" + status + '\'' +
               ", reportDate=" + reportDate +
               ", cause='" + cause + '\'' +
               '}';
    }
}
