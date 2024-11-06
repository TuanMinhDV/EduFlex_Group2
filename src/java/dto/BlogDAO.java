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
import model.Account;
import model.Blog;

/**
 *
 * @author Admin
 */
public class BlogDAO extends DBContext {

    public List<Blog> getAllBlog() {
        List<Blog> listB = new ArrayList<>();
        String sql = "select b.id, b.title, b.content, b.description, b.image, b.link, b.created_date, b.status, b.marketer_id, b.tag, a.fullname from Blog b \n"
                + "join Account a on b.marketer_id = a.account_id\n"
                + "where a.role_id = 4\n"
                + "and b.status = 1\n"
                + "order by created_date desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                byte[] imageData = rs.getBytes("image");
                String base64Image = new String(Base64.getEncoder().encode(imageData));
                listB.add(new Blog(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), base64Image, rs.getString(6),
                        rs.getString(7), rs.getInt(8), rs.getInt(9), rs.getString(10), rs.getString(11)));
            }
            return listB;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listB;
    }

    public List<Blog> getAllTag() {
        List<Blog> listB = new ArrayList<>();
        String sql = "select b.id, b.title, b.content, b.description, b.image, b.link, b.created_date, b.status, b.marketer_id, b.tag, a.fullname from Blog b \n"
                + "join Account a on b.marketer_id = a.account_id\n"
                + "where a.role_id = 4\n"
                + "and b.status = 1\n"
                + "order by created_date desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                listB.add(new Blog(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getInt(8), rs.getInt(9), rs.getString(10), rs.getString(11)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listB;
    }

    public Blog getBlogByID(String id) {

        String sql = "select b.id, b.title, b.content, b.description, b.image, b.link, b.created_date, b.status, b.marketer_id, b.tag, a.fullname from Blog b \n"
                + "join Account a on b.marketer_id = a.account_id\n"
                + "where a.role_id = 4 and b.id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                byte[] imageData = rs.getBytes("image");
                String base64Image = new String(Base64.getEncoder().encode(imageData));
                Account a = new Account();

                return new Blog(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), base64Image, rs.getString(6),
                        rs.getString(7), rs.getInt(8), rs.getInt(9), rs.getString(10), rs.getString(11));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Blog getBlogWithMaxId() {
        String sql = "SELECT * FROM Blog WHERE id = (SELECT MAX(id) FROM Blog)";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                byte[] imageData = rs.getBytes("image");
                String base64Image = new String(Base64.getEncoder().encode(imageData));
                Blog blog = new Blog(
                        rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), base64Image, rs.getString(6),
                        rs.getString(7), rs.getInt(8), rs.getInt(9), rs.getString(10), ""
                );
                return blog;
            } else {
                return null;
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
            return null;
        }
    }

    public Blog getNextBlogByID(String id) {

        String sql = "select b.id, b.title, b.content, b.description, b.image, b.link, b.created_date, b.status, b.marketer_id, b.tag, a.fullname from Blog b \n"
                + "join Account a on b.marketer_id = a.account_id\n"
                + "where a.role_id = 4 and b.id > ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            Blog blog = null;
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                byte[] imageData = rs.getBytes("image");
                String base64Image = new String(Base64.getEncoder().encode(imageData));
                Account a = new Account();
                blog = new Blog(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), base64Image, rs.getString(6),
                        rs.getString(7), rs.getInt(8), rs.getInt(9), rs.getString(10), rs.getString(11));
                break;  // Exit loop after finding the first blog with a higher ID
            }

            return blog;
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

    public Blog getPreviousBlogByID(String id) {

        String sql = "select b.id, b.title, b.content, b.description, b.image, b.link, b.created_date, b.status, b.marketer_id, b.tag, a.fullname from Blog b \n"
                + "join Account a on b.marketer_id = a.account_id\n"
                + "where a.role_id = 4 and b.id < ?\n"
                + "order by b.id desc\n"
                + "limit 1";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            Blog blog = null;
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                byte[] imageData = rs.getBytes("image");
                String base64Image = new String(Base64.getEncoder().encode(imageData));
                Account a = new Account();
                blog = new Blog(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), base64Image, rs.getString(6),
                        rs.getString(7), rs.getInt(8), rs.getInt(9), rs.getString(10), rs.getString(11));
            }

            return blog;
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

    //search blog theo ten
    public List<Blog> searchByName(String search_raw) {
        List<Blog> listP = new ArrayList<>();
        String sql = "select b.id, b.title, b.content, b.description, b.image, b.link, b.created_date, b.status, b.marketer_id, b.tag, a.fullname from Blog b \n"
                + "join Account a on b.marketer_id = a.account_id \n"
                + "where b.title like ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + search_raw + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                byte[] imageData = rs.getBytes("image");
                String base64Image = new String(Base64.getEncoder().encode(imageData));
                Account a = new Account();
                listP.add(new Blog(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), base64Image, rs.getString(6),
                        rs.getString(7), rs.getInt(8), rs.getInt(9), rs.getString(10), rs.getString(11)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listP;
    }

    public List<Blog> getRelatedBlog() {
        List<Blog> listP = new ArrayList<>();

        String sql = "select top 5 b.id, b.title, b.content, b.description, b.image, b.link, b.created_date, b.status, b.marketer_id, b.tag, a.fullname from Blog b \n"
                + "join Account a on b.marketer_id = a.account_id\n"
                + "where a.role_id = 4\n"
                + "order by created_date desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                byte[] imageData = rs.getBytes("image");
                String base64Image = new String(Base64.getEncoder().encode(imageData));
                Account a = new Account();

                listP.add(new Blog(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), base64Image, rs.getString(6),
                        rs.getString(7), rs.getInt(8), rs.getInt(9), rs.getString(10), rs.getString(11)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listP;
    }

    public List<Blog> getRelatedBlogRecent(int id) {
        List<Blog> listP = new ArrayList<>();

        String sql = "select top 5 b.id, b.title, b.content, b.description, b.image, b.link, b.created_date, b.status, b.marketer_id, b.tag, a.fullname from Blog b \n"
                + "join Account a on b.marketer_id = a.account_id\n"
                + "where a.role_id = 4\n"
                + "and b.id <> ?\n"
                + "order by created_date desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                byte[] imageData = rs.getBytes("image");
                String base64Image = new String(Base64.getEncoder().encode(imageData));
                listP.add(new Blog(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), base64Image, rs.getString(6),
                        rs.getString(7), rs.getInt(8), rs.getInt(9), rs.getString(10), rs.getString(11)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listP;
    }

    public List<Blog> getAllBlogByOwner(String marketer_id) {
        List<Blog> listB = new ArrayList<>();
        String sql = "select b.id, b.title, b.content, b.description, b.image, b.link, b.created_date, b.status, b.marketer_id, b.tag, a.fullname from Blog b \n"
                + "join Account a on b.marketer_id = a.account_id\n"
                + "where a.role_id = 4\n"
                + "and b.marketer_id = ?\n"
                + "order by created_date desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, marketer_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                byte[] imageData = rs.getBytes("image");
                String base64Image = new String(Base64.getEncoder().encode(imageData));

                listB.add(new Blog(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), base64Image, rs.getString(6),
                        rs.getString(7), rs.getInt(8), rs.getInt(9), rs.getString(10), rs.getString(11)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listB;
    }

    public static void main(String[] args) {
        BlogDAO dao = new BlogDAO();
//        Blog maxBlog = dao.getBlogWithMaxId();
//        System.out.println(maxBlog);

//        Blog next = dao.getNextBlogByID("4");
//        System.out.println(next);
        List<Blog> list = dao.getAllBlog();
        System.out.println(list);
    }
}
