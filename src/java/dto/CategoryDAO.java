package dto;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.CategoryByAdmin;
import model.Course;

public class CategoryDAO extends DBContext {

    PreparedStatement stm;
    ResultSet rs;

    // Lấy danh sách danh mục với phân trang
    public List<CategoryByAdmin> getCategoriesWithPagination(int offset, int limit) {
        List<CategoryByAdmin> categories = new ArrayList<>();
        String sql = "SELECT category_id, category_name, updated_date "
                + "FROM Category "
                + "ORDER BY category_id "
                + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, offset);
            stm.setInt(2, limit);
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("category_id");
                String name = rs.getString("category_name");
                Date updatedDate = rs.getDate("updated_date");

                CategoryByAdmin category = new CategoryByAdmin();
                category.setId(id);
                category.setName(name);
                category.setUpdated_date(updatedDate);

                categories.add(category);
            }
        } catch (SQLException e) {
            System.out.println("getCategoriesWithPagination() error: " + e.getMessage());
        }
        return categories;
    }

    // Lấy tổng số danh mục
    public int getTotalCategoryCount() {
        String sql = "SELECT COUNT(*) AS total FROM Category";
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("total");
            }
        } catch (SQLException e) {
            System.out.println("getTotalCategoryCount() error: " + e.getMessage());
        }
        return 0;
    }

    // Tìm kiếm danh mục với phân trang
    public List<CategoryByAdmin> searchCategoriesWithPagination(String searchQuery, int offset, int limit) {
        List<CategoryByAdmin> categories = new ArrayList<>();
        String sql = "SELECT category_id, category_name, updated_date "
                + "FROM Category "
                + "WHERE category_name LIKE ? "
                + "ORDER BY category_id "
                + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + searchQuery + "%"); // Tìm kiếm với LIKE
            stm.setInt(2, offset);
            stm.setInt(3, limit);
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("category_id");
                String name = rs.getString("category_name");
                Date updatedDate = rs.getDate("updated_date");

                CategoryByAdmin category = new CategoryByAdmin();
                category.setId(id);
                category.setName(name);
                category.setUpdated_date(updatedDate);

                categories.add(category);
            }
        } catch (SQLException e) {
            System.out.println("searchCategoriesWithPagination() error: " + e.getMessage());
        }
        return categories;
    }

    // Lấy tổng số danh mục dựa trên tìm kiếm
    public int getTotalCategoryCountWithSearch(String searchQuery) {
        String sql = "SELECT COUNT(*) AS total FROM Category WHERE category_name LIKE ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + searchQuery + "%");
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("total");
            }
        } catch (SQLException e) {
            System.out.println("getTotalCategoryCountWithSearch() error: " + e.getMessage());
        }
        return 0;
    }

    // Thêm một danh mục
    // Thêm một danh mục
    public boolean addCategory(CategoryByAdmin category) {
        String sql = "INSERT INTO Category (category_name, updated_date) VALUES (?, ?)";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, category.getName());
            stm.setDate(2, new java.sql.Date(category.getUpdated_date().getTime())); // Chuyển đổi sang java.sql.Date
            int rowsInserted = stm.executeUpdate();
            return rowsInserted > 0; // Trả về true nếu thêm thành công
        } catch (SQLException e) {
            System.out.println("addCategory() error: " + e.getMessage());
            return false; // Trả về false nếu xảy ra lỗi
        }
    }

    // Lấy tổng số khóa học cho tất cả danh mục
    public Map<Integer, Integer> getTotalCoursesForAllCategories() {
        Map<Integer, Integer> categoryCourseCounts = new HashMap<>();
        String sql = "SELECT cc.category_id, COUNT(cr.course_id) AS total "
                + "FROM Course AS cr "
                + "JOIN Course_Category AS cc ON cr.course_id = cc.course_id "
                + "WHERE cr.isDisable = 0 OR cr.isDisable IS NULL "
                + "GROUP BY cc.category_id";

        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                int categoryId = rs.getInt("category_id");
                int totalCourses = rs.getInt("total");
                categoryCourseCounts.put(categoryId, totalCourses);
            }
        } catch (SQLException e) {
            System.out.println("getTotalCoursesForAllCategories() error: " + e.getMessage());
        }
        return categoryCourseCounts;
    }

    // Kiểm tra danh mục đã tồn tại chưa
    public boolean isCategoryExists(String categoryName) {
        String sql = "SELECT COUNT(*) AS total FROM Category WHERE category_name = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, categoryName);
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("total") > 0; // Trả về true nếu danh mục đã tồn tại
            }
        } catch (SQLException e) {
            System.out.println("isCategoryExists() error: " + e.getMessage());
        }
        return false; // Mặc định trả về false nếu có lỗi
    }

