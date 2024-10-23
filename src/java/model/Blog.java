package model;


public class Blog {
    private int id;
    private String title;
    private String content;
    private String description;
    private String image;
    private String link;
    private String created_date;
    private int status;
    private int marketer_id;
    private String tag;
    private String fullname;
    public Blog() {
    }

    public Blog(int id, String title, String content, String description, String image, String link, String created_date, int status, int marketer_id, String tag, String fullname) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.description = description;
        this.image = image;
        this.link = link;
        this.created_date = created_date;
        this.status = status;
        this.marketer_id = marketer_id;
        this.tag = tag;
        this.fullname = fullname;
    }
    
    

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getCreated_date() {
        return created_date;
    }

    public void setCreated_date(String created_date) {
        this.created_date = created_date;
    }

    public int getMarketer_id() {
        return marketer_id;
    }

    public void setMarketer_id(int marketer_id) {
        this.marketer_id = marketer_id;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    @Override
    public String toString() {
        return "Blog{" + "id=" + id + ", title=" + title + ", content=" + content + ", description=" + description + ", image=" + image + ", link=" + link + ", created_date=" + created_date + ", status=" + status + ", marketer_id=" + marketer_id + ", tag=" + tag + ", fullname=" + fullname + '}';
    }
    
    
   
    
    
    
}
