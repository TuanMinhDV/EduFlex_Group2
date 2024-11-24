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
import model.Lesson;

/**
 *
 * @author dungm
 */
public class LessonDAO extends DBContext {

    protected PreparedStatement statement;
    protected ResultSet resultSet;

    public List<Lesson> getAllLessionsByChapterID(int chapterID) {
        List<Lesson> listLessons = new ArrayList<>();
        var sql = "SELECT [lesson_id]\n"
                + "      ,[lesson_name]\n"
                + "      ,[video]\n"
                + "      ,[document]\n"
                + "      ,[chapter_id]\n"
                + "      ,[description]\n"
                + "      ,[isDisable]\n"
                + "  FROM [dbo].[Lesson] where chapter_id = ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, chapterID);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("lesson_id");
                String name = resultSet.getString("lesson_name");
                String video = resultSet.getString("video");
                String document = resultSet.getString("document");
                int chap_id = resultSet.getInt("chapter_id");
                String desc = resultSet.getString("description");
                int isDisable = resultSet.getInt("isDisable");
                Lesson les = new Lesson(id, name, video, document, desc, chap_id, isDisable);
                listLessons.add(les);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listLessons;
    }

    public Lesson getLessonByID(int lesID) {
        Lesson les = new Lesson();
        String sql = "SELECT [lesson_id]\n"
                + "      ,[lesson_name]\n"
                + "      ,[video]\n"
                + "      ,[document]\n"
                + "      ,[chapter_id]\n"
                + "      ,[description]\n"
                + "      ,[isDisable]\n"
                + "  FROM [dbo].[Lesson] where lesson_id = ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, lesID);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("lesson_id");
                String name = resultSet.getString("lesson_name");
                String video = resultSet.getString("video");
                String document = resultSet.getString("document");
                int chap_id = resultSet.getInt("chapter_id");
                String desc = resultSet.getString("description");
                int isDisable = resultSet.getInt("isDisable");
                les = new Lesson(id, name, video, document, desc, chap_id, isDisable);
                return les;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void editLesson(Lesson les) {
        String sql = """
                     UPDATE [dbo].[Lesson]
                        SET [lesson_name] = ?
                           ,[video] = ?
                           ,[document] = ?
                      WHERE lesson_id = ?""";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, les.getName());
            statement.setString(2, les.getVideo());
            statement.setString(3, les.getDocument());
            statement.setInt(4, les.getId());
            statement.executeUpdate();
            connection.commit();
        } catch (SQLException e) {
            System.out.println(e);
            try {
                connection.rollback(); // Rollback nếu lỗi
            } catch (SQLException rollbackEx) {
                System.out.println(rollbackEx);
            }
        }
    }

    public void deleteLesson(int les_ID) {
        String sql = "UPDATE [dbo].[Lesson]\n"
                + "   SET isDisable = 1\n"
                + "      WHERE lesson_id = ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, les_ID);
            statement.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void addLesson(Lesson newLes) {
        String sql = "INSERT INTO [dbo].[Lesson] ([lesson_name] ,[video] ,[document] ,[chapter_id] ,[description]) VALUES (?, ?, ?, ?, ?)";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, newLes.getName());
            statement.setString(2, newLes.getVideo());
            statement.setString(3, newLes.getDocument());
            statement.setInt(4, newLes.getChapter_id());
            statement.setString(5, newLes.getDescription());
            statement.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        LessonDAO dao = new LessonDAO();
        Lesson newLes = dao.getLessonByID(47);
        newLes.setVideo("1234");
        System.out.println(newLes.getVideo());
        dao.editLesson(newLes);
        System.out.println(dao.getLessonByID(47).getVideo());
    }
}
