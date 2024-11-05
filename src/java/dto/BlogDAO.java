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

    public boolean editBlog(String title, String content, String description, String fileName,
            String link, String created_date, String status, String marketer_id, String tag, String blogid) {
        String sql1 = "UPDATE [dbo].[Blog]\n"
                + "   SET [title] = ?\n"
                + "      ,[content] = ?\n"
                + "      ,[description] = ?\n"
                + "      ,[image] = ?\n"
                + "      ,[link] = ?\n"
                + "      ,[created_date] = ?\n"
                + "      ,[status] = ?\n"
                + "      ,[marketer_id] = ?\n"
                + "      ,[tag] = ?\n"
                + " WHERE id= ? ";
        
        String sql2 = "UPDATE [dbo].[Blog]\n"
                + "   SET [title] = ?\n"
                + "      ,[content] = ?\n"
                + "      ,[description] = ?\n"
                + "      ,[link] = ?\n"
                + "      ,[created_date] = ?\n"
                + "      ,[status] = ?\n"
                + "      ,[marketer_id] = ?\n"
                + "      ,[tag] = ?\n"
                + " WHERE id= ? ";
        
        if (fileName != null) {
            String pathToFile = "D:/Sem5_Fall2023/SWP391/image/";
            File avatarImage = new File(pathToFile + fileName);
            try ( InputStream avatarStream = new FileInputStream(avatarImage)) {
                PreparedStatement st = connection.prepareStatement(sql1);
                st.setString(1, title);
                st.setString(2, content);
                st.setString(3, description);
                st.setBinaryStream(4, avatarStream);
                st.setString(5, link);
                st.setString(6, created_date);
                st.setString(7, status);
                st.setString(8, marketer_id);
                st.setString(9, tag);
                st.setString(10, blogid);

                st.executeUpdate();
                return true;
            } catch (SQLException | IOException e) {
            }
        }
        else{
            try {
                PreparedStatement st = connection.prepareStatement(sql2);
                st.setString(1, title);
                st.setString(2, content);
                st.setString(3, description);
                st.setString(4, link);
                st.setString(5, created_date);
                st.setString(6, status);
                st.setString(7, marketer_id);
                st.setString(8, tag);
                st.setString(9, blogid);
                st.executeUpdate();
                return true;
            } catch (SQLException e) {

            }
        }
        return false;
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

    public boolean addBlog(String title, String content, String description, String fileName,
            String link, String status, String marketer_id, String tag) {
        String sql = "INSERT INTO [dbo].[Blog]\n"
                + "           ([title]\n"
                + "           ,[content]\n"
                + "           ,[description]\n"
                + "           ,[image]\n"
                + "           ,[link]\n"
                + "           ,[created_date]\n"
                + "           ,[status]\n"
                + "           ,[marketer_id]\n"
                + "           ,[tag])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,getdate()\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        if (fileName != null) {
            String pathToFile = "D:/Sem5_Fall2023/SWP391/image/";
            File avatarImage = new File(pathToFile + fileName);
            try ( InputStream avatarStream = new FileInputStream(avatarImage)) {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setString(1, title);
                st.setString(2, content);
                st.setString(3, description);
                st.setBinaryStream(4, avatarStream);
                st.setString(5, link);
                st.setString(6, status);
                st.setString(7, marketer_id);
                st.setString(8, tag);

                st.executeUpdate();
                return true;
            } catch (SQLException | IOException e) {
            }
        }
        return false;
    }
    
     public void deleteBlog(String id) {

        String sql = "delete from blog where id=?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            st.executeUpdate();
        } catch (Exception e) {

        }
    }

    public static void main(String[] args) {
        BlogDAO dao = new BlogDAO();
        Blog p1 = dao.getBlogByID("1");
        List<Blog> p2 = dao.getAllBlogByOwner("4");
        for (Blog blog : p2) {
            System.out.println(p2);
        }

    }
}
