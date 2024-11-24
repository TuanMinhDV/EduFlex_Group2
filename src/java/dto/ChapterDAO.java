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
    
    public Chapter getChapterByChapterID(int chapID) {
        Chapter chap = new Chapter();
        var sql = "SELECT [chapter_id] ,[chapter_name] ,[course_id], [isDisable] FROM [dbo].[Chapter] where chapter_id = ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, chapID);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("chapter_id");
                String name = resultSet.getString("chapter_name");
                int course_id = resultSet.getInt("course_id");
                int isDisable = resultSet.getInt("isDisable");
                chap = new Chapter(id, name, course_id, isDisable);
                return chap;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void addChapter(Chapter c) {
        String sql = """
                     INSERT INTO [dbo].[Chapter]
                                ([chapter_name]
                                ,[course_id])
                          VALUES
                                (?, ?)""";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, c.getName());
            statement.setInt(2, c.getCourse_id());
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void editChapter(Chapter c) {
        String sql = """
                     UPDATE [dbo].[Chapter]
                        SET [chapter_name] = ?
                      WHERE chapter_id = ?""";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, c.getName());
            statement.setInt(2, c.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void deleteChapter(int id) {
        String sql = """
                     UPDATE [dbo].[Chapter]
                        SET [isDisable] = 1
                      WHERE chapter_id = ?""";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public List<Chapter> searchByName(String txt, int courseID) {
        List<Chapter> listAll = new ArrayList<>();
        String sql = "SELECT * from [dbo].[Chapter] where [chapter_name] like ? and course_id = ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, "%" + txt + "%");
            statement.setInt(2, courseID);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("chapter_id");
                String name = resultSet.getString("chapter_name");
                int course_id = resultSet.getInt("course_id");
                int isDisable = resultSet.getInt("isDisable");
                Chapter chap = new Chapter(id, name, course_id, isDisable);
                listAll.add(chap);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return listAll;
    }
    
    public static void main(String[] args) {
        ChapterDAO dao = new ChapterDAO();
        System.out.println(dao.searchByName("e", 1));
    }
}