// Cập nhật danh mục
    public boolean updateCategory(CategoryByAdmin category) {
        String sql = "UPDATE Category SET category_name = ?, updated_date = ? WHERE category_id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, category.getName());
            stm.setDate(2, new java.sql.Date(category.getUpdated_date().getTime())); // Chuyển đổi sang java.sql.Date
            stm.setInt(3, category.getId()); // ID của danh mục cần cập nhật
            int rowsUpdated = stm.executeUpdate();
            return rowsUpdated > 0; // Trả về true nếu cập nhật thành công
        } catch (SQLException e) {
            System.out.println("updateCategory() error: " + e.getMessage());
            return false; // Trả về false nếu xảy ra lỗi
        }
    }

    // Xóa danh mục
    public boolean deleteCategory(int categoryId) {
        String sql = "DELETE FROM Category WHERE category_id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, categoryId);
            int rowsDeleted = stm.executeUpdate();
            return rowsDeleted > 0; // Trả về true nếu xóa thành công
        } catch (SQLException e) {
            System.out.println("deleteCategory() error: " + e.getMessage());
            return false; // Trả về false nếu xảy ra lỗi
        }
    }

    // Lấy danh mục theo ID
    public CategoryByAdmin getCategoryById(int categoryId) {
        String sql = "SELECT category_id, category_name, updated_date "
                + "FROM Category WHERE category_id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, categoryId);
            rs = stm.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("category_id");
                String name = rs.getString("category_name");
                Date updatedDate = rs.getDate("updated_date");

                CategoryByAdmin category = new CategoryByAdmin();
                category.setId(id);
                category.setName(name);
                category.setUpdated_date(updatedDate);

                return category; // Trả về đối tượng CategoryByAdmin nếu tìm thấy
            }
        } catch (SQLException e) {
            System.out.println("getCategoryById() error: " + e.getMessage());
        }
        return null; // Trả về null nếu không tìm thấy hoặc xảy ra lỗi
    }

    public List<Course> getCoursesByCategoryId(int categoryId) {
        List<Course> courses = new ArrayList<>();
        String sql = "SELECT c.course_id, c.course_name, c.description, c.image, c.created_date, c.updated_date, "
                + "c.price, c.discount, c.sold, c.instructor_id, c.isDisable "
                + "FROM Course c "
                + "JOIN Course_Category cc ON c.course_id = cc.course_id "
                + "WHERE cc.category_id = ? AND (c.isDisable = 0 OR c.isDisable IS NULL)";

        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, categoryId);
            rs = stm.executeQuery();
            while (rs.next()) {
                Course course = new Course();
                course.setId(rs.getInt("course_id"));
                course.setName(rs.getString("course_name"));
                course.setDescription(rs.getString("description"));
                course.setImage(rs.getString("image"));
                course.setCreated_date(rs.getDate("created_date"));
                course.setUpdated_date(rs.getDate("updated_date"));
                course.setPrice(rs.getFloat("price"));
                course.setDiscount(rs.getFloat("discount"));
                course.setSold(rs.getInt("sold"));
                course.setInstructor_id(rs.getInt("instructor_id"));
                course.setIsDisable(rs.getInt("isDisable"));

                courses.add(course);
            }
        } catch (SQLException e) {
            System.out.println("getCoursesByCategoryId() error: " + e.getMessage());
        }
        return courses;
    }

    public List<Course> getCoursesByCategoryWithPagination(int categoryId, int offset, int limit) {
        List<Course> courses = new ArrayList<>();
        String sql = "SELECT c.course_id, c.course_name, c.description, c.image, c.created_date, c.updated_date, "
                + "c.price, c.discount, c.sold, c.instructor_id, c.isDisable "
                + "FROM Course c "
                + "JOIN Course_Category cc ON c.course_id = cc.course_id "
                + "WHERE cc.category_id = ? AND (c.isDisable = 0 OR c.isDisable IS NULL) "
                + "ORDER BY c.course_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, categoryId);
            stm.setInt(2, offset);
            stm.setInt(3, limit);
            rs = stm.executeQuery();
            while (rs.next()) {
                Course course = new Course();
                course.setId(rs.getInt("course_id"));
                course.setName(rs.getString("course_name"));
                course.setDescription(rs.getString("description"));
                course.setImage(rs.getString("image"));
                course.setCreated_date(rs.getDate("created_date"));
                course.setUpdated_date(rs.getDate("updated_date"));
                course.setPrice(rs.getFloat("price"));
                course.setDiscount(rs.getFloat("discount"));
                course.setSold(rs.getInt("sold"));
                course.setInstructor_id(rs.getInt("instructor_id"));
                course.setIsDisable(rs.getInt("isDisable"));

                courses.add(course);
            }
        } catch (SQLException e) {
            System.out.println("getCoursesByCategoryWithPagination() error: " + e.getMessage());
        }
        return courses;
    }

    public int getTotalCoursesByCategory(int categoryId) {
        String sql = "SELECT COUNT(*) AS total "
                + "FROM Course c "
                + "JOIN Course_Category cc ON c.course_id = cc.course_id "
                + "WHERE cc.category_id = ? AND (c.isDisable = 0 OR c.isDisable IS NULL)";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, categoryId);
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("total");
            }
        } catch (SQLException e) {
            System.out.println("getTotalCoursesByCategory() error: " + e.getMessage());
        }
        return 0;
    }

    public List<Course> searchCoursesByCategoryWithPagination(int categoryId, String searchQuery, int offset, int limit) {
        List<Course> courses = new ArrayList<>();
        String sql = "SELECT c.course_id, c.course_name, c.description, c.image, c.created_date, c.updated_date, "
                + "c.price, c.discount, c.sold, c.instructor_id, c.isDisable "
                + "FROM Course c "
                + "JOIN Course_Category cc ON c.course_id = cc.course_id "
                + "WHERE cc.category_id = ? "
                + "AND (c.course_name LIKE ? OR c.description LIKE ?) "
                + "AND (c.isDisable = 0 OR c.isDisable IS NULL) "
                + "ORDER BY c.course_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, categoryId);
            stm.setString(2, "%" + searchQuery + "%");
            stm.setString(3, "%" + searchQuery + "%");
            stm.setInt(4, offset);
            stm.setInt(5, limit);
            rs = stm.executeQuery();
            while (rs.next()) {
                Course course = new Course();
                course.setId(rs.getInt("course_id"));
                course.setName(rs.getString("course_name"));
                course.setDescription(rs.getString("description"));
                course.setImage(rs.getString("image"));
                course.setCreated_date(rs.getDate("created_date"));
                course.setUpdated_date(rs.getDate("updated_date"));
                course.setPrice(rs.getFloat("price"));
                course.setDiscount(rs.getFloat("discount"));
                course.setSold(rs.getInt("sold"));
                course.setInstructor_id(rs.getInt("instructor_id"));
                course.setIsDisable(rs.getInt("isDisable"));

                courses.add(course);
            }
        } catch (SQLException e) {
            System.out.println("searchCoursesByCategoryWithPagination() error: " + e.getMessage());
        }
        return courses;
    }

    public int getTotalSearchCoursesByCategory(int categoryId, String searchQuery) {
        String sql = "SELECT COUNT(*) AS total "
                + "FROM Course c "
                + "JOIN Course_Category cc ON c.course_id = cc.course_id "
                + "WHERE cc.category_id = ? "
                + "AND (c.course_name LIKE ? OR c.description LIKE ?) "
                + "AND (c.isDisable = 0 OR c.isDisable IS NULL)";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, categoryId);
            stm.setString(2, "%" + searchQuery + "%");
            stm.setString(3, "%" + searchQuery + "%");
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("total");
            }
        } catch (SQLException e) {
            System.out.println("getTotalSearchCoursesByCategory() error: " + e.getMessage());
        }
        return 0;
    }

    public List<Course> getCoursesByCategoryWithPaginationAndSort(int categoryId, int offset, int limit, String sort) {
        List<Course> courses = new ArrayList<>();
        String sql = "SELECT c.course_id, c.course_name, c.description, c.image, c.created_date, c.updated_date, "
                + "c.price, c.discount, c.sold, c.instructor_id, c.isDisable "
                + "FROM Course c "
                + "JOIN Course_Category cc ON c.course_id = cc.course_id "
                + "WHERE cc.category_id = ? AND (c.isDisable = 0 OR c.isDisable IS NULL) "
                + "ORDER BY c.updated_date " + sort + " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, categoryId);
            stm.setInt(2, offset);
            stm.setInt(3, limit);
            rs = stm.executeQuery();
            while (rs.next()) {
                Course course = new Course();
                course.setId(rs.getInt("course_id"));
                course.setName(rs.getString("course_name"));
                course.setDescription(rs.getString("description"));
                course.setImage(rs.getString("image"));
                course.setCreated_date(rs.getDate("created_date"));
                course.setUpdated_date(rs.getDate("updated_date"));
                course.setPrice(rs.getFloat("price"));
                course.setDiscount(rs.getFloat("discount"));
                course.setSold(rs.getInt("sold"));
                course.setInstructor_id(rs.getInt("instructor_id"));
                course.setIsDisable(rs.getInt("isDisable"));

                courses.add(course);
            }
        } catch (SQLException e) {
            System.out.println("getCoursesByCategoryWithPaginationAndSort() error: " + e.getMessage());
        }
        return courses;
    }

    // Xóa khóa học khỏi danh mục
    public boolean removeCourseFromCategory(int courseId, int categoryId) {
        String sql = "DELETE FROM Course_Category WHERE course_id = ? AND category_id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, courseId);
            stm.setInt(2, categoryId);
            int rowsDeleted = stm.executeUpdate();
            return rowsDeleted > 0; // Trả về true nếu xóa thành công
        } catch (SQLException e) {
            System.out.println("removeCourseFromCategory() error: " + e.getMessage());
            return false;
        }
    }
    
    public List<Course> getCoursesNotInCategory(int categoryId) {
    List<Course> courses = new ArrayList<>();
    String sql = "SELECT c.course_id, c.course_name, c.description, c.price "
               + "FROM Course c "
               + "WHERE c.course_id NOT IN (SELECT course_id FROM Course_Category WHERE category_id = ?)";
    try {
        PreparedStatement stm = connection.prepareStatement(sql);
        stm.setInt(1, categoryId);
        ResultSet rs = stm.executeQuery();
        while (rs.next()) {
            Course course = new Course();
            course.setId(rs.getInt("course_id"));
            course.setName(rs.getString("course_name"));
            course.setDescription(rs.getString("description"));
            course.setPrice(rs.getFloat("price"));
            courses.add(course);
        }
    } catch (SQLException e) {
        System.out.println("getCoursesNotInCategory() error: " + e.getMessage());
    }
    return courses;
}

