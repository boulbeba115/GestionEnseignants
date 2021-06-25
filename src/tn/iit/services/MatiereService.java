/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tn.iit.services;

import java.util.List;
import tn.iit.entities.Matiere;
import tn.iit.persistance.MatiereDao;

/**
 *
 * @author boulbeba
 */
public class MatiereService {

    MatiereDao matiereDao = new MatiereDao();

    public Matiere add(Matiere mat) {
        matiereDao.addMatiere(mat);
        return mat;
    }

    public Matiere update(Matiere mat) {
        return matiereDao.updateMatiere(mat);
    }

    public List<Matiere> getAll() {
        return matiereDao.getMatieres();
    }

    public Matiere findById(int id) {
        return matiereDao.findEnsById(id);
    }

    public void delete(int id) {
        matiereDao.deleteMatiere(id);
    }
}
