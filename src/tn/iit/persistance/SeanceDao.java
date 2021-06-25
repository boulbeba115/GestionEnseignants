/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tn.iit.persistance;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import tn.iit.entities.Enseignant;
import tn.iit.entities.Matiere;
import tn.iit.entities.Seance;
import tn.iit.utils.JdbcUtils;

/**
 *
 * @author boulbeba
 */
public class SeanceDao {

    public void addSeance(Seance seance) {
        try {
            Statement st = JdbcUtils.getStatement();
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            String date = formatter.format(seance.getDate());
            formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
            String heure = formatter.format(seance.getHeureDebut());
            String req = "INSERT INTO `seance` (`date`, `duree`, `heure_debut`, `type`, `valide`, `enseignant_id`, `matiere_id`) VALUES ('" + date + "'," + seance.getDuree() + ",'" + heure + "'," + seance.seanceToInt() + "," + seance.isValide() + "," + seance.getEnseignant().getId() + "," + seance.getMatiere().getId() + ")";
            System.out.println(req);
            st.executeUpdate(req);
        } catch (Exception ex) {
            Logger.getLogger(SeanceDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Seance> getAllSeances() {
        try {
            List<Seance> listSeance = new ArrayList<Seance>();
            String req = "SELECT s.* , e.id as ensId , e.nom , e.prenom ,m.id as matId , m.libelle FROM `seance` s JOIN enseignant e on s.`enseignant_id` = e.id join matiere m on s.`matiere_id` = m.id;";
            ResultSet rs = JdbcUtils.getStatement().executeQuery(req);
            String pattern = "MM-dd-yyyy";
            String timepattern = "HH:mm";
            while (rs.next()) {
                Seance seance = new Seance();
                seance.setId(rs.getInt("id"));
                seance.setDate(rs.getDate("date"));
                seance.setDuree(rs.getFloat("duree"));
                seance.setHeureDebut(rs.getTime("heure_debut"));
                seance.setTypeWithInt(rs.getInt("type"));
                seance.setValide(rs.getBoolean("valide"));
                Enseignant ens = new Enseignant();
                ens.setId(rs.getInt("ensId"));
                ens.setNom(rs.getString("nom"));
                ens.setPrenom(rs.getString("prenom"));
                Matiere mat = new Matiere();
                mat.setId(rs.getInt("matId"));
                mat.setLibelle(rs.getString("libelle"));
                seance.setEnseignant(ens);
                seance.setMatiere(mat);
                listSeance.add(seance);
            }
            return listSeance;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return new ArrayList<>();
        }
    }

    public Seance updateSeance(Seance seance) {
        Statement st = JdbcUtils.getStatement();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String date = formatter.format(seance.getDate());
        formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        String heure = formatter.format(seance.getHeureDebut());
        String req = "UPDATE seance SET date = '" + date + "', `duree` = '" + seance.getDuree() + "', `heure_debut` = '" + heure + "', `type` = " + seance.seanceToInt() + ", `valide` = " + seance.isValide() + ", `enseignant_id` = " + seance.getEnseignant().getId() + " , `matiere_id` = " + seance.getMatiere().getId() + " where id = " + seance.getId() + ";";        
        try {
            st.execute(req);
        } catch (SQLException ex) {
            Logger.getLogger(SeanceDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return seance;
    }

    public Seance findSeanceById(int id) {
        try {
            List<Seance> listSeance = new ArrayList<Seance>();
            String req = "SELECT s.* , e.id as ensId , e.nom , e.prenom ,m.id as matId , m.libelle FROM `seance` s JOIN enseignant e on s.`enseignant_id` = e.id join matiere m on s.`matiere_id` = m.id where s.id = " + id + ";";
            ResultSet rs = JdbcUtils.getStatement().executeQuery(req);
            String pattern = "MM-dd-yyyy";
            String time = "HH:mm";
            while (rs.next()) {
                Seance seance = new Seance();
                seance.setId(rs.getInt("id"));
                seance.setDate(rs.getDate("date"));
                seance.setDuree(rs.getFloat("duree"));
                seance.setHeureDebut(rs.getTime("heure_debut"));
                seance.setTypeWithInt(rs.getInt("type"));
                seance.setValide(rs.getBoolean("valide"));
                Enseignant ens = new Enseignant();
                ens.setId(rs.getInt("ensId"));
                ens.setNom(rs.getString("nom"));
                ens.setPrenom(rs.getString("prenom"));
                Matiere mat = new Matiere();
                mat.setId(rs.getInt("matId"));
                mat.setLibelle("libelle");
                seance.setEnseignant(ens);
                seance.setMatiere(mat);
                return seance;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;

        }
        return null;
    }

    public void deleteSeance(int id) {
        try {
            String req = "DELETE FROM `seance` WHERE `seance`.`id` = " + id + ";";
            JdbcUtils.getStatement().execute(req);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

}
