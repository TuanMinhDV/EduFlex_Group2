package model;

public class AccountControlByAdmin {
    
    private int accountId;
    private String username;
    private String fullname;
    private String email;
    private String phone;
    private String otp;
    private String roleName;
    private boolean status;

   
    public AccountControlByAdmin(int accountId, String username, String fullname, String email, String phone, String otp, String roleName, boolean status) {
        this.accountId = accountId;
        this.username = username;
        this.fullname = fullname;
        this.email = email;
        this.phone = phone;
        this.otp = otp;
        this.roleName = roleName;
        this.status = status;
    }

    // Getters and Setters
    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getOtp() {
        return otp;
    }

    public void setOtp(String otp) {
        this.otp = otp;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "AccountControlByAdmin{" +
                "accountId=" + accountId +
                ", username='" + username + '\'' +
                ", fullname='" + fullname + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", otp='" + otp + '\'' +
                ", roleName='" + roleName + '\'' +
                ", status=" + status +
                '}';
    }
}
