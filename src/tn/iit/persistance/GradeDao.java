package tn.iit.persistance;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import tn.iit.entities.Grade;
import tn.iit.utils.JdbcUtils;

public class GradeDao {

    public void addGrade(Grade grade) {
        try {
            PreparedStatement pst = JdbcUtils.getConnection().prepareStatement(
                    "INSERT INTO `grade` (`libelle`, `prixc`, `prix_td`, `prix_tp`) VALUES (?, ?, ?, ?);");
            pst.setString(1, grade.getLibelle());
            pst.setFloat(2, grade.getPrixC());
            pst.setFloat(3, grade.getPrixTd());
            pst.setFloat(4, grade.getPrixTp());
            pst.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public List<Grade> getGrades() {
        try {
            List<Grade> listGrade = new ArrayList<>();
            String req = "SELECT *from grade";
            ResultSet rs = JdbcUtils.getStatement().executeQuery(req);
            while (rs.next()) {
                Grade grade = new Grade();
                grade.setId(rs.getInt("id"));
                grade.setLibelle(rs.getString("libelle"));
                grade.setPrixC(rs.getFloat("prixc"));
                grade.setPrixTd(rs.getFloat("prix_td"));
                grade.setPrixTp(rs.getFloat("prix_tp"));
                listGrade.add(grade);
            }
            return listGrade;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return new ArrayList<>();
        }
    }

    public Grade getGradeById(int id) {
        try {
            String req = "SELECT *from grade where id = " + id + "";
            ResultSet rs = JdbcUtils.getStatement().executeQuery(req);
            while (rs.next()) {
                Grade grade = new Grade();
                grade.setId(rs.getInt("id"));
                grade.setLibelle(rs.getString("libelle"));
                grade.setPrixC(rs.getFloat("prixc"));
                grade.setPrixTd(rs.getFloat("prix_td"));
                grade.setPrixTp(rs.getFloat("prix_tp"));
                return grade;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public Grade updateGrade(Grade grade) {
        Statement st = JdbcUtils.getStatement();
        String req = "UPDATE grade SET libelle = '" + grade.getLibelle() + "', prixc = " + grade.getPrixC() + " , prix_td = " + grade.getPrixTd() + " , prix_tp = " + grade.getPrixTp() + " where id = " + grade.getId() + ";";
        System.out.println(req);
        try {
            st.execute(req);
        } catch (SQLException ex) {
            Logger.getLogger(SeanceDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return grade;
    }

    public void deleteGrade(int id) {
        try {
            String req = "DELETE FROM `grade` WHERE `grade`.`id` = " + id + ";";
            JdbcUtils.getStatement().execute(req);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

}
