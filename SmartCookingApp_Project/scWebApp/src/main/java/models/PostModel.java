package models;

import beans.Post;
import org.sql2o.Connection;
import utils.DbUtils;

import java.util.List;
import java.util.Map;
import java.util.Optional;

public class PostModel {
    public static List<Post> getAll(){
        final String sql = "select * from post";
        try (Connection con = DbUtils.getConnection()){
            return con.createQuery(sql).executeAndFetch(Post.class);
        }
    }
    public static void add(Post post){
        String sql = "INSERT INTO post (postname, TinyDes, FullDes, catID, userID, updateDate, enable) VALUES (:postname,:tinydes,:fulldes,:catid,:userid,:updatedate,:enable)";
        try (Connection conn = DbUtils.getConnection()){
            conn.createQuery(sql)
                    .addParameter("postname",post.getPostname())
                    .addParameter("tinydes",post.getTinyDes())
                    .addParameter("fulldes",post.getFullDes())
                    .addParameter("catid",post.getCatID())
                    .addParameter("userid",post.getUserID())
                    .addParameter("updatedate",post.getUpdateDate())
                    .addParameter("enable",post.getEnable())
                    .executeUpdate();
        }
    }
    public static Optional<Post> findByID(int postid) {
        String sql = "select * from post where id = :id";
        try (Connection con = DbUtils.getConnection()) {
            List<Post> list = con.createQuery(sql)
                    .addParameter("id", postid)
                    .executeAndFetch(Post.class);
            if (list.size() == 0) {
                return Optional.empty();
            }
            return Optional.ofNullable(list.get(0));
        }
    }

    public static List<Map<String,Object>> getMaxID()
    {
        String sql = "select MAX(id) as maxid FROM post";
        try(Connection conn = DbUtils.getConnection()){
            return conn.createQuery(sql).executeAndFetchTable().asList();
        }
    }
    public static void delete(int id){
        String sql1 = "Delete from post where id=:id";
        try (Connection conn = DbUtils.getConnection())
        {
            conn.createQuery(sql1).addParameter("id",id).executeUpdate();
        }
    }
    public static void Update(int id,Post post)
    {
        String sql = "UPDATE post SET  postname = :postname, TinyDes = :tinydes, FullDes = :fulldes, catID = :catid, userID = :userid, updateDate = :updatedate, enable = :enable WHERE id = :id ";

        try(Connection conn = DbUtils.getConnection()){
            conn.createQuery(sql)
                    .addParameter("postname",post.getPostname())
                    .addParameter("tinydes",post.getTinyDes())
                    .addParameter("catid",post.getCatID())
                    .addParameter("updatedate",post.getUpdateDate())
                    .addParameter("userid",post.getUserID())
                    .addParameter("fulldes",post.getFullDes())
                    .addParameter("enable",post.getEnable())
                    .addParameter("id",id)
                    .executeUpdate();
        }
    }
}
