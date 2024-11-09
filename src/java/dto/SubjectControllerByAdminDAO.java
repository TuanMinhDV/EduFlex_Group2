package dto;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.CourseControlByAdmin;
import model.SubjectControlByAdmin;

public class SubjectControllerByAdminDAO extends DBContext {

    PreparedStatement stm;
    ResultSet rs;

    // Lấy danh sách Subject với phân trang
    public ArrayList<SubjectControlByAdmin> getListSubjectControlByAdmin(int offset, int recordsPerPage) {
        ArrayList<SubjectControlByAdmin> data = new ArrayList<>();
        String sql = "SELECT c.category_id, c.category_name, COUNT(cc.course_id) AS total_courses "
                + "FROM Category AS c "
                + "LEFT JOIN Course_Category AS cc ON c.category_id = cc.category_id "
                + "LEFT JOIN Course AS cr ON cc.course_id = cr.course_id "
                + "AND (cr.isDisable = 0 OR cr.isDisable IS NULL) "
                + "GROUP BY c.category_id, c.category_name "
                + "ORDER BY total_courses DESC "
                + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, offset);
            stm.setInt(2, recordsPerPage);
            try (ResultSet rs = stm.executeQuery()) {
                while (rs.next()) {
                    int categoryId = rs.getInt("category_id");
                    String categoryName = rs.getString("category_name");
                    int totalCourses = rs.getInt("total_courses");
                    data.add(new SubjectControlByAdmin(categoryId, categoryName, totalCourses));
                }
            }
        } catch (SQLException e) {
            System.out.println("getListSubjectControlByAdmin: " + e.getMessage());
        }
        return data;
    }

    // Tìm kiếm Subject theo tên với phân trang
    public ArrayList<SubjectControlByAdmin> searchSubjectsByName(String name, int offset, int recordsPerPage) {
        ArrayList<SubjectControlByAdmin> data = new ArrayList<>();
        String sql = "SELECT c.category_id, c.category_name, COUNT(cc.course_id) AS total_courses "
                + "FROM Category AS c "
                + "LEFT JOIN Course_Category AS cc ON c.category_id = cc.category_id "
                + "LEFT JOIN Course AS cr ON cc.course_id = cr.course_id "
                + "WHERE cr.isDisable = 0 AND c.category_name LIKE ? "
                + "GROUP BY c.category_id, c.category_name "
                + "ORDER BY total_courses DESC "
                + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setString(1, "%" + name + "%");
            stm.setInt(2, offset);
            stm.setInt(3, recordsPerPage);

            try (ResultSet rs = stm.executeQuery()) {
                while (rs.next()) {
                    int categoryId = rs.getInt("category_id");
                    String categoryName = rs.getString("category_name");
                    int totalCourses = rs.getInt("total_courses");
                    data.add(new SubjectControlByAdmin(categoryId, categoryName, totalCourses));
                }
            }
        } catch (SQLException e) {
            System.out.println("searchSubjectsByName: " + e.getMessage());
        }
        return data;
    }

    // Lấy tổng số bản ghi
    public int getNoOfRecords(String searchName) {
        int noOfRecords = 0;
        String sql = "SELECT COUNT(*) FROM Category AS c "
                + "LEFT JOIN Course_Category AS cc ON c.category_id = cc.category_id "
                + "LEFT JOIN Course AS cr ON cc.course_id = cr.course_id "
                + "WHERE (cr.isDisable = 0 OR cr.isDisable IS NULL)";

        if (searchName != null && !searchName.trim().isEmpty()) {
            sql += " AND c.category_name LIKE ?";
        }

        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            if (searchName != null && !searchName.trim().isEmpty()) {
                stm.setString(1, "%" + searchName + "%");
            }
            try (ResultSet rs = stm.executeQuery()) {
                if (rs.next()) {
                    noOfRecords = rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            System.out.println("getNoOfRecords: " + e.getMessage());
        }
        return noOfRecords;
    }

    // Phương thức kiểm tra tên Category có tồn tại
    public boolean isCategoryNameExists(String categoryName, int categoryId) {
        String sql = "SELECT COUNT(*) FROM Category WHERE category_name = ? AND category_id != ?";
        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setString(1, categoryName);
            stm.setInt(2, categoryId);
            try (ResultSet rs = stm.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        } catch (SQLException e) {
            System.out.println("isCategoryNameExists: " + e.getMessage());
        }
        return false;
    }

    // Thêm Category mới
    public boolean addCategory(String categoryName) {
        String sql = "INSERT INTO Category (category_name) VALUES (?)";
        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setString(1, categoryName);
            return stm.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("addCategory: " + e.getMessage());
        }
        return false;
    }

    // Cập nhật Category
    public boolean updateCategory(int categoryId, String categoryName) {
        String sql = "UPDATE Category SET category_name = ? WHERE category_id = ?";
        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setString(1, categoryName);
            stm.setInt(2, categoryId);
            return stm.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("updateCategory: " + e.getMessage());
        }
        return false;
    }

    // Xóa Category
    public boolean deleteCategory(int categoryId) {
        try {
            connection.setAutoCommit(false);

            String deleteCourseCategorySql = "DELETE FROM Course_Category WHERE category_id = ?";
            try (PreparedStatement stm = connection.prepareStatement(deleteCourseCategorySql)) {
                stm.setInt(1, categoryId);
                stm.executeUpdate();
            }

            String deleteCategorySql = "DELETE FROM Category WHERE category_id = ?";
            try (PreparedStatement stm = connection.prepareStatement(deleteCategorySql)) {
                stm.setInt(1, categoryId);
                boolean deleted = stm.executeUpdate() > 0;
                connection.commit();
                return deleted;
            }
        } catch (SQLException e) {
            try {
                connection.rollback();
            } catch (SQLException ex) {
                System.out.println("Rollback failed: " + ex.getMessage());
            }
            System.out.println("deleteCategory: " + e.getMessage());
        }
        return false;
    }

    public ArrayList<CourseControlByAdmin> getCoursesByCategoryId(int categoryId) {
        ArrayList<CourseControlByAdmin> courses = new ArrayList<>();
        try {
            String sql = "SELECT cr.course_id, cr.course_name, cr.description, cr.price "
                    + "FROM Course AS cr "
                    + "JOIN Course_Category AS cc ON cr.course_id = cc.course_id "
                    + "WHERE cc.category_id = ? AND (cr.isDisable = 0 OR cr.isDisable IS NULL)";

            stm = connection.prepareStatement(sql);
            stm.setInt(1, categoryId);
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
            System.out.println("getCoursesByCategoryId: " + e.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
            } catch (SQLException e) {
                System.out.println("Closing resources: " + e.getMessage());
            }
        }
        return courses;
    }

    // Tìm kiếm Course theo Course Name hoặc Description với phân trang
    public ArrayList<CourseControlByAdmin> searchCoursesByCategoryId(int categoryId, String keyword, int offset, int recordsPerPage) {
        ArrayList<CourseControlByAdmin> courses = new ArrayList<>();
        String sql = "SELECT cr.course_id, cr.course_name, cr.description, cr.price "
                + "FROM Course AS cr "
                + "JOIN Course_Category AS cc ON cr.course_id = cc.course_id "
                + "WHERE cc.category_id = ? AND (cr.isDisable = 0 OR cr.isDisable IS NULL) "
                + "AND (cr.course_name LIKE ? OR cr.description LIKE ?) "
                + "ORDER BY cr.course_name ASC "
                + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, categoryId);
            stm.setString(2, "%" + keyword + "%");
            stm.setString(3, "%" + keyword + "%");
            stm.setInt(4, offset);
            stm.setInt(5, recordsPerPage);
            try (ResultSet rs = stm.executeQuery()) {
                while (rs.next()) {
                    int courseId = rs.getInt("course_id");
                    String courseName = rs.getString("course_name");
                    String description = rs.getString("description");
                    double price = rs.getDouble("price");

                    courses.add(new CourseControlByAdmin(courseId, courseName, description, price));
                }
            }
        } catch (SQLException e) {
            System.out.println("searchCoursesByCategoryId: " + e.getMessage());
        }
        return courses;
    }

