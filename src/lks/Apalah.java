/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lks;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author hp
 */
public class Apalah {
    private static Connection Apalah;
    
    public static Connection getConnection() throws SQLException {
        String db = "jdbc:mysql://localhost:3307/db_lks";
        String user = "root";
        String pass = "";
        
        if(Apalah == null){
            Apalah = DriverManager.getConnection(db, user, pass);
        }
        return Apalah;
    }
    
}
