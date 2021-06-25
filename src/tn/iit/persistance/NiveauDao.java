/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tn.iit.persistance;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import tn.iit.entities.Niveau;
import tn.iit.utils.JdbcUtils;

/**
 *
 * @author boulbeba
 */
public class NiveauDao {

    public void addNiveau(Niveau niveau) {
        try {
            PreparedStatement pst = JdbcUtils.getConnection().prepareStatement(
                    "INSERT INTO `niveau` (`libelle`) VALUES (?);");
            pst.setString(1, niveau.getLibelle());
            pst.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public List<Niveau> getAllNiveau() {
        try {
            List<Niveau> listNiveaux = new ArrayList<Niveau>();
            String req = "SELECT * from niveau";
            ResultSet rs = JdbcUtils.getStatement().executeQuery(req);
            while (rs.next()) {
                Niveau niveau = new Niveau();
                niveau.setId(rs.getInt("id"));
                niveau.setLibelle(rs.getString("libelle"));
                listNiveaux.add(niveau);
            }
            return listNiveaux;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return new ArrayList<>();
        }
    }

    public Niveau findById(int id) {
        try {
            String req = "SELECT * from niveau where id = " + id + "";
            ResultSet rs = JdbcUtils.getStatement().executeQuery(req);
            Niveau niveau = new Niveau();
            while (rs.next()) {
                niveau.setId(rs.getInt("id"));
                niveau.setLibelle(rs.getString("libelle"));
                return niveau;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public void updateNiv(Niveau niveau) {
        Statement st = JdbcUtils.getStatement();
        String req = "UPDATE niveau SET libelle = '" + niveau.getLibelle() + "' where id = " + niveau.getId() + ";";
        try {
            st.execute(req);
        } catch (SQLException ex) {
            Logger.getLogger(SeanceDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteNiv(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
