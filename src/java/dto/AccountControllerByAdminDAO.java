package dto;

import java.sql.*;
import java.util.ArrayList;
import model.AccountControlByAdmin;
import model.RoleControlByAdmin;

public class AccountControllerByAdminDAO extends DBContext {
    PreparedStatement stm;
    ResultSet rs;

    public ArrayList<AccountControlByAdmin> getListAccount(int page, int pageSize) {
        ArrayList<AccountControlByAdmin> data = new ArrayList<>();
        int offset = (page - 1) * pageSize;

        try {
            String strSQL = "SELECT A.account_id, A.username, A.fullname, A.email, A.phone, A.otp, R.role_name, A.active AS status " +
                            "FROM Account AS A JOIN Role AS R ON A.role_id = R.role_id " +
                            "ORDER BY A.account_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
            stm = connection.prepareStatement(strSQL);
            stm.setInt(1, offset);
            stm.setInt(2, pageSize);
            rs = stm.executeQuery();

            while (rs.next()) {
                data.add(new AccountControlByAdmin(
                        rs.getInt("account_id"),
                        rs.getString("username"),
                        rs.getString("fullname"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getString("otp"),
                        rs.getString("role_name"),
                        rs.getBoolean("status")
                ));
            }
        } catch (SQLException e) {
            System.out.println("Error in getListAccount: " + e.getMessage());
        } finally {
            closeResources();
        }
        return data;
    }

    public ArrayList<AccountControlByAdmin> searchAccountByName(String searchName, int page, int pageSize) {
        ArrayList<AccountControlByAdmin> data = new ArrayList<>();
        int offset = (page - 1) * pageSize;

        try {
            String searchPattern = "%" + searchName + "%";
            String strSQL = "SELECT A.account_id, A.username, A.fullname, A.email, A.phone, A.otp, R.role_name, A.active AS status " +
                            "FROM Account AS A JOIN Role AS R ON A.role_id = R.role_id " +
                            "WHERE A.username LIKE ? OR A.fullname LIKE ? OR A.email LIKE ? OR A.phone LIKE ? " +
                            "ORDER BY A.account_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
            stm = connection.prepareStatement(strSQL);
            for (int i = 1; i <= 4; i++) {
                stm.setString(i, searchPattern);
            }
            stm.setInt(5, offset);
            stm.setInt(6, pageSize);
            rs = stm.executeQuery();

            while (rs.next()) {
                data.add(new AccountControlByAdmin(
                        rs.getInt("account_id"),
                        rs.getString("username"),
                        rs.getString("fullname"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getString("otp"),
                        rs.getString("role_name"),
                        rs.getBoolean("status")
                ));
            }
        } catch (SQLException e) {
            System.out.println("Error in searchAccountByName: " + e.getMessage());
        } finally {
            closeResources();
        }
        return data;
    }

    public ArrayList<AccountControlByAdmin> filterAccountByRoleAndStatus(String role, Boolean status, int page, int pageSize) {
        ArrayList<AccountControlByAdmin> data = new ArrayList<>();
        int offset = (page - 1) * pageSize;

        try {
            StringBuilder strSQL = new StringBuilder("SELECT A.account_id, A.username, A.fullname, A.email, A.phone, A.otp, R.role_name, A.active AS status " +
                            "FROM Account AS A JOIN Role AS R ON A.role_id = R.role_id WHERE 1=1");
            if (role != null && !role.isEmpty()) {
                strSQL.append(" AND R.role_name = ?");
            }
            if (status != null) {
                strSQL.append(" AND A.active = ?");
            }
            strSQL.append(" ORDER BY A.account_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY");
            stm = connection.prepareStatement(strSQL.toString());
            
            int paramIndex = 1;
            if (role != null && !role.isEmpty()) {
                stm.setString(paramIndex++, role);
            }
            if (status != null) {
                stm.setBoolean(paramIndex++, status);
            }
            stm.setInt(paramIndex++, offset);
            stm.setInt(paramIndex, pageSize);
            rs = stm.executeQuery();

            while (rs.next()) {
                data.add(new AccountControlByAdmin(
                        rs.getInt("account_id"),
                        rs.getString("username"),
                        rs.getString("fullname"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getString("otp"),
                        rs.getString("role_name"),
                        rs.getBoolean("status")
                ));
            }
        } catch (SQLException e) {
            System.out.println("Error in filterAccountByRoleAndStatus: " + e.getMessage());
        } finally {
            closeResources();
        }
        return data;
    }

    public int getTotalAccountsCount() {
        return getCount("SELECT COUNT(*) FROM Account");
    }

    public int getTotalSearchCount(String searchName) {
        String sql = "SELECT COUNT(*) FROM Account AS A WHERE A.username LIKE ? OR A.fullname LIKE ? OR A.email LIKE ? OR A.phone LIKE ?";
        return getParameterizedCount(sql, searchName);
    }

    public int getTotalFilterCount(String role, Boolean status) {
        StringBuilder strSQL = new StringBuilder("SELECT COUNT(*) FROM Account AS A JOIN Role AS R ON A.role_id = R.role_id WHERE 1=1");
        if (role != null && !role.isEmpty()) strSQL.append(" AND R.role_name = ?");
        if (status != null) strSQL.append(" AND A.active = ?");
        return getParameterizedCount(strSQL.toString(), role, status);
    }

    private int getCount(String query) {
        int count = 0;
        try {
            stm = connection.prepareStatement(query);
            rs = stm.executeQuery();
            if (rs.next()) count = rs.getInt(1);
        } catch (SQLException e) {
            System.out.println("Error in getCount: " + e.getMessage());
        } finally {
            closeResources();
        }
        return count;
    }

    private int getParameterizedCount(String query, Object... params) {
        int count = 0;
        try {
            stm = connection.prepareStatement(query);
            for (int i = 0; i < params.length; i++) {
                stm.setObject(i + 1, params[i]);
            }
            rs = stm.executeQuery();
            if (rs.next()) count = rs.getInt(1);
        } catch (SQLException e) {
            System.out.println("Error in getParameterizedCount: " + e.getMessage());
        } finally {
            closeResources();
        }
        return count;
    }

    private void closeResources() {
        try {
            if (rs != null) rs.close();
            if (stm != null) stm.close();
        } catch (SQLException ex) {
            System.out.println("Error closing resources: " + ex.getMessage());
        }
    }

    public ArrayList<RoleControlByAdmin> getRoles() {
        ArrayList<RoleControlByAdmin> roles = new ArrayList<>();
        try {
            stm = connection.prepareStatement("SELECT role_id, role_name FROM Role");
            rs = stm.executeQuery();
            while (rs.next()) {
                roles.add(new RoleControlByAdmin(rs.getInt("role_id"), rs.getString("role_name")));
            }
        } catch (SQLException e) {
            System.out.println("Error in getRoles: " + e.getMessage());
        } finally {
            closeResources();
        }
        return roles;
    }
    
    public int getAccountCount(String searchName, String role, String statusParam) {
    int count = 0;
    StringBuilder query = new StringBuilder("SELECT COUNT(*) FROM Account AS A WHERE 1=1");

    if (searchName != null && !searchName.isEmpty()) {
        query.append(" AND (A.username LIKE ? OR A.fullname LIKE ? OR A.email LIKE ? OR A.phone LIKE ?)");
    }
    if (role != null && !role.isEmpty()) {
        query.append(" AND R.role_name = ?");
    }
    if (statusParam != null && !statusParam.isEmpty()) {
        query.append(" AND A.active = ?");
    }

    try {
        stm = connection.prepareStatement(query.toString());

        int paramIndex = 1;
        if (searchName != null && !searchName.isEmpty()) {
            String searchPattern = "%" + searchName + "%";
            for (int i = 0; i < 4; i++) {
                stm.setString(paramIndex++, searchPattern);
            }
        }
        if (role != null && !role.isEmpty()) {
            stm.setString(paramIndex++, role);
        }
        if (statusParam != null && !statusParam.isEmpty()) {
            stm.setBoolean(paramIndex, "1".equals(statusParam));
        }

        rs = stm.executeQuery();
        if (rs.next()) {
            count = rs.getInt(1);
        }
    } catch (SQLException e) {
        System.out.println("getAccountCount() " + e.getMessage());
    }
    return count;
}

    public void updateAccountStatus(int accountId, boolean newStatus) {
    try {
        String sql = "UPDATE Account SET active = ? WHERE account_id = ?";
        stm = connection.prepareStatement(sql);
        stm.setBoolean(1, newStatus);
        stm.setInt(2, accountId);
        stm.executeUpdate();
    } catch (SQLException e) {
        System.out.println("Error in updateAccountStatus: " + e.getMessage());
    } finally {
        closeResources();
    }
}

    public AccountControlByAdmin getAccountById(int accountId) {
    AccountControlByAdmin account = null;
    try {
        String sql = "SELECT A.account_id, A.username, A.fullname, A.email, A.phone, A.otp, R.role_name, A.active AS status " +
                     "FROM Account AS A JOIN Role AS R ON A.role_id = R.role_id WHERE A.account_id = ?";
        stm = connection.prepareStatement(sql);
        stm.setInt(1, accountId);
        rs = stm.executeQuery();

        if (rs.next()) {
            account = new AccountControlByAdmin(
                    rs.getInt("account_id"),
                    rs.getString("username"),
                    rs.getString("fullname"),
                    rs.getString("email"),
                    rs.getString("phone"),
                    rs.getString("otp"),
                    rs.getString("role_name"),
                    rs.getBoolean("status")
            );
        }
    } catch (SQLException e) {
        System.out.println("Error in getAccountById: " + e.getMessage());
    } finally {
        closeResources();
    }
    return account;
}


 // Phương thức để lấy roleId dựa trên roleName
    public int getRoleIdByName(String roleName) {
        int roleId = -1; // Trả về -1 nếu không tìm thấy roleName
        try {
            String sql = "SELECT role_id FROM Role WHERE role_name = ?";
            stm = connection.prepareStatement(sql);
            stm.setString(1, roleName);
            rs = stm.executeQuery();

            if (rs.next()) {
                roleId = rs.getInt("role_id");
            }
        } catch (SQLException e) {
            System.out.println("Error in getRoleIdByName: " + e.getMessage());
        } finally {
            closeResources();
        }
        return roleId;
    }

    // Phương thức để thêm tài khoản vào cơ sở dữ liệu
    public boolean addAccount(AccountControlByAdmin account) {
        try {
            int roleId = getRoleIdByName(account.getRoleName()); // Lấy roleId từ roleName

            String sql = "INSERT INTO Account (username, password, fullname, email, phone, otp, active, role_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            stm = connection.prepareStatement(sql);
            stm.setString(1, account.getUsername());
            stm.setString(2, "202CB962AC59075B964B07152D234B70"); // Password mặc định, nên được mã hóa trong thực tế
            stm.setString(3, account.getFullname());
            stm.setString(4, account.getEmail());
            stm.setString(5, account.getPhone());
            stm.setString(6, account.getOtp());
            stm.setBoolean(7, account.isStatus());
            stm.setInt(8, roleId); // Gán roleId

            int rowsAffected = stm.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.out.println("Error in addAccount: " + e.getMessage());
            return false;
        } finally {
            closeResources();
        }
    }
    
  public String checkDuplicateFields(String username, String email, String phone) {
    try {
        if (isUsernameDuplicate(username)) return "Username đã tồn tại.";
        if (isEmailDuplicate(email)) return "Email đã tồn tại.";
        if (isPhoneDuplicate(phone)) return "Phone đã tồn tại.";
    } catch (SQLException e) {
        System.out.println("Error in checkDuplicateFields: " + e.getMessage());
    } finally {
        closeResources();
    }
    return null; // Không có trường nào bị trùng
}

private boolean isUsernameDuplicate(String username) throws SQLException {
    String sql = "SELECT COUNT(*) FROM Account WHERE username = ?";
    stm = connection.prepareStatement(sql);
    stm.setString(1, username);
    rs = stm.executeQuery();
    return rs.next() && rs.getInt(1) > 0;
}

private boolean isEmailDuplicate(String email) throws SQLException {
    String sql = "SELECT COUNT(*) FROM Account WHERE email = ?";
    stm = connection.prepareStatement(sql);
    stm.setString(1, email);
    rs = stm.executeQuery();
    return rs.next() && rs.getInt(1) > 0;
}

private boolean isPhoneDuplicate(String phone) throws SQLException {
    String sql = "SELECT COUNT(*) FROM Account WHERE phone = ?";
    stm = connection.prepareStatement(sql);
    stm.setString(1, phone);
    rs = stm.executeQuery();
    return rs.next() && rs.getInt(1) > 0;
}


   public boolean updateAccountRole(int accountId, int newRoleId) {
    try {
        String sql = "UPDATE Account SET role_id = ? WHERE account_id = ?";
        stm = connection.prepareStatement(sql);
        stm.setInt(1, newRoleId);
        stm.setInt(2, accountId);
        
        int rowsAffected = stm.executeUpdate();
        return rowsAffected > 0;
    } catch (SQLException e) {
        System.out.println("Error in updateAccountRole: " + e.getMessage());
        return false;
    } finally {
        closeResources();
    }
}

   public int getTotalAccounts() {
    int totalAccounts = 0;
    
    try {
        String strSQL = "SELECT COUNT(*) AS total FROM Account";
        stm = connection.prepareStatement(strSQL);
        rs = stm.executeQuery();
        
        if (rs.next()) {
            totalAccounts = rs.getInt("total");
        }
    } catch (SQLException e) {
        System.out.println("Error in getTotalAccounts: " + e.getMessage());
    } finally {
        closeResources();
    }
    
    return totalAccounts;
}

   
public int getTotalLearners() {
    int totalLearners = 0;
    
    try {
        String strSQL = "SELECT COUNT(*) AS total FROM Account WHERE role_id = ?";
        stm = connection.prepareStatement(strSQL);
        stm.setInt(1, 2); // role_id = 2 là Learner
        rs = stm.executeQuery();
        
        if (rs.next()) {
            totalLearners = rs.getInt("total");
        }
    } catch (SQLException e) {
        System.out.println("Error in getTotalLearners: " + e.getMessage());
    } finally {
        closeResources();
    }
    
    return totalLearners;
}


   
    
    
}
