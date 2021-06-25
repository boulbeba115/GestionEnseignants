package tn.iit.entities;

import java.util.Date;

public class Seance {

    public enum SeanceType {
        COUR, TD, TP
    }
    private int id;
    private Date date;
    private Date heureDebut;
    private float duree;
    private boolean valide;
    private SeanceType type;
    private Matiere matiere;
    private Enseignant enseignant;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Date getHeureDebut() {
        return heureDebut;
    }

    public void setHeureDebut(Date heureDebut) {
        this.heureDebut = heureDebut;
    }

    public float getDuree() {
        return duree;
    }

    public void setDuree(float duree) {
        this.duree = duree;
    }

    public boolean isValide() {
        return valide;
    }

    public void setValide(boolean valide) {
        this.valide = valide;
    }

    public SeanceType getType() {
        return type;
    }

    public void setType(SeanceType type) {
        this.type = type;
    }

    public Matiere getMatiere() {
        return matiere;
    }

    public void setMatiere(Matiere matiere) {
        this.matiere = matiere;
    }

    public Enseignant getEnseignant() {
        return enseignant;
    }

    public void setEnseignant(Enseignant enseignant) {
        this.enseignant = enseignant;
    }

    public int seanceToInt() {
        if (this.type == SeanceType.COUR) {
            return 0;
        }
        if (this.type == SeanceType.TD) {
            return 1;
        }
        return 2;
    }

    public void setTypeWithInt(int i) {
        if (i == 0) {
            this.type = SeanceType.COUR;
            return;
        }
        if (i == 1) {
            this.type = SeanceType.TD;
            return;
        }
        this.type = SeanceType.TP;
        return;

    }

}
