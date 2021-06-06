package utils;

import org.sql2o.Connection;
import org.sql2o.Sql2o;

public class DbUtils {

    static  final Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/smartcooking","root","123456");
    public static Connection getConnection(){
        return sql2o.open();
    }
}