package dto;

import java.sql.*;
import java.util.ArrayList;
import model.CategoryControlByAdmin;
import model.CourseControlByAdmin;

public class CourseControllerByAdminDAO extends DBContext {

    private PreparedStatement stm;
    private ResultSet rs;

    // Method to retrieve all courses
    public ArrayList<CourseControlByAdmin> getAllCourses() {
        ArrayList<CourseControlByAdmin> courses = new ArrayList<>();
        try {
            String sql = "SELECT course_id, course_name, description, price FROM Course WHERE isDisable = 0 OR isDisable IS NULL";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();

            while (rs.next()) {
                int courseId = rs.getInt("course_id");
                String courseName = rs.getString("course_name");
                String description = rs.getString("description");
                double price = rs.getDouble("price");

                CourseControlByAdmin course = new CourseControlByAdmin(courseId, courseName, description, price);
                courses.add(course);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return courses;
    }

    public boolean addCategoryToCourse(int courseId, int categoryId) {
        try {
            String sql = "INSERT INTO Course_Category (course_id, category_id) VALUES (?, ?)";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, courseId);
            stm.setInt(2, categoryId);

            return stm.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public ArrayList<CategoryControlByAdmin> getCategories(int courseId) {
        ArrayList<CategoryControlByAdmin> categories = new ArrayList<>();

        try {
            String sql = "SELECT category_id, category_name FROM Category "
                    + "WHERE category_id NOT IN (SELECT category_id FROM Course_Category WHERE course_id = ?)";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, courseId);  // Gán courseId vào truy vấn
            rs = stm.executeQuery();

            while (rs.next()) {
                int categoryId = rs.getInt("category_id");
                String categoryName = rs.getString("category_name");
                CategoryControlByAdmin category = new CategoryControlByAdmin(categoryId, categoryName);
                categories.add(category);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return categories;
    }

    public ArrayList<CourseControlByAdmin> getCoursesWithPaginationAndSearch(String searchKeyword, int page, int pageSize) {
    ArrayList<CourseControlByAdmin> courses = new ArrayList<>();
    try {
        String sql = "SELECT course_id, course_name, description, price FROM Course "
                   + "WHERE (isDisable = 0 OR isDisable IS NULL) "
                   + "AND (course_name LIKE ? OR description LIKE ?) "
                   + "ORDER BY course_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY"; // Sử dụng OFFSET và FETCH NEXT
        stm = connection.prepareStatement(sql);
        stm.setString(1, "%" + searchKeyword + "%");
        stm.setString(2, "%" + searchKeyword + "%");
        stm.setInt(3, (page - 1) * pageSize); // OFFSET
        stm.setInt(4, pageSize); // FETCH NEXT
        rs = stm.executeQuery();

        while (rs.next()) {
            int courseId = rs.getInt("course_id");
            String courseName = rs.getString("course_name");
            String description = rs.getString("description");
            double price = rs.getDouble("price");

            CourseControlByAdmin course = new CourseControlByAdmin(courseId, courseName, description, price);
            courses.add(course);
        }
    } catch (SQLException e) {
        System.out.println(e.getMessage());
    }
    return courses;
}


// Method to get total count for pagination
    public int getTotalCourseCount(String searchKeyword) {
        int count = 0;
        try {
            String sql = "SELECT COUNT(*) FROM Course WHERE (isDisable = 0 OR isDisable IS NULL) "
                    + "AND (course_name LIKE ? OR description LIKE ?)";
            stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + searchKeyword + "%");
            stm.setString(2, "%" + searchKeyword + "%");
            rs = stm.executeQuery();

            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return count;
    }

  public int getTotalCourse() {
    int totalCourses = 0;
    
    try {
        String sql = "SELECT COUNT(*) AS total FROM Course WHERE isDisable = 0 OR isDisable IS NULL";
        stm = connection.prepareStatement(sql);
        rs = stm.executeQuery();
        
        if (rs.next()) {
            totalCourses = rs.getInt("total");
        }
    } catch (SQLException e) {
        System.out.println("Error in getTotalCourse: " + e.getMessage());
    } 
    
    return totalCourses;
}

 

    
    
}


   