package model;

public class SubjectControlByAdmin {
    private int categoryId;
    private String categoryName;
    private int totalCourses;

    // Constructor
    public SubjectControlByAdmin(int categoryId, String categoryName, int totalCourses) {
        this.categoryId = categoryId;
        this.categoryName = categoryName;
        this.totalCourses = totalCourses;
    }

    // Getters and Setters
    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public int getTotalCourses() {
        return totalCourses;
    }

    public void setTotalCourses(int totalCourses) {
        this.totalCourses = totalCourses;
    }

    // toString method for easy debugging
    @Override
    public String toString() {
        return "SubjectControlByAdmin{" +
                "categoryId=" + categoryId +
                ", categoryName='" + categoryName + '\'' +
                ", totalCourses=" + totalCourses +
                '}';
    }
}
