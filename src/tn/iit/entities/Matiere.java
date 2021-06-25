package tn.iit.entities;

public class Matiere {

	private int id;
	private String libelle;
	private float chargeCours;
	private float chargeTd;
	private float chargeTp;
	private Niveau Niveau;
	private Departement department;

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

	public float getChargeCours() {
		return chargeCours;
	}

	public void setChargeCours(float chargeCours) {
		this.chargeCours = chargeCours;
	}

	public float getChargeTd() {
		return chargeTd;
	}

	public void setChargeTd(float chargeTd) {
		this.chargeTd = chargeTd;
	}

	public float getChargeTp() {
		return chargeTp;
	}

	public void setChargeTp(float chargeTp) {
		this.chargeTp = chargeTp;
	}

	public Niveau getNiveau() {
		return Niveau;
	}

	public void setNiveau(Niveau niveau) {
		Niveau = niveau;
	}

	public Departement getDepartment() {
		return department;
	}

	public void setDepartment(Departement department) {
		this.department = department;
	}

}
