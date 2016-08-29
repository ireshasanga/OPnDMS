/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iresh.dao;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Iresh
 */
public class DBConnection {

// Get the mysql jdbc Connection    
    private static String className = "com.mysql.jdbc.Driver";
    private static String url = "jdbc:mysql://localhost:3306/opdms_db";
    private static String username = "root";
    private static String password = "root";
//    private static String password = "123";

    public static Connection getConnection() {
        try {

            Class.forName(className).newInstance();
            Connection conn = DriverManager.getConnection(url, username, password);
            System.out.println("Connection Established");
            return conn;
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }
}
