/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto.instructor;

import dto.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Course;

/**
 *
 * @author dungm
 */
public class CourseDAO extends DBContext {

    protected PreparedStatement statement;
    protected ResultSet resultSet;

    public java.util.List<Course> getAllCourses() {
        java.util.List<Course> listAll = new ArrayList<>();
        String sql = "SELECT [course_id] ,[course_name] ,[description] ,[image] ,[created_date] ,[updated_date] ,[price] ,[discount] ,[sold] ,[category_id] ,[instructor_id], [isDisable] FROM [dbo].[Course]";
        try {
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("course_id");
                String name = resultSet.getString("course_name");
                String img = resultSet.getString("image");
                Date createDate = resultSet.getDate("created_date");
                Date updateDate = resultSet.getDate("updated_date");
                float price = resultSet.getFloat("price");
                float discount = resultSet.getFloat("discount");
                int sold = resultSet.getInt("sold");
                int category_id = resultSet.getInt("category_id");
                int instructor_id = resultSet.getInt("instructor_id");
                String des = resultSet.getString("description");
                int isDisable = resultSet.getInt("isDisable");
                Course course = new Course(id, name, des, img, createDate, updateDate, price, discount, sold, category_id, instructor_id, isDisable);
                listAll.add(course);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listAll;
    }

    public void updateCourse(Course c) {
        String sql = "UPDATE [dbo].[Course] SET [course_name] = ? ,[description] = ? ,[image] = ? ,[price] = ? ,[discount] = ?,[category_id] = ? WHERE course_id = ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, c.getCourse_name());
            statement.setString(2, c.getDescription());
            statement.setString(3, c.getImage());
            statement.setFloat(4, c.getPrice());
            statement.setFloat(5, c.getDiscount());
            statement.setInt(6, c.getCategory_id());
            statement.setInt(7, c.getCourse_id());
            statement.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Course getCourseByID(int idC) {
        var sql = "select [course_id]\n"
                + "      ,[course_name]\n"
                + "      ,[description]\n"
                + "      ,[image]\n"
                + "      ,[created_date]\n"
                + "      ,[updated_date]\n"
                + "      ,[price]\n"
                + "      ,[discount]\n"
                + "      ,[sold]\n"
                + "      ,[category_id]\n"
                + "      ,[instructor_id]\n"
                + "      ,[isDisable] FROM [dbo].[Course] where course_id = ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, idC);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("course_id");
                String name = resultSet.getString("course_name");
                String img = resultSet.getString("image");
                Date createDate = resultSet.getDate("created_date");
                Date updateDate = resultSet.getDate("updated_date");
                float price = resultSet.getFloat("price");
                float discount = resultSet.getFloat("discount");
                int sold = resultSet.getInt("sold");
                int category_id = resultSet.getInt("category_id");
                int instructor_id = resultSet.getInt("instructor_id");
                String des = resultSet.getString("description");
                int isDisable = resultSet.getInt("isDisable");
                Course course = new Course(idC, name, des, img, createDate, updateDate, price, discount, sold, category_id, instructor_id, isDisable);
                return course;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Category> getAllCategory() {
        List<Category> listAll = new ArrayList<>();
        var sql = "SELECT [category_id]\n"
                + "      ,[category_name]\n"
                + "  FROM [dbo].[Category]";
        try {
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("category_id");
                String name = resultSet.getString("category_name");
                Category cate = new Category(id, name);
                listAll.add(cate);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listAll;
    }

    public void addCourse(Course c) {
        String sql = "INSERT INTO [dbo].[Course]\n"
                + "           ([course_name]\n"
                + "           ,[description]\n"
                + "           ,[image]\n"
                + "           ,[price]\n"
                + "           ,[discount]\n"
                + "           ,[category_id])\n"
                + "     VALUES \n"
                + "           (?, ?, ?, ?, ?, ?)";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, c.getCourse_name());
            statement.setString(2, c.getDescription());
            statement.setString(3, c.getImage());
            statement.setFloat(4, c.getPrice());
            statement.setFloat(5, c.getDiscount());
            statement.setInt(6, c.getCategory_id());
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteCourse(int id) {
        String sql = "UPDATE [dbo].[Course]\n"
                + "   SET [isDisable] = ?"
                + " WHERE course_id = ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setBoolean(1, true);
            statement.setInt(2, id);
            resultSet = statement.executeQuery();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Course> searchByName(String txt) {
        List<Course> listAll = new ArrayList<>();
        String sql = "SELECT * from [dbo].[Course] where course_name like ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, "%" + txt + "%");
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("course_id");
                String name = resultSet.getString("course_name");
                String img = resultSet.getString("image");
                Date createDate = resultSet.getDate("created_date");
                Date updateDate = resultSet.getDate("updated_date");
                float price = resultSet.getFloat("price");
                float discount = resultSet.getFloat("discount");
                int sold = resultSet.getInt("sold");
                int category_id = resultSet.getInt("category_id");
                int instructor_id = resultSet.getInt("instructor_id");
                String des = resultSet.getString("description");
                int isDisable = resultSet.getInt("isDisable");
                Course course = new Course(id, name, des, img, createDate, updateDate, price, discount, sold, category_id, instructor_id, isDisable);
                listAll.add(course);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return listAll;
    }
    
    public static void main(String[] args) {
        CourseDAO dao = new CourseDAO();
        System.out.println(dao.searchByName("a"));
    }
}
