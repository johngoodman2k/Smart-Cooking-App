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
        String sql2 = "DELETE FROM watchlist WHERE postID = :id ";
        String sql3 = "DELETE FROM evaluate WHERE postID = :id";
        try (Connection conn = DbUtils.getConnection())
        {
            conn.createQuery(sql1).addParameter("id",id).executeUpdate();
            conn.createQuery(sql2).addParameter("id",id).executeUpdate();
            conn.createQuery(sql3).addParameter("id",id).executeUpdate();
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
    public  static  List<Map<String,Object>> GetFeturePost(){
        String sql="SELECT post.id,post.postname,post.TinyDes,post.FullDes,post.updateDate,users.`name` as userName,category.`name`as catName,COUNT(evaluate.userID) as num,ROUND(AVG(evaluate.point),2)as point from post left JOIN evaluate ON post.id = evaluate.postID,users,category WHERE users.id = post.userID and post.enable != 'false' and post.catID = category.id GROUP BY post.id DESC Limit 10";
        try(Connection conn = DbUtils.getConnection())
        {
            return conn.createQuery(sql).executeAndFetchTable().asList();
        }
    }
    public static List<Map<String, Object>> GetByID(int id){
        String sql="SELECT post.id,post.postname,post.TinyDes,post.FullDes,post.updateDate,users.`name` as userName,category.`name`as catName,COUNT(evaluate.userID) as num,ROUND(AVG(evaluate.point),1)as point FROM users,category,post left JOIN evaluate on post.id = evaluate.postID WHERE users.id = post.userID AND post.catID = category.id AND post.id =:id GROUP BY post.id";
        try(Connection conn = DbUtils.getConnection()){
            return conn.createQuery(sql)
                    .addParameter("id",id)
                    .executeAndFetchTable().asList();

        }

    }
    public static boolean IsOnWatchList(int userid,int postid)
    {
        String sql = "select* from watchlist  where userID=:userid and postID=:postid";
        try(Connection conn = DbUtils.getConnection()){
            List<Map<String,Object>> list = conn.createQuery(sql).addParameter("userid",userid)
                    .addParameter("postid",postid).executeAndFetchTable().asList();
            if(list.size()==0)
                return false;
            else
                return true;
        }
    }
    public static List<Post> SearchByUserAndSubCat(String username, int catid)
    {
        if(catid != 0 ){
            String sql = "SELECT post.id, post.postname, post.TinyDes, post.FullDes, post.catID, post.userID, post.updateDate, post.enable FROM category,post,users WHERE category.id=post.catID and post.userID = users.id and users.username like '%"+username+"%' and post.catID = :catid";
            try(Connection conn = DbUtils.getConnection()){
                return conn.createQuery(sql).addParameter("catid",catid).executeAndFetch(Post.class);
            }
        }
        else{
            String sql = "SELECT post.id, post.postname, post.TinyDes, post.FullDes, post.catID, post.userID, post.updateDate, post.enable FROM category,post,users WHERE category.id=post.catID and post.userID = users.id and users.username like '%"+username+"%'";
            try(Connection conn = DbUtils.getConnection()){
                return conn.createQuery(sql).executeAndFetch(Post.class);
            }
        }
    }
    public static List<Post> SearchByUserAndCat(String username,int catid)
    {
        String sql = "SELECT post.id, post.postname, post.TinyDes, post.FullDes, post.catID, post.userID, post.updateDate, post.enable FROM category c1 INNER JOIN category c2 ON c1.id = c2.parentCat,post,users WHERE c2.id = post.catID AND users.id = post.userID AND c1.id = :catid and users.username like '%"+username+"%'";
        try(Connection conn = DbUtils.getConnection()){
            return conn.createQuery(sql).addParameter("catid",catid).executeAndFetch(Post.class);
        }
    }

}
