
package model;

public class CourseControlByAdmin {
    private int courseId;
    private String courseName;
    private String description;
    private double price;

    // Constructor
    public CourseControlByAdmin(int courseId, String courseName, String description, double price) {
        this.courseId = courseId;
        this.courseName = courseName;
        this.description = description;
        this.price = price;
    }

    // Getters and Setters
    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    // Override toString() for debugging purposes
    @Override
    public String toString() {
        return "CourseControlByAdmin{" +
                "courseId=" + courseId +
                ", courseName='" + courseName + '\'' +
                ", description='" + description + '\'' +
                ", price=" + price +
                '}';
    }
}
