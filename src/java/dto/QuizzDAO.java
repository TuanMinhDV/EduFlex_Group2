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
import model.Question;
import model.Quiz;

/**
 *
 * @author dungm
 */
public class QuizzDAO extends DBContext {

    protected PreparedStatement statement;
    protected ResultSet resultSet;

    // Question
    public List<Question> getAllQuestionsByQuizID(int quizID) {
        List<Question> listQues = new ArrayList<>();
        String sql = "SELECT [question_id]\n"
                + "      ,[content]\n"
                + "      ,[option1]\n"
                + "      ,[option2]\n"
                + "      ,[option3]\n"
                + "      ,[option4]\n"
                + "      ,[answer]\n"
                + "      ,[course_id]\n"
                + "      ,[quiz_id]\n"
                + "      ,[level]\n"
                + "  FROM [EduFlex2.4].[dbo].[Question] where quiz_id = ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, quizID);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("question_id");
                String content = resultSet.getString("content");
                String option1 = resultSet.getString("option1");
                String option2 = resultSet.getString("option2");
                String option3 = resultSet.getString("option3");
                String option4 = resultSet.getString("option4");
                int answer = resultSet.getInt("answer");
                int quiz_id = resultSet.getInt("quiz_id");
                int level = resultSet.getInt("level");

                Question ques = new Question(id, content, option1, option2, option3, option4, answer, quiz_id, level, 0);
                listQues.add(ques);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listQues;
    }

    public void addQuestion(Question newQuestion) {
        String sql = "INSERT INTO [dbo].[Question]\n"
                + "           ([content]\n"
                + "           ,[option1]\n"
                + "           ,[option2]\n"
                + "           ,[option3]\n"
                + "           ,[option4]\n"
                + "           ,[answer]\n"
                + "           ,[quiz_id])\n"
                + "     VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, newQuestion.getContent());
            statement.setString(2, newQuestion.getOption1());
            statement.setString(3, newQuestion.getOption2());
            statement.setString(4, newQuestion.getOption3());
            statement.setString(5, newQuestion.getOption4());
            statement.setInt(6, newQuestion.getAnswer());
            statement.setInt(7, newQuestion.getQuiz_id());
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void editQuestion(Question newQuestion) {
        String sql = "UPDATE [dbo].[Question]\n"
                + "   SET [content] = ?\n"
                + "      ,[option1] = ?\n"
                + "      ,[option2] = ?\n"
                + "      ,[option3] = ?\n"
                + "      ,[option4] = ?\n"
                + "      ,[answer] = ?\n"
                + " WHERE question_id = ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, newQuestion.getContent());
            statement.setString(2, newQuestion.getOption1());
            statement.setString(3, newQuestion.getOption2());
            statement.setString(4, newQuestion.getOption3());
            statement.setString(5, newQuestion.getOption4());
            statement.setInt(6, newQuestion.getAnswer());
            statement.setInt(7, newQuestion.getQuestion_id());
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteQuestion(int ques_ID) {
        String sql = "DELETE FROM [dbo].[Question]\n"
                + "      WHERE question_id = ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, ques_ID);
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public List<Question> searchByName(String txt, int quizzID) {
        List<Question> listQues = new ArrayList<>();
        String sql = "SELECT * from [dbo].[Question] where content like ? quiz_id = ? ";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, "%" + txt + "%");
            statement.setInt(2, quizzID);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("question_id");
                String content = resultSet.getString("content");
                String option1 = resultSet.getString("option1");
                String option2 = resultSet.getString("option2");
                String option3 = resultSet.getString("option3");
                String option4 = resultSet.getString("option4");
                int answer = resultSet.getInt("answer");
                int quiz_id = resultSet.getInt("quiz_id");
                int level = resultSet.getInt("level");

                Question ques = new Question(id, content, option1, option2, option3, option4, answer, quiz_id, level, 0);
                listQues.add(ques);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return listQues;
    }
    
    // Quizz
    public List<Quiz> getAllQuizzesByChapterID(int chapID) {
        List<Quiz> listQuiz = new ArrayList<>();
        String sql = "SELECT [quiz_id]\n"
                + "      ,[name]\n"
                + "      ,[chapter_id]\n"
                + "      ,[numOfQues], [isDisable]\n"
                + "  FROM [dbo].[Quiz] where chapter_id = ?\n";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, chapID);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("quiz_id");
                String name = resultSet.getString("name");
                int chap_ID = resultSet.getInt("chapter_id");
                int numOfQues = resultSet.getInt("numOfQues");
                int isDisable = resultSet.getInt("isDisable");
                Quiz quiz = new Quiz(id, name, chap_ID, numOfQues);
                quiz.setIsDisable(isDisable);
                listQuiz.add(quiz);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listQuiz;
    }

    public void addQuizz(Quiz newQuizz) {
        String sql = "INSERT INTO [dbo].[Quiz]\n"
                + "           ([name]\n"
                + "           ,[chapter_id])\n"
                + "     VALUES\n"
                + "           (?, ?)";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, newQuizz.getName());
            statement.setInt(2, newQuizz.getChapter_id());
            statement.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteQuizz(int quizzID) {
        String sql = "UPDATE [dbo].[Quiz]\n"
                + "   SET isDisable = 1\n"
                + "      WHERE quiz_id = ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, quizzID);
            statement.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void editQuizz(Quiz editedQuizz) {
        String sql = "UPDATE [dbo].[Quiz]\n"
                + "   SET [name] = ?\n"
                + " WHERE quiz_id = ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, editedQuizz.getName());
            statement.setInt(2, editedQuizz.getQuiz_id());
            statement.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        QuizzDAO dao = new QuizzDAO();
        System.out.println(dao.getAllQuestionsByQuizID(1));
    }
}
