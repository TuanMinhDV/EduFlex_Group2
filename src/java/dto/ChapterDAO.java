/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Chapter;

/**
 *
 * @author dungBT
 */
public class ChapterDAO extends DBContext {

    protected PreparedStatement statement;
    protected ResultSet resultSet;

    public List<Chapter> getChaptersByCourseID(int courseID) {
        List<Chapter> listAll = new ArrayList();
        String sql = """
                     SELECT [chapter_id]
                           ,[chapter_name]
                           ,[course_id]
                           ,[isDisable]
                       FROM [dbo].[Chapter] where course_id = ?""";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, courseID);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("chapter_id");
                String name = resultSet.getString("chapter_name");
                int isDisable = resultSet.getInt("isDisable");
                int course_id = resultSet.getInt("course_id");
                Chapter chap = new Chapter(id, name, course_id, isDisable);
                listAll.add(chap);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listAll;
    }
    
    public static void main(String[] args) {
        ChapterDAO dao = new ChapterDAO();
        System.out.println(dao.getChaptersByCourseID(1));
    }
}
