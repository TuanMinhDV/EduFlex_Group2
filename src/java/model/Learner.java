//ten,gia,ngay ban ngay mua,anh course,totalmoney

package model;

public class Learner {

    private int account_id;
    private String username;
    private String password;
    private String fullname;
    private String email;
    private int role_id;
    private int active;

    public Learner() {
    }

    public Learner(int account_id, String username, String password, String fullname, String email, int role_id, int active) {
        this.account_id = account_id;
        this.username = username;
        this.password = password;
        this.fullname = fullname;
        this.email = email;
        this.role_id = role_id;
        this.active = active;
    }

    public int getAccount_id() {
        return account_id;
    }

    public void setAccount_id(int account_id) {
        this.account_id = account_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }
    
    
    
}