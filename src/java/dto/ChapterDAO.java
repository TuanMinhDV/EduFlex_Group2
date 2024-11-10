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
 * @author dungm
 */
public class ChapterDAO extends DBContext {

    protected PreparedStatement statement;
    protected ResultSet resultSet;

    public List<Chapter> getChaptersByCourseID(int idC) {
        List<Chapter> listChaps = new ArrayList<>();
        String sql = "SELECT [chapter_id] ,[chapter_no] ,[chapter_name] ,[course_id], [isDisable] FROM [EduFlex2.4].[dbo].[Chapter] where course_id = ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, idC);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("chapter_id");
                int chap_no = resultSet.getInt("chapter_no");
                String name = resultSet.getString("chapter_name");
                int isDisable = resultSet.getInt("isDisable");
                int course_id = resultSet.getInt("course_id");
                Chapter chap = new Chapter(id, chap_no, name, course_id, isDisable);
                listChaps.add(chap);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listChaps;
    }
    
    public Chapter getChapterByChapterID(int chapID) {
        Chapter chap = new Chapter();
        String sql = "SELECT [chapter_id] ,[chapter_no] ,[chapter_name] ,[course_id], [isDisable] FROM [dbo].[Chapter] where chapter_id = ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, chapID);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("chapter_id");
                int chap_no = resultSet.getInt("chapter_no");
                String name = resultSet.getString("chapter_name");
                int course_id = resultSet.getInt("course_id");
                int isDisable = resultSet.getInt("isDisable");
                chap = new Chapter(id, chap_no, name, course_id, isDisable);
                return chap;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void addChapter(Chapter c) {
        String sql = "INSERT INTO [dbo].[Chapter]\n"
                + "           ([chapter_no]\n"
                + "           ,[chapter_name]\n"
                + "           ,[course_id])\n"
                + "     VALUES\n"
                + "           (?, ?, ?)";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, c.getChapter_no());
            statement.setString(2, c.getChapter_name());
            statement.setInt(3, c.getCourse_id());
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void editChapter(Chapter c) {
        String sql = "UPDATE [dbo].[Chapter]\n"
                + "   SET [chapter_name] = ?\n"
                + " WHERE chapter_id = ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, c.getChapter_name());
            statement.setInt(2, c.getChapter_id());
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void deleteChapter(int id) {
        String sql = "UPDATE [dbo].[Chapter]\n"
                + "   SET [isDisable] = 1\n"
                + " WHERE chapter_id = ?";
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
                int chap_no = resultSet.getInt("chapter_no");
                String name = resultSet.getString("chapter_name");
                int course_id = resultSet.getInt("course_id");
                int isDisable = resultSet.getInt("isDisable");
                Chapter chap = new Chapter(id, chap_no, name, course_id, isDisable);
                listAll.add(chap);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return listAll;
    }

    public static void main(String[] args) {
        ChapterDAO dao = new ChapterDAO();
        System.out.println(dao.getChaptersByCourseID(1));
    }

}
