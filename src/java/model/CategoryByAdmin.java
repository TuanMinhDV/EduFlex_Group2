
package model;

import java.util.Date;

/**
 *
 * @author dungm
 */
public class CategoryByAdmin {
    private int id;
    private String name;
    private Date updated_date;
    private int update_id;

    public CategoryByAdmin() {
    }

    public CategoryByAdmin(int id, String name, Date updated_date, int update_id) {
        this.id = id;
        this.name = name;
        this.updated_date = updated_date;
        this.update_id = update_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getUpdated_date() {
        return updated_date;
    }

    public void setUpdated_date(Date updated_date) {
        this.updated_date = updated_date;
    }

    public int getUpdate_id() {
        return update_id;
    }

    public void setUpdate_id(int update_id) {
        this.update_id = update_id;
    }
    
    

    
    
}
