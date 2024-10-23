/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Feature;

public class FeatureDAO extends DBContext {

    public ArrayList<Feature> findByUsername(String username) {
        PreparedStatement ps;
        ResultSet rs;
        ArrayList<Feature> features = new ArrayList<>();
        try {
            String sql = "SELECT f.id, f.[url], f.[name] FROM Feature f\n"
                    + "INNER JOIN [Role_Feature] rf ON rf.feature_id = f.id\n"
                    + "INNER JOIN [Role] r ON r.role_id = rf.role_id\n"
                    + "INNER JOIN Account a ON a.role_id = r.role_id\n"
                    + "WHERE a.username = ?";
            ps = connection.prepareStatement(sql);
            System.out.println(username);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                Feature f = new Feature();
                f.setId(rs.getInt("id"));
                f.setName(rs.getString("name"));
                f.setUrl(rs.getString("url"));
                features.add(f);
            }
            return features;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
