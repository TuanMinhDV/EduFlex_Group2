/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

import jakarta.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Array;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.List;
import model.Account;
import model.Category;
import model.Category1;
import model.Constants;
import model.Course;
import model.Course1;

/**
 *
 * @author dungm
 */
public class CourseDAO extends DBContext {

    protected PreparedStatement statement;
    protected ResultSet resultSet;

    public List<Category> getAllCategory() {
        List<Category> listAll = new ArrayList<>();
        String sql = """
                     SELECT * from Category""";
        try {
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("category_id");
                String name = resultSet.getString("category_name");
                Category cate = new Category(id, name, null, null);
                listAll.add(cate);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listAll;
    }

    public List<Course> getAllCoursesByInsID(int ins_id) {
        List<Course> listAll = new ArrayList<>();
        String sql = """
                     SELECT c.course_id, c.course_name, c.description, c.image, c.created_date, c.updated_date, c.instructor_id, c.isDisable, cat.category_name
                                          FROM 
                                              course c
                                          LEFT JOIN 
                                              course_category cc ON c.course_id = cc.course_id
                                          LEFT JOIN 
                                              category cat ON cc.category_id = cat.category_id where instructor_id = ?""";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, ins_id);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("course_id");
                String name = resultSet.getString("course_name");
                String img = resultSet.getString("image");
                Date createDate = resultSet.getDate("created_date");
                Date updateDate = resultSet.getDate("updated_date");
                int instructor_id = resultSet.getInt("instructor_id");
                String des = resultSet.getString("description");
                int isDisable = resultSet.getInt("isDisable");
                Course c = new Course(id, name, des, img, createDate, updateDate, instructor_id, isDisable);
                String cateName = resultSet.getString("category_name");
                c.setCate_name(cateName);
                listAll.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listAll;
    }

