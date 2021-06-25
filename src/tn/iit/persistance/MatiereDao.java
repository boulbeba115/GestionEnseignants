/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tn.iit.persistance;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import tn.iit.entities.Departement;
import tn.iit.entities.Matiere;
import tn.iit.entities.Niveau;
import tn.iit.utils.JdbcUtils;

/**
 *
 * @author boulbeba
 */
public class MatiereDao {

    public void addMatiere(Matiere mat) {
        try {
            PreparedStatement pst = JdbcUtils.getConnection().prepareStatement(
                    "INSERT INTO `matiere` (charge_cours, charge_td, charge_tp, libelle, niveau_id, department_id) VALUES (? , ? , ? , ? , ? , ?);");
            pst.setFloat(1, mat.getChargeCours());
            pst.setFloat(2, mat.getChargeTd());
            pst.setFloat(3, mat.getChargeTp());
            pst.setString(4, mat.getLibelle());
            pst.setInt(5, mat.getNiveau().getId());
            pst.setInt(6, mat.getDepartment().getId());
            pst.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Matiere updateMatiere(Matiere mat) {
        try {
            PreparedStatement pst = JdbcUtils.getConnection().prepareStatement("UPDATE `matiere` SET libelle = ?, charge_cours = ? , charge_td = ? , charge_tp = ? , niveau_id = ? , department_id = ?  WHERE id = ? ;");
            pst.setString(1, mat.getLibelle());
            pst.setFloat(2, mat.getChargeCours());
            pst.setFloat(3, mat.getChargeTd());
            pst.setFloat(4, mat.getChargeTp());
            pst.setInt(5, mat.getDepartment().getId());
            pst.setInt(6, mat.getNiveau().getId());
            pst.setInt(7, mat.getId());
            pst.execute();

            return mat;
        } catch (SQLException ex) {
            Logger.getLogger(MatiereDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return mat;
    }

    public List<Matiere> getMatieres() {
        try {
            List<Matiere> listMat = new ArrayList<>();
            String req = "SELECT m.* , d.libelle as deparLib , n.libelle as nivLib FROM `matiere` m JOIN departement d on m.`department_id` = d.id JOIN niveau n on m.`niveau_id` = n.id";
            ResultSet rs = JdbcUtils.getStatement().executeQuery(req);
            while (rs.next()) {
                Matiere mat = new Matiere();
                mat.setId(rs.getInt("id"));
                mat.setLibelle(rs.getString("libelle"));
                mat.setChargeCours(rs.getFloat("charge_cours"));
                mat.setChargeTd(rs.getFloat("charge_td"));
                mat.setChargeTp(rs.getFloat("charge_tp"));
                Departement d = new Departement();
                d.setId(rs.getInt("department_id"));
                d.setLibelle(rs.getString("deparLib"));
                Niveau n = new Niveau();
                n.setId(rs.getInt("niveau_id"));
                n.setLibelle(rs.getString("nivLib"));
                mat.setDepartment(d);
                mat.setNiveau(n);
                listMat.add(mat);
            }
            return listMat;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return new ArrayList<>();
        }
    }

    public Matiere findEnsById(int id) {
        try {
            String req = "SELECT m.* , d.libelle as deparLib , n.libelle as nivLib FROM `matiere` m JOIN departement d on m.`department_id` = d.id JOIN niveau n on m.`niveau_id` = n.id where m.id = " + id + "";
            ResultSet rs = JdbcUtils.getStatement().executeQuery(req);
            Matiere mat = new Matiere();
            while (rs.next()) {
                mat.setId(rs.getInt("id"));
                mat.setLibelle(rs.getString("libelle"));
                mat.setChargeCours(rs.getFloat("charge_cours"));
                mat.setChargeTd(rs.getFloat("charge_td"));
                mat.setChargeTp(rs.getFloat("charge_tp"));
                Departement d = new Departement();
                d.setId(rs.getInt("department_id"));
                d.setLibelle(rs.getString("deparLib"));
                Niveau n = new Niveau();
                n.setId(rs.getInt("niveau_id"));
                n.setLibelle(rs.getString("nivLib"));
                mat.setDepartment(d);
                mat.setNiveau(n);
                return mat;
            }
            return mat;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    }

    public void deleteMatiere(int id) {
        try {
            String req = "DELETE FROM `matiere` WHERE `matiere`.`id` = " + id + ";";
            JdbcUtils.getStatement().execute(req);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

}
