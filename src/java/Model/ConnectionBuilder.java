/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author JenoVa
 */
public class ConnectionBuilder {
    private static final String DRIVER = "com.mysql.jdbc.Driver";
//    private static final String URL = "jdbc:mysql://orarmor.in.th:3306/orarmorint_ta?useUnicode=yes&characterEncoding=UTF-8";
//      public static final String USER = "orarmorint_ta2";
//    public static final String PASSWORD = "!Projit17";
     private static final String URL = "jdbc:mysql://localhost:3306/orarmorint_ta?useUnicode=yes&characterEncoding=UTF-8";
      public static final String USER = "root";
    public static final String PASSWORD = "";

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName(DRIVER);
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConnectionBuilder.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ConnectionBuilder.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conn;
    }
    
//public static final String DRIVER = "com.mysql.jdbc.Driver";
//    public static final String URL = "jdbc:mysql://server.chaninz.com:3306/chanin_scb?useUnicode=yes&characterEncoding=UTF-8";
//    public static final String USER = "chanin_scb";
//    public static final String PASSWORD = "54216950";
//
//    public static Connection getConnection() {
//        try {
//            Class.forName(DRIVER);
//            return DriverManager.getConnection(URL, USER, PASSWORD);
//        } catch (ClassNotFoundException ex) {
//            Logger.getLogger(Util.class.getName()).log(Level.SEVERE, null, ex);
//        } catch (SQLException ex) {
//            Logger.getLogger(Util.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return null;
//    }
    public static void main(String[] args) {
        System.out.println(getConnection());
    }

}