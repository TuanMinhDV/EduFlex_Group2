package dto;

import model.CommentControlByAdmin;
import java.sql.*;
import java.util.ArrayList;
import model.AccountControlByAdmin;
import model.CourseControlByAdmin;
import model.ModelControlByAdmin;

public class CommentControllerByAdminDAO extends DBContext {

    PreparedStatement stm;
    ResultSet rs;

    public ArrayList<CommentControlByAdmin> getCommentsWithPagination(String keyword, String status, Date startCommentDate, Date endCommentDate, Date startReportDate, Date endReportDate, boolean reportedOnly, int limit, int offset) {
        ArrayList<CommentControlByAdmin> comments = new ArrayList<>();
        StringBuilder strSQL = new StringBuilder(
                "SELECT CL.comment_id, CL.account_id, CL.lesson_id, CL.comment, CL.comment_date, CL.status, "
                + "CR.cause, CR.report_date, A.username, L.lesson_name "
                + "FROM dbo.Comment_Lesson AS CL "
                + "LEFT JOIN dbo.Comment_Report AS CR ON CL.comment_id = CR.comment_id "
                + "LEFT JOIN dbo.Account AS A ON CL.account_id = A.account_id "
                + // Join thêm bảng Account
                "LEFT JOIN dbo.Lesson AS L ON CL.lesson_id = L.lesson_id "
                + // Join thêm bảng Lesson
                "WHERE 1=1 "
        );

        // Thêm điều kiện tìm kiếm cho keyword
        if (keyword != null && !keyword.isEmpty()) {
            strSQL.append(" AND (CL.comment LIKE ? OR A.username LIKE ? OR L.lesson_name LIKE ?)");
        }

        // Thêm điều kiện lọc
        if (status != null && !status.isEmpty()) {
            strSQL.append(" AND CL.status = ?");
        }
        if (startCommentDate != null) {
            strSQL.append(" AND CL.comment_date >= ?");
        }
        if (endCommentDate != null) {
            strSQL.append(" AND CL.comment_date <= ?");
        }
        if (startReportDate != null) {
            strSQL.append(" AND CR.report_date >= ?");
        }
        if (endReportDate != null) {
            strSQL.append(" AND CR.report_date <= ?");
        }

        // Điều kiện lọc bình luận có báo cáo
        if (reportedOnly) {
            strSQL.append(" AND CR.cause IS NOT NULL");
        }

        // Thêm điều kiện phân trang
        strSQL.append(" ORDER BY CL.comment_date DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY");

        try (PreparedStatement stm = connection.prepareStatement(strSQL.toString())) {
            int paramIndex = 1;

            // Gán giá trị cho các tham số
            if (keyword != null && !keyword.isEmpty()) {
                String keywordPattern = "%" + keyword + "%";
                stm.setString(paramIndex++, keywordPattern);  // Cho CL.comment
                stm.setString(paramIndex++, keywordPattern);  // Cho A.username
                stm.setString(paramIndex++, keywordPattern);  // Cho L.lesson_name
            }
            if (status != null && !status.isEmpty()) {
                stm.setString(paramIndex++, status);
            }
            if (startCommentDate != null) {
                stm.setDate(paramIndex++, startCommentDate);
            }
            if (endCommentDate != null) {
                stm.setDate(paramIndex++, endCommentDate);
            }
            if (startReportDate != null) {
                stm.setDate(paramIndex++, startReportDate);
            }
            if (endReportDate != null) {
                stm.setDate(paramIndex++, endReportDate);
            }

            stm.setInt(paramIndex++, offset);
            stm.setInt(paramIndex, limit);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int commentId = rs.getInt("comment_id");
                int accountId = rs.getInt("account_id");
                int lessonId = rs.getInt("lesson_id");
                String comment = rs.getString("comment");
                Date commentDate = rs.getDate("comment_date");
                String statusResult = rs.getString("status").equals("1") ? "active" : "blocked";
                String cause = rs.getString("cause");
                Date reportDate = rs.getDate("report_date");

                // Lấy thêm Account Name và Lesson Name từ ResultSet
                String accountName = rs.getString("username");
                String lessonName = rs.getString("lesson_name");

                // Tạo đối tượng CommentControlByAdmin và thêm vào danh sách
                CommentControlByAdmin commentObj = new CommentControlByAdmin(
                        commentId, accountId, lessonId, comment, commentDate, statusResult, cause, reportDate
                );
                comments.add(commentObj);
            }
        } catch (SQLException e) {
            System.out.println("Error in getCommentsWithPagination: " + e.getMessage());
        }
        return comments;
    }

    public boolean updateCommentStatus(int commentId, int newStatus) {
        String strSQL = "UPDATE dbo.Comment_Lesson SET status = ? WHERE comment_id = ?";

        try (PreparedStatement stm = connection.prepareStatement(strSQL)) {
            stm.setInt(1, newStatus);
            stm.setInt(2, commentId);

            int rowsAffected = stm.executeUpdate();
            return rowsAffected > 0; // Trả về true nếu cập nhật thành công
        } catch (SQLException e) {
            System.out.println("Error in updateCommentStatus: " + e.getMessage());
        }
        return false;
    }

    public AccountControlByAdmin getUserNameAccountById(int accountId) {
        String strSQL = "SELECT account_id, username, fullname, email, phone, otp, role_id, active "
                + "FROM dbo.Account WHERE account_id = ?";

        try (PreparedStatement stm = connection.prepareStatement(strSQL)) {
            stm.setInt(1, accountId);
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                int id = rs.getInt("account_id");
                String username = rs.getString("username");
                String fullname = rs.getString("fullname");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String otp = rs.getString("otp");
                String roleName = getRoleNameById(rs.getInt("role_id")); // Phương thức để lấy tên vai trò dựa trên role_id
                boolean status = rs.getBoolean("active");

                return new AccountControlByAdmin(id, username, fullname, email, phone, otp, roleName, status);
            }
        } catch (SQLException e) {
            System.out.println("Error in getUserNameAccountById: " + e.getMessage());
        }
        return null;
    }

// Phương thức phụ để lấy tên vai trò dựa trên role_id (nếu cần thiết)
    private String getRoleNameById(int roleId) {
        String roleName = "";
        String strSQL = "SELECT role_name FROM dbo.Role WHERE role_id = ?";

        try (PreparedStatement stm = connection.prepareStatement(strSQL)) {
            stm.setInt(1, roleId);
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                roleName = rs.getString("role_name");
            }
        } catch (SQLException e) {
            System.out.println("Error in getRoleNameById: " + e.getMessage());
        }
        return roleName;
    }

    public ModelControlByAdmin getLessonById(int lessonId) {
        String strSQL = "SELECT lesson_id, lesson_name FROM dbo.Lesson WHERE lesson_id = ?";

        try (PreparedStatement stm = connection.prepareStatement(strSQL)) {
            stm.setInt(1, lessonId);
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                int id = rs.getInt("lesson_id");
                String lessonName = rs.getString("lesson_name");

                return new ModelControlByAdmin(id, lessonName);
            }
        } catch (SQLException e) {
            System.out.println("Error in getLessonById: " + e.getMessage());
        }
        return null; // Trả về null nếu không tìm thấy bài học
    }

}
