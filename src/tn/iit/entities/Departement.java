package tn.iit.entities;


public class Departement {
	private int id;
	private String libelle;
	private Enseignant ensResponsable;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getLibelle() {
		return libelle;
	}
	public void setLibelle(String libelle) {
		this.libelle = libelle;
	}
	public Enseignant getEnsResponsable() {
		return ensResponsable;
	}
	public void setEnsResponsable(Enseignant ensResponsable) {
		this.ensResponsable = ensResponsable;
	}
	
	
}

	