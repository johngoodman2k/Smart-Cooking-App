package beans;

import java.util.Date;

public class Post {
    int id, userID, catID;
    String postname, TinyDes, FullDes,enable;
    Date updateDate;

    public Post() {
    }

    public Post(int id, int userID, int catID, String postname, String tinyDes, String fullDes, String enable, Date updateDate) {
        this.id = id;
        this.userID = userID;
        this.catID = catID;
        this.postname = postname;
        TinyDes = tinyDes;
        FullDes = fullDes;
        this.enable = enable;
        this.updateDate = updateDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getCatID() {
        return catID;
    }

    public void setCatID(int catID) {
        this.catID = catID;
    }

    public String getPostname() {
        return postname;
    }

    public void setPostname(String postname) {
        this.postname = postname;
    }

    public String getTinyDes() {
        return TinyDes;
    }

    public void setTinyDes(String tinyDes) {
        TinyDes = tinyDes;
    }

    public String getFullDes() {
        return FullDes;
    }

    public void setFullDes(String fullDes) {
        FullDes = fullDes;
    }

    public String getEnable() {
        return enable;
    }

    public void setEnable(String enable) {
        this.enable = enable;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }
}
