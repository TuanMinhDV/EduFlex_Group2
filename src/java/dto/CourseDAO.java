/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

import java.lang.reflect.Array;
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
public class CourseDAO extends DBContext{
    protected PreparedStatement statement;
    protected ResultSet resultSet;
    
    public List<Course> getAllCoursesByInsID(int ins_id){
        List<Course> listAll = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Course] where instructor_id = ?";
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
                listAll.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listAll;
    }
    
    public static void main(String[] args) {
        CourseDAO dao = new CourseDAO();
        System.out.println(dao.getAllCoursesByInsID(3));
    }
}
