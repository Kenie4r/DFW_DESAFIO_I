package www.sv.cuponera.modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.cj.jdbc.Driver;

public class ConeccionJasperModel {
    private static Driver driver = null;
   static   String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
   static String JDBC_URL = "jdbc:mysql://localhost/desafio_java";
    static String JDBC_USER = "root";
   static String JDBC_PASS = "";
   public static synchronized Connection getConnection()
           throws SQLException {
       Connection con = null;
       if (driver == null) {
           try {
               Class.forName(JDBC_DRIVER);
               System.out.println("Coneccion de jasper");
           } catch (Exception e) {
               System.out.println("Fallo en cargar el driver JDBC");
               e.printStackTrace();
           }
       }
       return DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
   }
   //Cierre del resultSet
   public static void close(ResultSet rs) {
       try {
           if (rs != null) {
               rs.close();
           }
       } catch (SQLException sqle) {
           sqle.printStackTrace();
       }
   }
}
