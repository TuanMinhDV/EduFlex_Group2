package model;

public class ModelControlByAdmin {
    
    private int lessonId;
    private String lessonName;
    
    // Constructor không tham số
    public ModelControlByAdmin() {
    }
    
    // Constructor có tham số
    public ModelControlByAdmin(int lessonId, String lessonName) {
        this.lessonId = lessonId;
        this.lessonName = lessonName;
    }

    // Getter và Setter cho lessonId
    public int getLessonId() {
        return lessonId;
    }

    public void setLessonId(int lessonId) {
        this.lessonId = lessonId;
    }

    // Getter và Setter cho lessonName
    public String getLessonName() {
        return lessonName;
    }

    public void setLessonName(String lessonName) {
        this.lessonName = lessonName;
    }

    // Override phương thức toString() để in đối tượng
    @Override
    public String toString() {
        return "ModelControlByAdmin{" +
                "lessonId=" + lessonId +
                ", lessonName='" + lessonName + '\'' +
                '}';
    }
}
