
package model;


public class Role {
    private int Role_Id;
    private String  Role_Name;

    public Role() {
    }

    public Role(int Role_Id, String Role_Name) {
        this.Role_Id = Role_Id;
        this.Role_Name = Role_Name;
    }

    public int getRole_Id() {
        return Role_Id;
    }

    public void setRole_Id(int Role_Id) {
        this.Role_Id = Role_Id;
    }

    public String getRole_Name() {
        return Role_Name;
    }

    public void setRole_Name(String Role_Name) {
        this.Role_Name = Role_Name;
    }

    @Override
    public String toString() {
        return "Role{" + "Role_Id=" + Role_Id + ", Role_Name=" + Role_Name + '}';
    }

    
    
}
