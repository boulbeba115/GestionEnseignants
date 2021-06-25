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
import tn.iit.entities.Departement;
import tn.iit.entities.Enseignant;
import tn.iit.utils.JdbcUtils;

/**
 *
 * @author boulbeba
 */
public class DepartmentDao {

    public void addDepartment(Departement department) {
        try {
            PreparedStatement pst = JdbcUtils.getConnection().prepareStatement(
                    "INSERT INTO `departement` (`libelle`, `ens_responsable_id`) VALUES (? , ?);");
            pst.setString(1, department.getLibelle());
            pst.setInt(2, department.getEnsResponsable().getId());
            pst.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public List<Departement> getDepartment() {
        try {
            List<Departement> listDep = new ArrayList<Departement>();
            String req = "SELECT d.* , e.nom , e.prenom  FROM `departement` d inner join enseignant e on d.ens_responsable_id = e.id";
            ResultSet rs = JdbcUtils.getStatement().executeQuery(req);
            while (rs.next()) {
                Departement dept = new Departement();
                dept.setId(rs.getInt("id"));
                dept.setLibelle(rs.getString("libelle"));
                Enseignant ens = new Enseignant();
                ens.setId(rs.getInt("ens_responsable_id"));
                ens.setNom(rs.getString("nom"));
                ens.setPrenom(rs.getString("prenom"));
                dept.setEnsResponsable(ens);
                listDep.add(dept);
            }
            return listDep;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return new ArrayList<>();
        }
    }

    public Departement getDepartmentById(int id) {
        try {
            String req = "SELECT d.* , e.nom , e.prenom  FROM `departement` d inner join enseignant e on d.ens_responsable_id = e.id where d.id = " + id + "";
            ResultSet rs = JdbcUtils.getStatement().executeQuery(req);
            while (rs.next()) {
                Departement dept = new Departement();
                dept.setId(rs.getInt("id"));
                dept.setLibelle(rs.getString("libelle"));
                Enseignant ens = new Enseignant();
                ens.setId(rs.getInt("ens_responsable_id"));
                ens.setNom(rs.getString("nom"));
                ens.setPrenom(rs.getString("prenom"));
                dept.setEnsResponsable(ens);
                return dept;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public void deleteDepartment(int id) {
        try {
            String req = "DELETE FROM `departement` WHERE departement.id = " + id + ";";
            JdbcUtils.getStatement().execute(req);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public Departement updateDepartment(Departement dep) {
        Statement st = JdbcUtils.getStatement();
        String req = "UPDATE departement SET libelle = '" + dep.getLibelle() + "', `ens_responsable_id` = " + dep.getEnsResponsable().getId() + " where id = " + dep.getId() + ";";
        try {
            st.execute(req);
        } catch (SQLException ex) {
            Logger.getLogger(SeanceDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return dep;
    }
}
