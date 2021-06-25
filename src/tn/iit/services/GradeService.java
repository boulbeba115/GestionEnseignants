/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tn.iit.services;

import java.util.List;
import tn.iit.entities.Grade;
import tn.iit.persistance.GradeDao;

/**
 *
 * @author boulbeba
 */
public class GradeService {

    private final GradeDao gradeDao = new GradeDao();

    public Grade add(Grade grade) {
        gradeDao.addGrade(grade);
        return grade;
    }

    public void remove(int id) {
        gradeDao.deleteGrade(id);
    }

    public void update(Grade grade) {
        gradeDao.updateGrade(grade);
    }

    public Grade getById(int id) {
        return gradeDao.getGradeById(id);
    }

    public List<Grade> getAll() {
        return gradeDao.getGrades();
    }
}
