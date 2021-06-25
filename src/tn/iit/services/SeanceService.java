/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tn.iit.services;

import java.util.List;
import tn.iit.entities.Seance;
import tn.iit.persistance.SeanceDao;

/**
 *
 * @author boulbeba
 */
public class SeanceService {

    SeanceDao seanceDao = new SeanceDao();

    public Seance add(Seance seance) {
        seanceDao.addSeance(seance);
        return seance;
    }

    public Seance update(Seance seance) {
        return seanceDao.updateSeance(seance);
    }

    public List<Seance> getAll() {
        return seanceDao.getAllSeances();
    }

    public Seance findById(int id) {
        return seanceDao.findSeanceById(id);
    }

    public void delete(int id) {
        seanceDao.deleteSeance(id);
    }
}
