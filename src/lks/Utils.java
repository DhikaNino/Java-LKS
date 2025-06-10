/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lks;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author hp
 */
public class Utils {
    public void insertLog(String aktivitas, Integer idUser){
    try {
            java.sql.Connection conn = Koneksi.getConnection();
            String sql = "INSERT INTO tbl_log(aktivitas, id_user) VALUES (?, ?)";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, aktivitas);
                        pst.setInt(2, idUser);

            pst.executeUpdate();
            System.out.println("Data berhasil ditambahkan!");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
