/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tn.iit.services;

import java.util.List;
import tn.iit.entities.Departement;
import tn.iit.entities.Grade;
import tn.iit.persistance.DepartmentDao;
import tn.iit.persistance.GradeDao;

/**
 *
 * @author boulbeba
 */
public class DepartmentService {

    private final DepartmentDao departmentDao = new DepartmentDao();

    public Departement add(Departement department) {
        departmentDao.addDepartment(department);
        return department;
    }

    public void remove(int id) {
        departmentDao.deleteDepartment(id);
    }

    public void update(Departement dep) {
        departmentDao.updateDepartment(dep);

    }

    public List<Departement> getAll() {
        return departmentDao.getDepartment();
    }

    public Departement findById(int id) {
        return departmentDao.getDepartmentById(id);
    }
}
