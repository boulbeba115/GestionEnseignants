/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tn.iit.services;

import java.util.List;
import tn.iit.entities.Matiere;
import tn.iit.entities.Niveau;
import tn.iit.persistance.NiveauDao;

/**
 *
 * @author boulbeba
 */
public class NiveauService {

    NiveauDao niveauDao = new NiveauDao();

    public Niveau add(Niveau niv) {
        niveauDao.addNiveau(niv);
        return niv;
    }

    public List<Niveau> getAll() {
        return niveauDao.getAllNiveau();
    }

    public Niveau findById(int id) {
        return niveauDao.findById(id);
    }

    public void update(Niveau niveau) {
        niveauDao.updateNiv(niveau);
    }

    public void remove(int id) {
        niveauDao.deleteNiv(id);
    }
}
