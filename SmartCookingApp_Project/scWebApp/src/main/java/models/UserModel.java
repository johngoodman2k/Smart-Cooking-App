package models;

import beans.User;

import java.util.List;
import java.util.Optional;
import org.sql2o.Connection;
import utils.DbUtils;

public class UserModel {
    public static void add(User user) {
        final String sql = "INSERT INTO users (username, password, name, email, dob, permission) VALUES (:username,:password,:name,:email,:dob,:permission)";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("username", user.getUsername())
                    .addParameter("password", user.getPassword())
                    .addParameter("name", user.getName())
                    .addParameter("email", user.getEmail())
                    .addParameter("dob", user.getDob())
                    .addParameter("permission", user.getPermission())
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


    public static void delete(int id) {
        final String sql = "delete from categories where CatID = :CatID";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("CatID", id)
                    .executeUpdate();
        }
    }

//    public static void update1(Category c) {
//        final String sql = "update categories set CatName = :CatName where CatID = :CatID";
//        try (Connection con = DbUtils.getConnection()) {
//            con.createQuery(sql)
//                    .addParameter("CatID", c.getCatID())
//                    .addParameter("CatName", c.getCatName())
//                    .executeUpdate();
//        }
//    }

    public static List<User> findByPermission() {
        String sql = "select * from users where permission = 0";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(sql)
//                    .addParameter("permission", per)
                    .executeAndFetch(User.class);
        }
    }
    public static List<User> findByPermission2() {
        String sql = "select * from users where permission = 2";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(sql)
//                    .addParameter("permission", per)
                    .executeAndFetch(User.class);
        }
    }

    public static void lock(int id) {
        final String sql = "update users set permission = -1 where id = :id";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("id", id)
//                    .addParameter("CatName", c.getCatName())
                    .executeUpdate();
        }
    }

    public static Optional<User> findById(int id) {
        final String sql = "select * from users where ID = :ID";
        try (Connection con = DbUtils.getConnection()) {
            List<User> list = con.createQuery(sql)
                    .addParameter("ID", id)
                    .executeAndFetch(User.class);

            if (list.size() == 0) {
                return Optional.empty();
            }

            return Optional.ofNullable(list.get(0));
        }
    }
    public static void updateInfomation(User u) {
        final String sql = "UPDATE users SET  username = :username, password = :password, name = :name, email = :email, dob = :dob, permission = :permission WHERE id = :id";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("id", u.getId())
                    .addParameter("username", u.getUsername())
                    .addParameter("password", u.getPassword())
                    .addParameter("name", u.getName())
                    .addParameter("email", u.getEmail())
                    .addParameter("dob", u.getDob())
                    .addParameter("permission", u.getPermission())
                    .executeUpdate();
        }
    }
}

