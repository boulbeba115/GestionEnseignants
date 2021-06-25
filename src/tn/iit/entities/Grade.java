package tn.iit.entities;

public class Grade {

	private int id;
	private String libelle;
	private float prixC;
	private float prixTp;
	private float prixTd;

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

	public float getPrixC() {
		return prixC;
	}

	public void setPrixC(float prixC) {
		this.prixC = prixC;
	}

	public float getPrixTp() {
		return prixTp;
	}

	public void setPrixTp(float prixTp) {
		this.prixTp = prixTp;
	}

	public float getPrixTd() {
		return prixTd;
	}

	public void setPrixTd(float prixTd) {
		this.prixTd = prixTd;
	}

}