// Lấy tổng số bản ghi của các khóa học trong một danh mục cụ thể
    public int getTotalCoursesByCategoryId(int categoryId, String keyword) {
        int totalRecords = 0;
        String sql = "SELECT COUNT(*) FROM Course AS cr "
                + "JOIN Course_Category AS cc ON cr.course_id = cc.course_id "
                + "WHERE cc.category_id = ? AND (cr.isDisable = 0 OR cr.isDisable IS NULL) "
                + "AND (cr.course_name LIKE ? OR cr.description LIKE ?)";

        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, categoryId);
            stm.setString(2, "%" + keyword + "%");
            stm.setString(3, "%" + keyword + "%");

            try (ResultSet rs = stm.executeQuery()) {
                if (rs.next()) {
                    totalRecords = rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            System.out.println("getTotalCoursesByCategoryId: " + e.getMessage());
        }
        return totalRecords;
    }

    public boolean removeCourseFromCategory(int categoryId, int courseId) {
        String sql = "DELETE FROM Course_Category WHERE category_id = ? AND course_id = ?";
        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, categoryId);
            stm.setInt(2, courseId);
            return stm.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("removeCourseFromCategory: " + e.getMessage());
        }
        return false;
    }

    public int getTotalCategories() {
        int totalCategories = 0;

        String sql = "SELECT COUNT(*) AS total FROM Category";
        try (PreparedStatement stm = connection.prepareStatement(sql); ResultSet rs = stm.executeQuery()) {

            if (rs.next()) {
                totalCategories = rs.getInt("total");
            }
        } catch (SQLException e) {
            System.out.println("getTotalCategories: " + e.getMessage());
        }

        return totalCategories;
    }

}