    public List<Course> getAllCoursesByInsId_CateID(int ins_id, int cateID) {
        List<Course> listAll = new ArrayList<>();
        String sql = """
                     SELECT 
                         c.course_id, c.course_name, c.description, c.image, c.created_date, c.updated_date, c.instructor_id, c.isDisable, cat.category_name
                     FROM 
                         course c
                     INNER JOIN 
                         course_category cc ON c.course_id = cc.course_id
                     INNER JOIN 
                         category cat ON cc.category_id = cat.category_id
                     where cat.category_id = ? and instructor_id = ?""";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, cateID);
            statement.setInt(2, ins_id);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("course_id");
                String name = resultSet.getString("course_name");
                String img = resultSet.getString("image");
                Date createDate = resultSet.getDate("created_date");
                Date updateDate = resultSet.getDate("updated_date");
                int instructor_id = resultSet.getInt("instructor_id");
                String des = resultSet.getString("description");
                int isDisable = resultSet.getInt("isDisable");
                Course c = new Course(id, name, des, img, createDate, updateDate, instructor_id, isDisable);
                String cateName = resultSet.getString("category_name");
                c.setCate_name(cateName);
                listAll.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listAll;
    }

    public void addCourseByInstructor(Course c) {
        String sql = """
                     INSERT INTO [dbo].[Course]
                                ([course_name]
                                ,[description]
                                ,[image])
                          VALUES 
                                (?, ?, ?)""";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, c.getName());
            statement.setString(2, c.getDescription());
            statement.setString(3, c.getImage());
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Course1> getAllCourse() {
        List<Course1> list = new ArrayList<>();
        String query = "WITH CourseRatings AS (\n"
                + "    SELECT\n"
                + "        c.course_id,\n"
                + "        AVG(lc.rate) AS course_rate\n"
                + "    FROM\n"
                + "        Course c\n"
                + "    LEFT JOIN Learner_Course lc ON c.course_id = lc.course_id\n"
                + "    GROUP BY\n"
                + "        c.course_id\n"
                + "),\n"
                + "ChapterCount AS (\n"
                + "    SELECT\n"
                + "        c.course_id,\n"
                + "        COUNT(*) AS chapter_count\n"
                + "    FROM\n"
                + "        Course c\n"
                + "    INNER JOIN Chapter ch ON c.course_id = ch.course_id\n"
                + "    GROUP BY\n"
                + "        c.course_id\n"
                + "),\n"
                + "LessonCount AS (\n"
                + "    SELECT\n"
                + "        ch.course_id,\n"
                + "        COUNT(*) AS lesson_count\n"
                + "    FROM\n"
                + "        Chapter ch\n"
                + "    INNER JOIN Lesson l ON ch.chapter_id = l.chapter_id\n"
                + "    GROUP BY\n"
                + "        ch.course_id\n"
                + ")\n"
                + "SELECT \n"
                + "    c.*, \n"
                + "    a.fullname, \n"
                + "    COALESCE(cr.course_rate, 0) AS course_rate, \n"
                + "    cc.chapter_count, \n"
                + "    lc.lesson_count\n"
                + "FROM\n"
                + "    Course c \n"
                + "INNER JOIN Account a ON c.instructor_id = a.account_id \n"
                + "LEFT JOIN CourseRatings cr ON c.course_id = cr.course_id \n"
                + "LEFT JOIN ChapterCount cc ON c.course_id = cc.course_id \n"
                + "LEFT JOIN LessonCount lc ON c.course_id = lc.course_id;";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                byte[] imageData = rs.getBytes("image");
                String base64Image = new String(Base64.getEncoder().encode(imageData));
                Course1 s = new Course1();
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
                s.setChapter_num(rs.getInt("chapter_count"));
                s.setLesson_num(rs.getInt("lesson_count"));
                list.add(s);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    // get course of lecturer and search ajax
    public List<Course1> getCourseBankByLecturer(int lecturer_id, String txt) {
        List<Course1> list = new ArrayList<>();
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
                Course1 s = new Course1();
                s.setCourse_id(rs.getInt(1));
                s.setCourse_name(rs.getString(2));
                s.setImage(courseImage);
                list.add(s);
            }
        } catch (SQLException e) {
        }

        return list;
    }

    public int getCourseActive(int course_id, int account_id) {
        String sql = "SELECT Learner_Course.active\n"
                + "  FROM [Learner_Course], Account, Course\n"
                + "  where Learner_Course.learner_id = Account.account_id\n"
                + "  and Course.course_id = Learner_Course.course_id\n"
                + "  and Course.course_id = ?\n"
                + "  and Account.account_id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, course_id);
            st.setInt(2, account_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt("active");
            }

        } catch (SQLException e) {

        }

        return 0;
    }

    public List<Course1> getTop5Course() {
        List<Course1> list = new ArrayList<>();
        String query = "SELECT TOP (5) * FROM [Course]";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                byte[] imageData = rs.getBytes("image");
                String base64Image = new String(Base64.getEncoder().encode(imageData));
                Course1 s = new Course1();
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

    public List<Course1> getTop5MostRatedCourses() {
        List<Course1> list = new ArrayList<>();
        String query = "WITH CourseRatings AS (\n"
                + "    SELECT\n"
                + "        c.course_id,\n"
                + "        AVG(lc.rate) AS course_rate\n"
                + "    FROM\n"
                + "        Course c\n"
                + "    LEFT JOIN Learner_Course lc ON c.course_id = lc.course_id\n"
                + "    GROUP BY\n"
                + "        c.course_id\n"
                + ")\n"
                + "SELECT TOP 5 \n"
                + "    c.*,\n"
                + "    a.fullname,\n"
                + "    COALESCE(cr.course_rate, 0) AS course_rate \n"
                + "FROM\n"
                + "    Course c\n"
                + "INNER JOIN Account a ON c.instructor_id = a.account_id\n"
                + "LEFT JOIN CourseRatings cr ON c.course_id = cr.course_id\n"
                + "ORDER BY cr.course_rate DESC;";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                byte[] imageData = rs.getBytes("image");
                String base64Image = new String(Base64.getEncoder().encode(imageData));
                Course1 s = new Course1();
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

    public List<Course1> getTop4NewestCourse() {
        List<Course1> list = new ArrayList<>();
        String query = "SELECT TOP 4 * FROM COURSE ORDER BY created_date desc";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                byte[] imageData = rs.getBytes("image");
                String base64Image = new String(Base64.getEncoder().encode(imageData));
                Course1 s = new Course1();
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

    public List<Course1> getAllCourseByInstructorId(int instructor_id) {
        List<Course1> list = new ArrayList<>();
        String query = "WITH CourseRatings AS (\n"
                + "    SELECT\n"
                + "        c.course_id,\n"
                + "        AVG(lc.rate) AS course_rate\n"
                + "    FROM\n"
                + "        Course c\n"
                + "    LEFT JOIN Learner_Course lc ON c.course_id = lc.course_id\n"
                + "    GROUP BY\n"
                + "        c.course_id\n"
                + "),\n"
                + "ChapterCount AS (\n"
                + "    SELECT\n"
                + "        c.course_id,\n"
                + "        COUNT(*) AS chapter_count\n"
                + "    FROM\n"
                + "        Course c\n"
                + "    INNER JOIN Chapter ch ON c.course_id = ch.course_id\n"
                + "    GROUP BY\n"
                + "        c.course_id\n"
                + "),\n"
                + "LessonCount AS (\n"
                + "    SELECT\n"
                + "        ch.course_id,\n"
                + "        COUNT(*) AS lesson_count\n"
                + "    FROM\n"
                + "        Chapter ch\n"
                + "    INNER JOIN Lesson l ON ch.chapter_id = l.chapter_id\n"
                + "    GROUP BY\n"
                + "        ch.course_id\n"
                + ")\n"
                + "SELECT \n"
                + "    c.*, \n"
                + "    a.fullname, \n"
                + "    COALESCE(cr.course_rate, 0) AS course_rate, \n"
                + "    cc.chapter_count, \n"
                + "    lc.lesson_count\n"
                + "FROM\n"
                + "    Course c \n"
                + "INNER JOIN Account a ON c.instructor_id = a.account_id \n"
                + "LEFT JOIN CourseRatings cr ON c.course_id = cr.course_id \n"
                + "LEFT JOIN ChapterCount cc ON c.course_id = cc.course_id \n"
                + "LEFT JOIN LessonCount lc ON c.course_id = lc.course_id \n"
                + "WHERE c.instructor_id = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setInt(1, instructor_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                byte[] imageData = rs.getBytes("image");
                String base64Image = new String(Base64.getEncoder().encode(imageData));
                Course1 s = new Course1();
                s.setCourse_id(rs.getInt("course_id"));
                s.setCourse_name(rs.getString("course_name"));
                s.setDescription(rs.getString("description"));
                s.setImage(base64Image);
                s.setPrice(rs.getFloat("price"));
                s.setDiscount(rs.getFloat("discount"));
                s.setSold(rs.getInt("sold"));
                s.setCreated_date(rs.getString("created_date"));
                s.setUpdated_date(rs.getString("updated_date"));
                s.setRate_course(rs.getDouble("course_rate"));
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

    public List<Category1> getAllCategory1() {
        List<Category1> list = new ArrayList<>();
        String sql = "SELECT * FROM [Category]";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category1 cy = new Category1();
                cy.setCategory_id(rs.getInt("category_id"));
                cy.setCategory_name(rs.getString("category_name"));

                list.add(cy);
            }

        } catch (SQLException e) {

        }

        return list;
    }

    public Course1 getCourseByCourseId(int course_id) {
        String query = "WITH CourseRatings AS (\n"
                + "  SELECT\n"
                + "    c.course_id,\n"
                + "    AVG(lc.rate) AS course_rate\n"
                + "  FROM\n"
                + "    Course c\n"
                + "  LEFT JOIN Learner_Course lc ON c.course_id = lc.course_id\n"
                + "  GROUP BY\n"
                + "    c.course_id\n"
                + "),\n"
                + "ChapterCount AS (\n"
                + "  SELECT\n"
                + "    c.course_id,\n"
                + "    COUNT(*) AS chapter_count\n"
                + "  FROM\n"
                + "    Course c\n"
                + "  INNER JOIN Chapter ch ON c.course_id = ch.course_id\n"
                + "  GROUP BY\n"
                + "    c.course_id\n"
                + "),\n"
                + "LessonCount AS (\n"
                + "  SELECT\n"
                + "    ch.course_id,\n"
                + "    COUNT(*) AS lesson_count\n"
                + "  FROM\n"
                + "    Chapter ch\n"
                + "  INNER JOIN Lesson l ON ch.chapter_id = l.chapter_id\n"
                + "  GROUP BY\n"
                + "    ch.course_id\n"
                + ")\n"
                + "SELECT \n"
                + "  c.*, \n"
                + "  a.fullname, \n"
                + "  a.email,  -- Add instructor's email here\n"
                + "  COALESCE(cr.course_rate, 0) AS course_rate, \n"
                + "  cc.chapter_count, \n"
                + "  lc.lesson_count\n"
                + "FROM\n"
                + "  Course c \n"
                + "INNER JOIN Account a ON c.instructor_id = a.account_id \n"
                + "LEFT JOIN CourseRatings cr ON c.course_id = cr.course_id \n"
                + "LEFT JOIN ChapterCount cc ON c.course_id = cc.course_id \n"
                + "LEFT JOIN LessonCount lc ON c.course_id = lc.course_id \n"
                + "WHERE c.course_id = ?;";

        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setInt(1, course_id);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                byte[] imageData = rs.getBytes("image");
                String base64Image = new String(Base64.getEncoder().encode(imageData));
                Course1 course = new Course1();
                course.setCourse_id(course_id);
                course.setCourse_name(rs.getString("course_name"));
                course.setDescription(rs.getString("description"));
                course.setImage(base64Image);
                course.setPrice(rs.getFloat("price"));
                course.setDiscount(rs.getFloat("discount"));
                course.setSold(rs.getInt("sold"));
                course.setCreated_date(rs.getString("created_date"));
                course.setUpdated_date(rs.getString("updated_date"));
                course.setInstructor_id(rs.getInt("instructor_id"));
                course.setInstructor_name(rs.getString("fullname"));
                course.setInstructor_email(rs.getString("email"));
                course.setRate_course(rs.getDouble("course_rate"));
                course.setChapter_num(rs.getInt("chapter_count"));
                course.setLesson_num(rs.getInt("lesson_count"));
                return course;
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }

        return null;
    }

    public static void main(String[] args) {
        CourseDAO dao = new CourseDAO();
        System.out.println(dao.getAllCoursesByInsID(6));
    }
}
