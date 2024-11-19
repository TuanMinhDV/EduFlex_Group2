package dto;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Comment;

public class CommentDAO extends DBContext {

    PreparedStatement stm;
    ResultSet rs;

    public List<Comment> getCommentsByPage(
            int page, int pageSize,
            java.sql.Date startDate, java.sql.Date endDate,
            String status, boolean onlyReported,
            String searchKeyword,
            java.sql.Date startReportDate, java.sql.Date endReportDate) {
        List<Comment> comments = new ArrayList<>();
        String sql = "SELECT "
                + "    CL.comment_id, "
                + "    CL.account_id, "
                + "    A.username, "
                + "    CL.lesson_id, "
                + "    L.lesson_name, "
                + "    CL.comment, "
                + "    CL.comment_date, "
                + "    CL.status, "
                + "    CR.cause, "
                + "    CR.report_date "
                + "FROM "
                + "    dbo.Comment_Lesson AS CL "
                + "LEFT JOIN "
                + "    dbo.Comment_Report AS CR "
                + "    ON CL.comment_id = CR.comment_id "
                + "LEFT JOIN "
                + "    dbo.Account AS A "
                + "    ON CL.account_id = A.account_id "
                + "LEFT JOIN "
                + "    dbo.Lesson AS L "
                + "    ON CL.lesson_id = L.lesson_id "
                + "WHERE 1=1 ";

        // Thêm điều kiện lọc theo Comment Date
        if (startDate != null) {
            sql += " AND CL.comment_date >= ?";
        }
        if (endDate != null) {
            sql += " AND CL.comment_date <= ?";
        }

        // Thêm điều kiện lọc theo Report Date
        if (startReportDate != null) {
            sql += " AND CR.report_date >= ?";
        }
        if (endReportDate != null) {
            sql += " AND CR.report_date <= ?";
        }

        // Thêm điều kiện lọc theo status
        if (status != null && !status.isEmpty()) {
            sql += " AND CL.status = ?";
        }

        // Thêm điều kiện lọc chỉ bình luận bị report
        if (onlyReported) {
            sql += " AND CR.report_date IS NOT NULL";
        }

        // Thêm điều kiện tìm kiếm
        if (searchKeyword != null && !searchKeyword.isEmpty()) {
            sql += " AND (A.username LIKE ? OR L.lesson_name LIKE ? OR CL.comment LIKE ?)";
        }

        // Sắp xếp và phân trang
        sql += " ORDER BY CL.comment_date DESC "
                + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try {
            stm = connection.prepareStatement(sql);
            int paramIndex = 1;

            // Gán giá trị Comment Date
            if (startDate != null) {
                stm.setDate(paramIndex++, startDate);
            }
            if (endDate != null) {
                stm.setDate(paramIndex++, endDate);
            }

            // Gán giá trị Report Date
            if (startReportDate != null) {
                stm.setDate(paramIndex++, startReportDate);
            }
            if (endReportDate != null) {
                stm.setDate(paramIndex++, endReportDate);
            }

            // Gán giá trị status
            if (status != null && !status.isEmpty()) {
                stm.setString(paramIndex++, status);
            }

            // Gán giá trị tìm kiếm
            if (searchKeyword != null && !searchKeyword.isEmpty()) {
                String keyword = "%" + searchKeyword + "%";
                stm.setString(paramIndex++, keyword);
                stm.setString(paramIndex++, keyword);
                stm.setString(paramIndex++, keyword);
            }

            // Gán giá trị phân trang
            stm.setInt(paramIndex++, (page - 1) * pageSize);
            stm.setInt(paramIndex, pageSize);

            rs = stm.executeQuery();
            while (rs.next()) {
                Comment comment = new Comment(
                        rs.getInt("comment_id"),
                        rs.getInt("account_id"),
                        rs.getString("username"),
                        rs.getInt("lesson_id"),
                        rs.getString("lesson_name"),
                        rs.getString("comment"),
                        rs.getDate("comment_date"),
                        rs.getString("status"),
                        rs.getDate("report_date"),
                        rs.getString("cause")
                );
                comments.add(comment);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return comments;
    }

    // Lấy tổng số lượng bình luận
    public int getTotalComments() {
        String sql = "SELECT COUNT(*) AS total FROM dbo.Comment_Lesson";
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("total");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public boolean updateCommentStatus(int commentId, int newStatus) {
        String sql = "UPDATE dbo.Comment_Lesson SET status = ? WHERE comment_id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, newStatus);
            stm.setInt(2, commentId);
            int rowsAffected = stm.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

}
