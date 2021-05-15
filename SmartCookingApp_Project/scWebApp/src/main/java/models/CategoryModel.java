package models;

import beans.Category;
import org.sql2o.Connection;
import utils.DbUtils;

import java.util.List;
import java.util.Map;
import java.util.Optional;

public class CategoryModel {
    public static List<Category> getAll(){
        String sql = "select * from category ";
        try(Connection conn = DbUtils.getConnection()){
            return  conn.createQuery(sql).executeAndFetch(Category.class);
        }
    }
    public static void add(Category category){
        String sql = "insert into category(name,parentCat) values(:name,:parentCat)";
        try(Connection conn = DbUtils.getConnection()){
            conn.createQuery(sql)
                    .addParameter("name",category.getName())
                    .addParameter("parentCat",category.getParentCat())
                    .executeUpdate();
        }
    }
}
