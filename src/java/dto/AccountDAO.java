package dto;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.Instant;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Constants;
import model.Role;

public class AccountDAO extends DBContext {

    PreparedStatement stm;
    ResultSet rs;

    //login
    public Account login(String username, String password) {
        String sql = "SELECT * FROM Account\n"
                + "WHERE username = ? AND [password] = ? ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                byte[] imageData = null;
                String base64Avatar = "";
                if (rs.getString("avatar") != null) {
                    imageData = rs.getBytes("avatar");
                    base64Avatar = new String(Base64.getEncoder().encode(imageData));
                }
                Account acc = new Account();
                acc.setAccount_id(rs.getInt("account_id"));
                acc.setUsername(rs.getString("username"));
                acc.setPassword(rs.getString("password"));
                acc.setFullname(rs.getString("fullname"));
                acc.setEmail(rs.getString("email"));
                acc.setDob(rs.getString("dob"));
                acc.setPhone(rs.getString("phone"));
                if (imageData != null) {
                    acc.setAvatar(base64Avatar);
                }
                acc.setOtp(rs.getString("otp"));
                acc.setActive(rs.getInt("active"));
                acc.setRole_id(rs.getInt("role_id"));
                return acc;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    //Check Email Exist
    public boolean checkEmail(String email) {
        try {
            PreparedStatement ps;
            ResultSet rs;
            String sql = "SELECT * FROM [Account] where email = ?";
            ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    //Find Account Exist
    public Account findByAccount(String username) {
        try {
            PreparedStatement ps;
            ResultSet rs;
            String sql = "SELECT * FROM [Account] where username = ? ";
            ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                byte[] imageData = null;
                String base64Avatar = "";
                if (rs.getString("avatar") != null) {
                    imageData = rs.getBytes("avatar");
                    base64Avatar = new String(Base64.getEncoder().encode(imageData));
                }
                Account acc = new Account();
                acc.setAccount_id(rs.getInt("account_id"));
                acc.setUsername(rs.getString("username"));
                acc.setPassword(rs.getString("password"));
                acc.setFullname(rs.getString("fullname"));
                acc.setEmail(rs.getString("email"));
                acc.setDob(rs.getString("dob"));
                acc.setPhone(rs.getString("phone"));
                if (imageData != null) {
                    acc.setAvatar(base64Avatar);
                }
                acc.setOtp(rs.getString("otp"));
                acc.setActive(rs.getInt("active"));
                acc.setRole_id(rs.getInt("role_id"));
                return acc;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    //Find Email Exist
    public Account findByEmail(String email) {

        try {
            PreparedStatement ps;
            ResultSet rs;
            String sql = "SELECT * FROM [Account] where email = ? ";
            ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            while (rs.next()) {
                byte[] imageData = null;
                String base64Avatar = "";
                if (rs.getString("avatar") != null) {
                    imageData = rs.getBytes("avatar");
                    base64Avatar = new String(Base64.getEncoder().encode(imageData));
                }
                Account acc = new Account();
                acc.setAccount_id(rs.getInt("account_id"));
                acc.setUsername(rs.getString("username"));
                acc.setPassword(rs.getString("password"));
                acc.setFullname(rs.getString("fullname"));
                acc.setEmail(rs.getString("email"));
                acc.setDob(rs.getString("dob"));
                acc.setPhone(rs.getString("phone"));
                if (imageData != null) {
                    acc.setAvatar(base64Avatar);
                }
                acc.setOtp(rs.getString("otp"));
                acc.setActive(rs.getInt("active"));
                acc.setRole_id(rs.getInt("role_id"));
                return acc;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    //Verify OTP
    public void verify(String username) {
        PreparedStatement ps;
        try {
            String sql = "update [Account] set active = 1 where username=?";
            ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.executeUpdate();
            sql = "update [Account] set otp = null where username=?";
            ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //register không mã hóa
    public void register(String username, String password, String fullname,
            String dob, String email) {
        /* Bỏ mã hóa
        try {
            password = new MD5Encryption().convertPassword(password);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }*/

        try {
            String sql = "INSERT into Account(username, [password], "
                    + "fullname, email, dob, "
                    + "active, role_id)\n"
                    + "values(?,?,?,?,?,'1','2')";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, fullname);
            ps.setString(4, email);
            ps.setString(5, dob);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    // find account by user name
    public boolean checkExistedUsername(String username) {
        String sql = "select * from Account\n"
                + "where username = ? and active in(1,2)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
        }
        return false;
    }

    //check email is existed
    public boolean checkExistedEmail(String email) {
        String sql = "select * from Account\n"
                + "where email = ? and active in (1,2)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
        }
        return false;
    }

    // find account by email
    public Account findAccountByEmail(String email) {
        String sql = "select * from Account\n"
                + "where email = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                byte[] imageData = null;
                String base64Avatar = "";
                if (rs.getString("avatar") != null) {
                    imageData = rs.getBytes("avatar");
                    base64Avatar = new String(Base64.getEncoder().encode(imageData));
                }
                Account acc = new Account();
                acc.setAccount_id(rs.getInt("account_id"));
                acc.setUsername(rs.getString("username"));
                acc.setPassword(rs.getString("password"));
                acc.setFullname(rs.getString("fullname"));
                acc.setEmail(rs.getString("email"));
                acc.setDob(rs.getString("dob"));
                acc.setPhone(rs.getString("phone"));
                if (imageData != null) {
                    acc.setAvatar(base64Avatar);
                }
                acc.setOtp(rs.getString("otp"));
                acc.setActive(rs.getInt("active"));
                acc.setRole_id(rs.getInt("role_id"));
                return acc;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public boolean updateProfile(String fullname, String dob, String phone, String fileName, int account_id) {
        String query1 = "UPDATE [dbo].[Account]\n"
                + "   SET [fullname] = ?\n"
                + "      ,[dob] = ?\n"
                + "      ,[phone] = ?\n"
                + "      ,[avatar] = ?\n"
                + " WHERE account_id = ?";

        String query2 = "UPDATE [dbo].[Account]\n"
                + "   SET [fullname] = ?\n"
                + "      ,[dob] = ?\n"
                + "      ,[phone] = ?\n"
                + " WHERE account_id = ?";
        if (fileName != null) {
            String pathToFile = Constants.SAVE_PATH;
            //String pathToFile = "";
            File avatarImage = new File(pathToFile + fileName);
            try (InputStream avatarStream = new FileInputStream(avatarImage)) {
                PreparedStatement st = connection.prepareStatement(query1);
                st.setString(1, fullname);
                st.setString(2, dob);
                st.setString(3, phone);
                st.setBinaryStream(4, avatarStream);
                st.setInt(5, account_id);
                st.executeUpdate();
                return true;
            } catch (SQLException | IOException e) {
            }
        } else {
            try {
                PreparedStatement st = connection.prepareStatement(query2);
                st.setString(1, fullname);
                st.setString(2, dob);
                st.setString(3, phone);
                st.setInt(4, account_id);
                st.executeUpdate();
                return true;
            } catch (SQLException e) {

            }
        }
        return false;
    }

    public void updateOTP(String email, String otp) {
        PreparedStatement ps;
        try {
            String sql = "UPDATE [Account] SET otp = ? WHERE email=?";
            ps = connection.prepareStatement(sql);
            ps.setString(1, otp);
            ps.setString(2, email);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //Change password
    public void resetPassword(String username, String password) {
        PreparedStatement ps;
        try {
            String sql = "update [Account] set otp code = null where username=?";
            ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Change password
    public void changePassword(String username, String newPass) {
        String sql = "update Account\n"
                + "set [password] = ?\n"
                + "where username = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, newPass);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public Account getAccountById(int account_id) {
        String query = "SELECT [account_id]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[fullname]\n"
                + "      ,[email]\n"
                + "      ,[dob]\n"
                + "      ,[phone]\n"
                + "      ,[avatar]\n"
                + "      ,[otp]\n"
                + "      ,[active]\n"
                + "      ,[role_id]\n"
                + "  FROM [dbo].[Account]\n"
                + "  WHERE account_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setInt(1, account_id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                byte[] imageData = rs.getBytes("avatar");
                String base64Avatar = new String(Base64.getEncoder().encode(imageData));
                Account acc = new Account();
                acc.setAccount_id(rs.getInt("account_id"));
                acc.setUsername(rs.getString("username"));
                acc.setPassword(rs.getString("password"));
                acc.setFullname(rs.getString("fullname"));
                acc.setEmail(rs.getString("email"));
                acc.setDob(rs.getString("dob"));
                acc.setPhone(rs.getString("phone"));
                acc.setAvatar(base64Avatar);
                acc.setOtp(rs.getString("otp"));
                acc.setActive(rs.getInt("active"));
                acc.setRole_id(rs.getInt("role_id"));
                return acc;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public Account getAccountProfile(Integer account_id) {
        String query = "select a.account_id, a.username, a.[password], a.fullname,"
                + "a.email, a.dob, a.phone, a.avatar, "
                + "r.role_name from Account a \n"
                + "JOIN [Role] r on a.role_id = r.role_id\n"
                + "where a.account_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setInt(1, account_id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                byte[] imageData = rs.getBytes("avatar");
                String base64Avatar = new String(Base64.getEncoder().encode(imageData));
                Account acc = new Account();
                acc.setAccount_id(rs.getInt("account_id"));
                acc.setUsername(rs.getString("username"));
                acc.setPassword(rs.getString("password"));
                acc.setFullname(rs.getString("fullname"));
                acc.setEmail(rs.getString("email"));
                acc.setDob(rs.getString("dob"));
                acc.setPhone(rs.getString("phone"));
                acc.setAvatar(base64Avatar);
//                acc.setOtp(rs.getString("otp"));
//                acc.setActive(rs.getInt("active"));
//                acc.setRole_id(rs.getInt("role_id"));
                // acc.setRoleName(rs.getString("role_name"));

                return acc;
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public Boolean countdown(int seconds) {
        boolean isCounting = true;
        for (int i = seconds; i >= 0; i--) {
            System.out.println(i);
            try {
                Thread.sleep(1000); // Ngừng 1 giây
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        isCounting = false;
        System.out.println("Hết giờ!");
        return isCounting;
    }

    public void deleteOTP() {
        try {
            PreparedStatement ps;
            String sql = "UPDATE Account\n"
                    + "SET otp = NULL\n"
                    + "WHERE otp IS NOT NULL;";
            ps = connection.prepareStatement(sql);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public String getOTP(String email) {
        PreparedStatement ps;
        try {
            String otpDB = "";
            String sql = "SELECT otp FROM [Account] WHERE email=?";
            ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                otpDB = rs.getString("otp");
            }
            return otpDB;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int getTotalAccounts(String searchQuery, String role, String status) {
        StringBuilder sql = new StringBuilder("SELECT COUNT(*) AS total FROM Account WHERE 1=1");

        // Điều kiện tìm kiếm
        if (searchQuery != null && !searchQuery.isEmpty()) {
            sql.append(" AND (username LIKE ? OR fullname LIKE ? OR email LIKE ? OR phone LIKE ?)");
        }
        if (role != null && !role.isEmpty()) {
            sql.append(" AND role_id = ?");
        }
        if (status != null && !status.isEmpty()) {
            sql.append(" AND active = ?");
        }

        try {
            stm = connection.prepareStatement(sql.toString());

            int paramIndex = 1;
            if (searchQuery != null && !searchQuery.isEmpty()) {
                String likeQuery = "%" + searchQuery + "%";
                stm.setString(paramIndex++, likeQuery);
                stm.setString(paramIndex++, likeQuery);
                stm.setString(paramIndex++, likeQuery);
                stm.setString(paramIndex++, likeQuery);
            }
            if (role != null && !role.isEmpty()) {
                stm.setInt(paramIndex++, Integer.parseInt(role));
            }
            if (status != null && !status.isEmpty()) {
                stm.setInt(paramIndex++, Integer.parseInt(status));
            }

            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public ArrayList<Account> getListAccountBySearchAndFilter(String searchQuery, String role, String status, int page, int pageSize) {
        ArrayList<Account> accounts = new ArrayList<>();
        int offset = (page - 1) * pageSize;
        StringBuilder sql = new StringBuilder("SELECT a.account_id, a.username, a.fullname, a.email, a.phone, a.otp, a.role_id, r.role_name, a.active "
                + "FROM Account AS a JOIN Role AS r ON a.role_id = r.role_id WHERE 1=1");

        // Điều kiện tìm kiếm
        if (searchQuery != null && !searchQuery.isEmpty()) {
            sql.append(" AND (a.username LIKE ? OR a.fullname LIKE ? OR a.email LIKE ? OR a.phone LIKE ?)");
        }
        if (role != null && !role.isEmpty()) {
            sql.append(" AND a.role_id = ?");
        }
        if (status != null && !status.isEmpty()) {
            sql.append(" AND a.active = ?");
        }

        sql.append(" ORDER BY a.account_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY");

        try {
            stm = connection.prepareStatement(sql.toString());

            int paramIndex = 1;
            if (searchQuery != null && !searchQuery.isEmpty()) {
                String likeQuery = "%" + searchQuery + "%";
                stm.setString(paramIndex++, likeQuery);
                stm.setString(paramIndex++, likeQuery);
                stm.setString(paramIndex++, likeQuery);
                stm.setString(paramIndex++, likeQuery);
            }
            if (role != null && !role.isEmpty()) {
                stm.setInt(paramIndex++, Integer.parseInt(role));
            }
            if (status != null && !status.isEmpty()) {
                stm.setInt(paramIndex++, Integer.parseInt(status));
            }

            stm.setInt(paramIndex++, offset);
            stm.setInt(paramIndex++, pageSize);

            rs = stm.executeQuery();

            while (rs.next()) {
                Account account = new Account();
                account.setAccount_id(rs.getInt("account_id"));
                account.setUsername(rs.getString("username"));
                account.setFullname(rs.getString("fullname"));
                account.setEmail(rs.getString("email"));
                account.setPhone(rs.getString("phone"));
                account.setOtp(rs.getString("otp"));
                account.setRole_id(rs.getInt("role_id"));
                account.setRoleName(rs.getString("role_name"));
                account.setActive(rs.getInt("active"));
                accounts.add(account);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return accounts;
    }

    // Phương thức lấy danh sách Role
    public ArrayList<Role> getListRoleByAdmin() {
        ArrayList<Role> roles = new ArrayList<>();
        String sql = "SELECT role_id, role_name FROM Role";

        try {
            stm = connection.prepareStatement(sql);  // Sử dụng 'connection' có sẵn
            rs = stm.executeQuery();

            while (rs.next()) {
                Role role = new Role();
                role.setRole_Id(rs.getInt("role_id"));
                role.setRole_Name(rs.getString("role_name"));
                roles.add(role);
            }
        } catch (SQLException e) {
            System.out.println("Error in getListRoleByAdmin: " + e.getMessage());
        }

        return roles;
    }

    public boolean updateAccountRole(int accountId, int newRoleId) {
        String sql = "UPDATE Account SET role_id = ? WHERE account_id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, newRoleId);
            stm.setInt(2, accountId);

            int rowsUpdated = stm.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Account getAccountByIdByAdmin(int accountId) {
        Account account = null;
        String sql = "SELECT a.account_id, a.username, a.fullname, a.email, a.role_id, r.role_name, a.active "
                + "FROM Account AS a "
                + "JOIN Role AS r ON a.role_id = r.role_id "
                + "WHERE a.account_id = ?";

        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, accountId);

            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                account = new Account();
                account.setAccount_id(rs.getInt("account_id"));
                account.setUsername(rs.getString("username"));
                account.setFullname(rs.getString("fullname"));
                account.setEmail(rs.getString("email"));
                account.setRole_id(rs.getInt("role_id"));
                account.setRoleName(rs.getString("role_name"));  // Join to get role_name from Role table
                account.setActive(rs.getInt("active"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return account;
    }

   public boolean updateAccountStatus(int accountId, boolean newStatus) {
    String sql = "UPDATE Account SET active = ? WHERE account_id = ?";
    try (PreparedStatement stm = connection.prepareStatement(sql)) {
        stm.setBoolean(1, newStatus); // true = 1, false = 0
        stm.setInt(2, accountId);
        int rowsUpdated = stm.executeUpdate();
        return rowsUpdated > 0; // Trả về true nếu ít nhất 1 hàng được cập nhật
    } catch (SQLException e) {
        System.out.println("Error in updateAccountStatus: " + e.getMessage());
    }
    return false; // Trả về false nếu có lỗi xảy ra
}

    public boolean isWithinOneMinute(LocalDateTime startTime, int seconds) {
        LocalDateTime now = LocalDateTime.now();
        LocalDateTime endTime = startTime.plusSeconds(seconds);
        return !now.isAfter(endTime);
    }

  public static void main(String[] args) {
    // Khởi tạo DAO
    AccountDAO accountDAO = new AccountDAO();

    // ID của tài khoản để test
    int testAccountId = 1; // Đảm bảo ID này tồn tại trong database để kiểm tra
    boolean newStatus = false; // Giá trị trạng thái mới cần cập nhật

    // Gọi phương thức updateAccountStatus
    boolean isUpdated = accountDAO.updateAccountStatus(testAccountId, newStatus);

    // Kiểm tra kết quả
    if (isUpdated) {
        System.out.println("Account status updated successfully for Account ID: " + testAccountId);
    } else {
        System.out.println("Failed to update account status for Account ID: " + testAccountId);
    }
}


    public ArrayList<Role> getRoleList() {
        ArrayList<Role> roleList = new ArrayList<>();
        String sql = "SELECT role_id, role_name FROM [dbo].[Role]";

        try (PreparedStatement stm = connection.prepareStatement(sql); ResultSet rs = stm.executeQuery()) {
            while (rs.next()) {
                Role role = new Role();
                role.setRole_Id(rs.getInt("role_id"));
                role.setRole_Name(rs.getString("role_name"));
                roleList.add(role);
            }
        } catch (SQLException e) {
            System.out.println("Error in getRoleList: " + e.getMessage());
        }
        return roleList;
    }

    public boolean addAccountByAdmin(Account account) {
        String sql = "INSERT INTO Account (username, password, fullname, email, phone, active, role_id) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            // Thiết lập các tham số
            ps.setString(1, account.getUsername());
            ps.setString(2, account.getPassword()); // Thêm mật khẩu
            ps.setString(3, account.getFullname());
            ps.setString(4, account.getEmail());
            ps.setString(5, account.getPhone());
            ps.setInt(6, account.getActive());
            ps.setInt(7, account.getRole_id());

            // Thực thi câu lệnh SQL
            int rowsInserted = ps.executeUpdate();
            return rowsInserted > 0; // Trả về true nếu thêm thành công
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // Trả về false nếu xảy ra lỗi
    }

    public boolean checkExistedPhone(String phone) {
        String sql = "SELECT * FROM Account WHERE phone = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, phone);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public String getRoleNameById(int roleId) {
        String sql = "SELECT role_name FROM Role WHERE role_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, roleId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("role_name");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // Trả về null nếu không tìm thấy
    }
    


public Map<String, Integer> getAccountCountByRole() {
    Map<String, Integer> roleCounts = new HashMap<>();
    String sql = "SELECT r.role_name, COUNT(a.account_id) AS total "
               + "FROM Account a "
               + "JOIN Role r ON a.role_id = r.role_id "
               + "GROUP BY r.role_name";
    try (PreparedStatement ps = connection.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {
        while (rs.next()) {
            String roleName = rs.getString("role_name");
            int count = rs.getInt("total");
            roleCounts.put(roleName, count);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return roleCounts;
}


}


