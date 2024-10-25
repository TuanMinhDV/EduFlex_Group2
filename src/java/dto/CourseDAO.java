package dto;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import model.Category;
import model.Constants;

import model.Course;

public class CourseDAO extends DBContext {

    // get course of lecturer and search ajax
    public List<Course> getCourseBankByLecturer(int lecturer_id, String txt) {
        List<Course> list = new ArrayList<>();
        String sql = "select s.* \n"
                + "from [Course] s\n"
                + "JOIN Account a ON a.account_id = s.lecturer_id\n"
                + "WHERE s.lecturer_id = ? AND s.course_name like '%" + txt + "%'";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, lecturer_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                byte[] imageData = rs.getBytes(4);
                String courseImage = new String(Base64.getEncoder().encode(imageData));
                Course s = new Course();
                s.setCourse_id(rs.getInt(1));
                s.setCourse_name(rs.getString(2));
                s.setImage(courseImage);
                list.add(s);
            }
        } catch (SQLException e) {
        }

        return list;
    }

    public List<Course> getTop5Course() {
        List<Course> list = new ArrayList<>();
        String query = "SELECT TOP (5) * FROM [Course]";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                byte[] imageData = rs.getBytes("image");
                String base64Image = new String(Base64.getEncoder().encode(imageData));
                Course s = new Course();
                s.setCourse_id(rs.getInt("course_id"));
                s.setCourse_name(rs.getString("course_name"));
                s.setDescription(rs.getString("description"));
                s.setImage(base64Image);
                s.setPrice(rs.getFloat("price"));
                s.setDiscount(rs.getFloat("discount"));
                s.setSold(rs.getInt("sold"));
                s.setCreated_date(rs.getString("created_date"));
                s.setUpdated_date(rs.getString("updated_date"));
                s.setInstructor_id(rs.getInt("instructor_id"));
                list.add(s);
            }
        } catch (SQLException e) {
        }

        return list;
    }

    public List<Course> getTop5MostRatedCourses() {
        List<Course> list = new ArrayList<>();
        String query = "SELECT TOP 5\n"
                + "Course.*,\n"
                + "Account.fullname,\n"
                + "ROUND(\n"
                + "(SELECT AVG(avg_rate) \n"
                + "FROM\n"
                + "(SELECT Course.course_id, AVG(Learner_Course.rate) AS avg_rate\n"
                + "FROM Learner_Course\n"
                + "INNER JOIN Course ON Learner_Course.course_id = Course.course_id\n"
                + "GROUP BY Course.course_id) AS course_rate\n"
                + "WHERE course_rate.course_id IN (SELECT Course.course_id\n"
                + "FROM Course\n"
                + "WHERE Course.course_id = Course.course_id)), 1) AS course_rate\n"
                + "FROM Course INNER JOIN Account ON Course.instructor_id = Account.account_id\n"
                + "order by course_rate desc";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                byte[] imageData = rs.getBytes("image");
                String base64Image = new String(Base64.getEncoder().encode(imageData));
                Course s = new Course();
                s.setCourse_id(rs.getInt("course_id"));
                s.setCourse_name(rs.getString("course_name"));
                s.setDescription(rs.getString("description"));
                s.setImage(base64Image);
                s.setPrice(rs.getFloat("price"));
                s.setDiscount(rs.getFloat("discount"));
                s.setSold(rs.getInt("sold"));
                s.setCreated_date(rs.getString("created_date"));
                s.setUpdated_date(rs.getString("updated_date"));
                s.setInstructor_id(rs.getInt("instructor_id"));
                s.setInstructor_name(rs.getString("fullname"));
                s.setRate_course(rs.getDouble("course_rate"));
                list.add(s);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Course> getTop4NewestCourse() {
        List<Course> list = new ArrayList<>();
        String query = "SELECT TOP 4 * FROM COURSE ORDER BY created_date desc";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                byte[] imageData = rs.getBytes("image");
                String base64Image = new String(Base64.getEncoder().encode(imageData));
                Course s = new Course();
                s.setCourse_id(rs.getInt("course_id"));
                s.setCourse_name(rs.getString("course_name"));
                s.setDescription(rs.getString("description"));
                s.setImage(base64Image);
                s.setPrice(rs.getFloat("price"));
                s.setDiscount(rs.getFloat("discount"));
                s.setSold(rs.getInt("sold"));
                s.setCreated_date(rs.getString("created_date"));
                s.setUpdated_date(rs.getString("updated_date"));
                s.setInstructor_id(rs.getInt("instructor_id"));
                list.add(s);
            }
        } catch (SQLException e) {
        }

        return list;
    }

    public boolean updateCourseWithCourseIDByLecturer(String course_name, String description, String image, double discount, double price, int category_id, int course_id) {
        String query1 = "UPDATE [dbo].[Course]\n"
                + "   SET [course_name] = ?\n"
                + "      ,[description] = ? \n"
                + "      ,[image] = ?\n"
                + "      ,[discount] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[category_id] = ?\n"
                + "      ,[updated_date] = getdate()\n"
                + " WHERE course_id = ?\n";

        String query2 = "UPDATE [dbo].[Course]\n"
                + "   SET [course_name] = ?\n"
                + "      ,[description] = ? \n"
                + "      ,[discount] = ? \n"
                + "      ,[price] = ? \n"
                + "      ,[category_id] = ?\n"
                + "      ,[updated_date] = getdate()\n"
                + " WHERE course_id = ?\n";

        if (image != null) {
            File courseImage = new File(Constants.SAVE_PATH + image);
            try (InputStream courseStream = new FileInputStream(courseImage)) {
                PreparedStatement st = connection.prepareStatement(query1);
                st.setString(1, course_name);
                st.setString(2, description);
                st.setBinaryStream(3, courseStream);
                st.setDouble(4, discount);
                st.setDouble(5, price);
                st.setInt(6, category_id);
                st.setInt(7, course_id);
                st.executeUpdate();
                return true;
            } catch (SQLException | IOException e) {
            }
        } else {
            try {
                PreparedStatement st = connection.prepareStatement(query2);
                st.setString(1, course_name);
                st.setString(2, description);
                st.setDouble(3, discount);
                st.setDouble(4, price);
                st.setInt(5, category_id);
                st.setInt(6, course_id);
                st.executeUpdate();
                return true;
            } catch (SQLException e) {
            }
        }
        return false;
    }

    public List<Course> getAllCourseByInstructorId(int instructor_id) {
        List<Course> list = new ArrayList<>();
        String query = "SELECT [course_id]\n"
                + "      ,[course_name]\n"
                + "      ,[description]\n"
                + "      ,[image]\n"
                + "      ,[price]\n"
                + "      ,[discount]\n"
                + "      ,[sold]\n"
                + "      ,[created_date]\n"
                + "      ,[updated_date]\n"
                + "      ,[category_id]\n"
                + "  FROM [dbo].[Course]\n"
                + "  Where lecturer_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setInt(1, instructor_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                byte[] imageData = rs.getBytes("image");
                String base64Image = new String(Base64.getEncoder().encode(imageData));
                Course s = new Course();
                s.setCourse_id(rs.getInt("course_id"));
                s.setCourse_name(rs.getString("course_name"));
                s.setDescription(rs.getString("description"));
                s.setImage(base64Image);
                s.setPrice(rs.getFloat("price"));
                s.setDiscount(rs.getFloat("discount"));
                s.setSold(rs.getInt("sold"));
                s.setCreated_date(rs.getString("created_date"));
                s.setUpdated_date(rs.getString("updated_date"));
                list.add(s);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public boolean deleteCourseByCourseId(int course_id) {
        String query = "DELETE FROM [Course] WHERE course_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setInt(1, course_id);
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
        }
        return false;
    }

    // add course
    public boolean addCourse(String course_name, String description, String image, double price, double discount, int category_id, int lecturer_id) {
        String query1 = "INSERT INTO [dbo].[Course]\n"
                + "([course_name], "
                + "[description], "
                + "[image], "
                + "[price], "
                + "[discount], "
                + "[created_date], "
                + "[updated_date], "
                + "[category_id], "
                + "[lecturer_id])\n"
                + "VALUES (?,?,?,?,?,getdate(),null,?,?)";

        File courseImage = new File(Constants.SAVE_PATH + image);
        try (InputStream courseStream = new FileInputStream(courseImage)) {
            PreparedStatement st = connection.prepareStatement(query1);
            st.setString(1, course_name);
            st.setString(2, description);
            st.setBinaryStream(3, courseStream);
            st.setDouble(4, price);
            st.setDouble(5, discount);
            st.setInt(6, category_id);
            st.setInt(7, lecturer_id);
            st.executeUpdate();
            return true;
        } catch (SQLException | IOException e) {
        }

        return false;
    }

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String sql = "SELECT *\n"
                + "  FROM [OnlineLearning].[dbo].[Category]";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category cy = new Category();
                cy.setCategory_id(rs.getInt("category_id"));
                cy.setCategory_name(rs.getString("category_name"));

                list.add(cy);
            }

        } catch (SQLException e) {

        }

        return list;
    }

    public Course getCourseByCourseId(int course_id) {
        String query = "SELECT [course_name]\n"
                + "      ,[description]\n"
                + "      ,[image]\n"
                + "      ,[created_date]\n"
                + "      ,[updated_date]\n"
                + "      ,[price]\n"
                + "      ,[discount]\n"
                + "      ,[sold]\n"
                + "      ,[category_id]\n"
                + "      ,[lecturer_id]\n"
                + "  FROM [Course]"
                + "  WHERE course_id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setInt(1, course_id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                byte[] imageData = rs.getBytes("image");
                String base64Image = new String(Base64.getEncoder().encode(imageData));
                Course s = new Course();
                s.setCourse_id(course_id);
                s.setCourse_name(rs.getString("course_name"));
                s.setDescription(rs.getString("description"));
                s.setImage(base64Image);
                s.setPrice(rs.getFloat("price"));
                s.setDiscount(rs.getFloat("discount"));
                s.setSold(rs.getInt("sold"));
                s.setCreated_date(rs.getString("created_date"));
                s.setUpdated_date(rs.getString("updated_date"));
                s.setInstructor_id(rs.getInt("instructor_id"));
                return s;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public static void main(String[] args) {
        CourseDAO s = new CourseDAO();
//        System.out.println(
//                s.updateCourseWithCourseIDByLecturer("Course Test", "huhuhufsdf", null, 10, 1000, 1, 6)
//        );
        List<Course> lists1 = s.getTop5Course();
//        List<Course> lists = s.getTop5MostRatedCourses();
//        List<Course> lists2 = s.getTop4NewestCourse();
        System.out.println(lists1);
//        System.out.println(lists);
//        System.out.println(lists2);

    }

}//end dao
