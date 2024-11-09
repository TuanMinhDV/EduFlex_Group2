/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Blog;
import model.Constants;
import model.Learner_Course;
import model.Slider;
import model.Course;

public class SliderDAO extends DBContext {

    public List<Slider> getAllSliderCourse() {
        List<Slider> listS = new ArrayList<>();
        String sql = "SELECT s.id, s.image, s.title, s.status, "
                + "s.link, s.marketer_id, s.type, "
                + "s.endtime, s.description, "
                + "a.fullname "
                + "FROM Slider s\n"
                + "JOIN Account a on s.marketer_id = a.account_id\n"
                + "WHERE a.role_id = 4\n"
                + "AND s.status = 1\n"
                + "AND s.type = 'Course'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                byte[] imageData = rs.getBytes("image");
                String base64Image = new String(Base64.getEncoder().encode(imageData));
                listS.add(new Slider(rs.getInt(1), base64Image, rs.getString(3),
                        rs.getInt(4), rs.getString(5), rs.getInt(6),
                        rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listS;
    }

    public List<Slider> getAllSliderBlog() {
        List<Slider> listS = new ArrayList<>();
        String sql = "SELECT s.id, s.image, s.title, s.status, s.link, "
                + "s.marketer_id, s.type, s.endtime, "
                + "s.description, a.fullname "
                + "FROM Slider s\n"
                + "JOIN Account a on s.marketer_id = a.account_id\n"
                + "WHERE a.role_id = 4\n"
                + "AND s.status = 1\n"
                + "AND s.type = 'Blog'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                byte[] imageData = rs.getBytes("image");
                String base64Image = new String(Base64.getEncoder().encode(imageData));
                listS.add(new Slider(rs.getInt(1), base64Image, rs.getString(3),
                        rs.getInt(4), rs.getString(5), rs.getInt(6),
                        rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listS;
    }

    public List<Slider> getAllSliderDiscount() {
        List<Slider> listS = new ArrayList<>();
        String sql = "SELECT s.id, "
                + "s.image, "
                + "s.title, "
                + "s.status, "
                + "s.link, "
                + "s.marketer_id, "
                + "s.type, s.endtime, "
                + "s.description, "
                + "a.fullname FROM Slider s\n"
                + "join Account a on s.marketer_id = a.account_id\n"
                + "where a.role_id = 4\n"
                + "and s.status = 1\n"
                + "and s.type = 'Discount'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                byte[] imageData = rs.getBytes("image");
                String base64Image = new String(Base64.getEncoder().encode(imageData));
                listS.add(new Slider(rs.getInt(1), base64Image, rs.getString(3),
                        rs.getInt(4), rs.getString(5), rs.getInt(6),
                        rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listS;
    }

    public Slider getSliderByID(String id) {

        String sql = "SELECT s.id, s.image, s.title, s.status, s.link, s.marketer_id, s.type, s.endtime, s.description, a.fullname from Slider s\n"
                + "JOIN Account a on s.marketer_id = a.account_id\n"
                + "WHERE a.role_id = 4\n"
                + "AND s.status = 1\n"
                + "AND s.id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                byte[] imageData = rs.getBytes("image");
                String base64Image = new String(Base64.getEncoder().encode(imageData));

                return new Slider(rs.getInt(1), base64Image, rs.getString(3),
                        rs.getInt(4), rs.getString(5), rs.getInt(6),
                        rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Slider getSliderEditByID(String id) {

        String sql = "select s.id, s.image, s.title, s.status, s.link, s.marketer_id, s.type, s.endtime, s.description, a.fullname from Slider s\n"
                + "join Account a on s.marketer_id = a.account_id\n"
                + "where a.role_id = 4\n"
                + "and s.id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                byte[] imageData = rs.getBytes("image");
                String base64Image = new String(Base64.getEncoder().encode(imageData));

                return new Slider(rs.getInt(1), base64Image, rs.getString(3),
                        rs.getInt(4), rs.getString(5), rs.getInt(6),
                        rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Slider> getAllSliderByOwner(String marketer_id) {
        List<Slider> listS = new ArrayList<>();
        String sql = "select s.id, s.image, s.title, s.status, s.link, s.marketer_id, s.type, s.endtime, s.description, a.fullname from Slider s\n"
                + "join Account a on s.marketer_id = a.account_id\n"
                + "where a.role_id = 4\n"
                + "and s.marketer_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, marketer_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                byte[] imageData = rs.getBytes("image");
                String base64Image = new String(Base64.getEncoder().encode(imageData));

                listS.add(new Slider(rs.getInt(1), base64Image, rs.getString(3),
                        rs.getInt(4), rs.getString(5), rs.getInt(6),
                        rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listS;
    }

    public boolean editSlider(String fileName, String title, String status, String link,
            String marketer_id, String type, String endtime, String description, String sliderid) {
        String sql1 = "UPDATE [dbo].[Slider]\n"
                + "   SET [image] = ?\n"
                + "      ,[title] = ?\n"
                + "      ,[status] = ?\n"
                + "      ,[link] = ?\n"
                + "      ,[marketer_id] = ?\n"
                + "      ,[type] = ?\n"
                + "      ,[endtime] = ?\n"
                + "      ,[description] = ?\n"
                + " WHERE id= ?";

        String sql2 = "UPDATE [dbo].[Slider]\n"
                + "   SET [title] = ?\n"
                + "      ,[status] = ?\n"
                + "      ,[link] = ?\n"
                + "      ,[marketer_id] = ?\n"
                + "      ,[type] = ?\n"
                + "      ,[endtime] = ?\n"
                + "      ,[description] = ?\n"
                + " WHERE id= ?";

        if (fileName != null) {
            //String pathToFile = "D:/Sem5_Fall2023/SWP391/image/";
            File avatarImage = new File(Constants.SAVE_PATH + fileName);
            try (InputStream avatarStream = new FileInputStream(avatarImage)) {
                PreparedStatement st = connection.prepareStatement(sql1);
                st.setBinaryStream(1, avatarStream);
                st.setString(2, title);
                st.setString(3, status);
                st.setString(4, link);
                st.setString(5, marketer_id);
                st.setString(6, type);
                st.setString(7, endtime);
                st.setString(8, description);
                st.setString(9, sliderid);

                st.executeUpdate();
                return true;
            } catch (SQLException | IOException e) {
            }
        } else {
            try {
                PreparedStatement st = connection.prepareStatement(sql2);
                st.setString(1, title);
                st.setString(2, status);
                st.setString(3, link);
                st.setString(4, marketer_id);
                st.setString(5, type);
                st.setString(6, endtime);
                st.setString(7, description);
                st.setString(8, sliderid);
                st.executeUpdate();
                return true;
            } catch (SQLException e) {

            }
        }
        return false;
    }

    public boolean addSlider(String fileName, String title, String status, String link,
            String marketer_id, String type, String endtime, String description) {
        String sql = "INSERT INTO [dbo].[Slider]\n"
                + "           ([image]\n"
                + "           ,[title]\n"
                + "           ,[status]\n"
                + "           ,[link]\n"
                + "           ,[marketer_id]\n"
                + "           ,[type]\n"
                + "           ,[endtime]\n"
                + "           ,[description])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        if (fileName != null) {
            //String pathToFile = "D:/Sem5_Fall2023/SWP391/image/";
            File avatarImage = new File(Constants.SAVE_PATH + fileName);
            try (InputStream avatarStream = new FileInputStream(avatarImage)) {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setBinaryStream(1, avatarStream);
                st.setString(2, title);
                st.setString(3, status);
                st.setString(4, link);
                st.setString(5, marketer_id);
                st.setString(6, type);
                st.setString(7, endtime);
                st.setString(8, description);

                st.executeUpdate();
                return true;
            } catch (SQLException | IOException e) {
            }
        }
        return false;
    }

    public void deleteSlider(String id) {

        String sql = "delete from slider where id=?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            st.executeUpdate();
        } catch (Exception e) {

        }
    }

    public List<Course> getHaloweenDiscountCourse() {
        List<Course> list = new ArrayList<>();
        String query = "SELECT\n"
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
                + "FROM Course\n"
                + "INNER JOIN Account ON Course.lecturer_id = Account.account_id\n"
                + "WHERE MONTH(created_date) = 10\n"
                + "and discount > 0";
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

    public List<Course> getAutumnDiscountCourse() {
        List<Course> list = new ArrayList<>();
        String query = "SELECT\n"
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
                + "FROM Course\n"
                + "INNER JOIN Account ON Course.lecturer_id = Account.account_id\n"
                + "WHERE MONTH(created_date) between 8 and 10\n"
                + "and discount > 0";
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

    public List<Course> getChristmasDiscountCourse() {
        List<Course> list = new ArrayList<>();
        String query = "SELECT\n"
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
                + "FROM Course\n"
                + "INNER JOIN Account ON Course.lecturer_id = Account.account_id\n"
                + "WHERE DAY(created_date) between 12 and 25\n"
                + "and MONTH(created_date) = 12\n"
                + "and discount > 0";
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

    public List<Learner_Course> getAllMyCourse(String learner_id) throws SQLException {
        List<Learner_Course> list = new ArrayList<>();
        String sql = "SELECT lc.*, a.account_id, a.fullname, s.course_name, s.image, s.instructor_id, accsub.fullname AS instructor_name "
                + "FROM Learner_Course lc "
                + "INNER JOIN Course s ON lc.course_id = s.course_id "
                + "INNER JOIN Account a ON a.account_id = lc.learner_id "
                + "INNER JOIN Account accsub ON accsub.account_id = s.instructor_id "
                + "WHERE lc.active = 1 AND lc.learner_id = ?";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, learner_id);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Learner_Course ls = new Learner_Course();
                ls.setId(rs.getInt("id"));
                ls.setLearner_id(rs.getInt("learner_id"));
                ls.setCourse_id(rs.getInt("course_id"));
                ls.setEnrolled_date(rs.getString("enrolled_date"));
                ls.setEnd_date(rs.getString("end_date"));
                ls.setActive(rs.getInt("active"));
                ls.setStatus(rs.getInt("status"));
                ls.setAccount_id(rs.getInt("account_id"));
                ls.setFullname(rs.getString("fullname"));
                ls.setCourse_name(rs.getString("course_name"));

                // Handle image data efficiently:
                byte[] imageData = rs.getBytes("image");
                if (imageData != null) {
                    ls.setImage(new String(Base64.getEncoder().encode(imageData)));
                }

                ls.setInstructor_id(rs.getInt("instructor_id"));
                ls.setInstructor_name(rs.getString("instructor_name"));
                ls.setRate(rs.getInt("rate"));

                list.add(ls);
            }
        }catch (SQLException e) {
        }

        return list;
    }


    public static void main(String[] args) {
        SliderDAO dao = new SliderDAO();
        try {
            List<Learner_Course> ls1 = dao.getAllMyCourse(2+"");
            System.out.println(ls1);
        } catch (SQLException ex) {
            Logger.getLogger(SliderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        Slider s2 = dao.getSliderByID("1");
        List<Slider> ls3 = dao.getAllSliderDiscount();

        
    }
}