public boolean addCourseToCategory(int courseId, int categoryId) {
    String sql = "INSERT INTO Course_Category (course_id, category_id) VALUES (?, ?)";
    try {
        PreparedStatement stm = connection.prepareStatement(sql);
        stm.setInt(1, courseId);
        stm.setInt(2, categoryId);
        int rowsInserted = stm.executeUpdate();
        return rowsInserted > 0;
    } catch (SQLException e) {
        System.out.println("addCourseToCategory() error: " + e.getMessage());
        return false;
    }
}


public List<Course> searchCoursesNotInCategoryWithPagination(int categoryId, String searchQuery, int offset, int limit) {
    List<Course> courses = new ArrayList<>();
    String sql = "SELECT c.course_id, c.course_name, c.description, c.price "
               + "FROM Course c "
               + "WHERE c.course_id NOT IN (SELECT course_id FROM Course_Category WHERE category_id = ?) "
               + "AND (c.course_name LIKE ? OR c.description LIKE ?) "
               + "ORDER BY c.course_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
    try {
        PreparedStatement stm = connection.prepareStatement(sql);
        stm.setInt(1, categoryId);
        stm.setString(2, "%" + searchQuery + "%");
        stm.setString(3, "%" + searchQuery + "%");
        stm.setInt(4, offset);
        stm.setInt(5, limit);
        ResultSet rs = stm.executeQuery();
        while (rs.next()) {
            Course course = new Course();
            course.setId(rs.getInt("course_id"));
            course.setName(rs.getString("course_name"));
            course.setDescription(rs.getString("description"));
            course.setPrice(rs.getFloat("price"));
            courses.add(course);
        }
    } catch (SQLException e) {
        System.out.println("searchCoursesNotInCategoryWithPagination() error: " + e.getMessage());
    }
    return courses;
}

public int getTotalCoursesNotInCategoryWithSearch(int categoryId, String searchQuery) {
    String sql = "SELECT COUNT(*) AS total "
               + "FROM Course c "
               + "WHERE c.course_id NOT IN (SELECT course_id FROM Course_Category WHERE category_id = ?) "
               + "AND (c.course_name LIKE ? OR c.description LIKE ?)";
    try {
        PreparedStatement stm = connection.prepareStatement(sql);
        stm.setInt(1, categoryId);
        stm.setString(2, "%" + searchQuery + "%");
        stm.setString(3, "%" + searchQuery + "%");
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            return rs.getInt("total");
        }
    } catch (SQLException e) {
        System.out.println("getTotalCoursesNotInCategoryWithSearch() error: " + e.getMessage());
    }
    return 0;
}


}
