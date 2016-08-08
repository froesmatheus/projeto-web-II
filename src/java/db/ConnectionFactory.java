/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author mathe
 */
public class ConnectionFactory {
    private static Connection con;
    
    
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        if (con == null) {
           Class.forName("com.mysql.jdbc.Driver");
           con = DriverManager.getConnection("jdbc:mysql://localhost:3311/projetowebii",
            "root", "root"); 
        } 
        
        return con;
    }
}
