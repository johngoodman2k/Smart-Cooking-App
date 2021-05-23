package models;

import at.favre.lib.crypto.bcrypt.BCrypt;
import beans.Post;
import beans.User;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import beans.Watchlist;
import org.sql2o.Connection;
import utils.DbUtils;

public class UserModel {
    public static void add(User user) {
        final String sql = "INSERT INTO users (username, password, name, email, dob, office, enable) VALUES (:username,:password,:name,:email,:dob,:office,:enable)";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("username", user.getUsername())
                    .addParameter("password", user.getPassword())
                    .addParameter("name", user.getName())
                    .addParameter("email", user.getEmail())
                    .addParameter("dob", user.getDob())
                    .addParameter("office", user.getOffice())
                    .addParameter("enable", user.getEnable())
                    .executeUpdate();
        }
    }
    public static Optional<User> findByUserName(String username) {
        final String sql = "select * from users where username = :username";
        try (Connection con = DbUtils.getConnection()) {
            List<User> list = con.createQuery(sql)
                    .addParameter("username", username)
                    .executeAndFetch(User.class);

            if (list.size() == 0) {
                return Optional.empty();
            }

            return Optional.ofNullable(list.get(0));
        }
    }
    public static Optional<User> FindByEmail(String email){
        String sql = "select* from users where email = :email";
        try(Connection conn = DbUtils.getConnection()){
            List<User> list = conn.createQuery(sql).addParameter("email",email).executeAndFetch(User.class);
            if(list.size()==0){
                return Optional.empty();
            }
            else{
                return Optional.ofNullable(list.get(0));
            }

        }
    }
    public static Optional<User> findByID(int ID){
        String sql = "select* from users where id = :id";
        try(Connection conn = DbUtils.getConnection()){
            List<User> list = conn.createQuery(sql).addParameter("id",ID).executeAndFetch(User.class);
            if(list.size()==0){
                return Optional.empty();
            }
            else{
                return Optional.ofNullable(list.get(0));
            }

        }
    }
    public static void updatePassword(int id,String password){
        String bcryptHashString = BCrypt.withDefaults().hashToString(12, password.toCharArray());
        String sql = "Update users set password=:password where id=:id";
        try(Connection conn = DbUtils.getConnection()){
            conn.createQuery(sql).addParameter("id",id).addParameter("password",bcryptHashString).executeUpdate();
        }
    }
    public static void updateName(int id,String name){
        String sql = "Update users set name=:name where id=:id";
        try(Connection conn = DbUtils.getConnection()){
            conn.createQuery(sql).addParameter("id",id).addParameter("name",name).executeUpdate();
        }
    }
    public static void updateEmail(int id,String Email){
        String sql = "Update users set email=:email where id=:id";
        try(Connection conn = DbUtils.getConnection()){
            conn.createQuery(sql).addParameter("id",id).addParameter("email",Email).executeUpdate();
        }
    }
    public static void updateDOB(int id,Date dob){
        String sql = "Update users set dob=:dob where id=:id";
        try(Connection conn = DbUtils.getConnection()){
            conn.createQuery(sql).addParameter("id",id).addParameter("dob",dob).executeUpdate();
        }
    }

    public static void delete(Watchlist wl){
        final String sql="DELETE FROM watchlist WHERE userID =:userid and postID =:postid ";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("userid", wl.getUserID())
                    .addParameter("postid",wl.getPostID())
                    .executeUpdate();
        }
    }
    public static void add(Watchlist wl){
        final String sql="INSERT INTO watchlist (userID, postID, date) VALUES (:userID,:postID,:date)";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("userID", wl.getUserID())
                    .addParameter("postID",wl.getPostID())
                    .addParameter("date",wl.getDate())
                    .executeUpdate();
        }
    }
    public static List<Post> FindWatchListByUserID(int id){
        String sql = "SELECT post.id,post.postname,post.TinyDes FROM watchlist,post,users WHERE watchlist.postID = post.id AND users.id = watchlist.userID AND watchlist.userID =:id";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(sql)
                    .addParameter("id", id)
                    .executeAndFetch(Post.class);
        }

    }

}

