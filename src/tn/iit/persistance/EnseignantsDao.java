package tn.iit.persistance;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import tn.iit.entities.Departement;

import tn.iit.entities.Enseignant;
import tn.iit.entities.Grade;
import tn.iit.entities.Matiere;
import tn.iit.entities.Niveau;
import tn.iit.utils.JdbcUtils;

public class EnseignantsDao {

    public void addEnseignant(Enseignant ens) {
        try {
            PreparedStatement pst = JdbcUtils.getConnection().prepareStatement(
                    "INSERT INTO `enseignant` (`adresse`, `cin`, `email`, `login`, `nom`, `password`, `phone`, `prenom`, `departement_id`, `grade_id`) VALUES (?,?,?,?,?,?,?,?,?,?)");
            pst.setString(1, ens.getAdresse());
            pst.setInt(2, ens.getCin());
            pst.setString(3, ens.getEmail());
            pst.setString(4, ens.getLogin());
            pst.setString(5, ens.getNom());
            pst.setString(6, ens.getPassword());
            pst.setInt(7, ens.getPhone());
            pst.setString(8, ens.getPrenom());
            pst.setInt(9, ens.getDepartement().getId());
            pst.setInt(10, ens.getGrade().getId());
            pst.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public List<Enseignant> getEnseignants() {
        try {
            List<Enseignant> listEns = new ArrayList<>();
            String req = "SELECT e.* , g.libelle as gradeLib , d.libelle as deparLib FROM `enseignant` e INNER JOIN departement d on e.`departement_id` = d.id INNER JOIN grade g on g.id = e.grade_id";
            ResultSet rs = JdbcUtils.getStatement().executeQuery(req);

            while (rs.next()) {
                Enseignant ens = new Enseignant(rs.getInt("id"), rs.getInt("cin"), rs.getString("prenom"), rs.getString("nom"), rs.getString("adresse"), rs.getString("email"), rs.getInt("phone"), rs.getString("login"));
                Grade g = new Grade();
                g.setId(rs.getInt("grade_id"));
                g.setLibelle(rs.getString("gradeLib"));
                Departement d = new Departement();
                d.setId(rs.getInt("departement_id"));
                d.setLibelle(rs.getString("deparLib"));
                ens.setGrade(g);
                ens.setDepartement(d);
                listEns.add(ens);
            }
            return listEns;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return new ArrayList<>();
        }
    }

    public Enseignant findEnsById(int id) {
        try {
            String req = "SELECT e.* , g.libelle as gradeLib , d.libelle as deparLib FROM `enseignant` e INNER JOIN departement d on e.`departement_id` = d.id INNER JOIN grade g on g.id = e.grade_id where e.id = " + id + ";";
            ResultSet rs = JdbcUtils.getStatement().executeQuery(req);
            Enseignant ens;
            while (rs.next()) {
                ens = new Enseignant(rs.getInt("id"), rs.getInt("cin"), rs.getString("prenom"), rs.getString("nom"), rs.getString("adresse"), rs.getString("email"), rs.getInt("phone"), rs.getString("login"));
                Grade g = new Grade();
                g.setId(rs.getInt("grade_id"));
                g.setLibelle(rs.getString("gradeLib"));
                Departement d = new Departement();
                d.setId(rs.getInt("departement_id"));
                d.setLibelle(rs.getString("deparLib"));
                ens.setGrade(g);
                ens.setDepartement(d);
                return ens;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
        return null;
    }

    public Enseignant updateEnseignant(Enseignant ens) {
        try {
            PreparedStatement pst = JdbcUtils.getConnection().prepareStatement("UPDATE `enseignant` SET cin = ?, prenom = ? , nom = ? , phone = ? , adresse = ? , departement_id = ? , grade_id = ?  WHERE id = ? ;");
            pst.setInt(1, ens.getCin());
            pst.setString(2, ens.getPrenom());
            pst.setString(3, ens.getNom());
            pst.setInt(4, ens.getPhone());
            pst.setString(5, ens.getAdresse());
            pst.setInt(6, ens.getDepartement().getId());
            pst.setInt(7, ens.getGrade().getId());
            pst.setInt(8, ens.getId());
            pst.execute();
            return ens;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }

    }

    public void deleteEnseignant(int id) {

        try {
            String req = "DELETE FROM `enseignant` WHERE `enseignant`.`id` = " + id + ";";
            JdbcUtils.getStatement().execute(req);
        } catch (SQLException ex) {
            Logger.getLogger(EnseignantsDao.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public List<Matiere> getEnsMat(int id) {
        try {
            List<Matiere> listMat = new ArrayList<>();
            String req = "select m.*, n.libelle as nivLib from enseignant e join seance s on s.enseignant_id = e.id join matiere m on m.id = s.matiere_id join niveau n on m.`niveau_id` where e.id = " + id + " group by m.id";
            ResultSet rs = JdbcUtils.getStatement().executeQuery(req);
            while (rs.next()) {
                Matiere mat = new Matiere();
                mat.setId(rs.getInt("id"));
                mat.setLibelle(rs.getString("libelle"));
                mat.setChargeCours(rs.getFloat("charge_cours"));
                mat.setChargeTd(rs.getFloat("charge_td"));
                mat.setChargeTp(rs.getFloat("charge_tp"));
                Niveau n = new Niveau();
                n.setId(rs.getInt("niveau_id"));
                n.setLibelle(rs.getString("nivLib"));
                mat.setNiveau(n);
                listMat.add(mat);
            }
            return listMat;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return new ArrayList<>();
        }
    }

}
