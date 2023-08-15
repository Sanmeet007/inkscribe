package models.articles;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import db.DbConnect;

public class ArticleTypes {
    private static Connection conn = DbConnect.instance.getConnection();
    public static Integer Politics = 1;
    public static Integer Writing = 2;
    public static Integer Programming = 3;
    public static Integer Data_Science = 4;
    public static Integer Technology = 5;
    public static Integer Machine_Learning = 6;
    public static Integer ChatGPT = 7;
    public static Integer GPT_4 = 8;
    public static Integer Productivity = 9;

    public static ArrayList<ArticleType> getTypes() {
        ArrayList<ArticleType> types = new ArrayList<ArticleType>();
        try {
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM articles_type");
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()) {
                ArticleType type = new ArticleType(resultSet.getInt("id"), resultSet.getString("type"));

                types.add(type);
            }
            return types;
        } catch (Exception e) {
            return types;
        }
    }
}
