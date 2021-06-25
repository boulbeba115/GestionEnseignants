package tn.iit.entities;

public class Enseignant {

    private int id;
    private int cin;
    private String prenom;
    private String nom;
    private String adresse;
    private String email;
    private int phone;
    private String login;
    private String password;
    private Grade grade;
    private Departement departement;

    public Enseignant(int cin, String prenom, String nom, String adresse, String email, int phone, String login,
            String password, Grade grade, Departement departement) {
        super();
        this.cin = cin;
        this.prenom = prenom;
        this.nom = nom;
        this.adresse = adresse;
        this.email = email;
        this.phone = phone;
        this.login = login;
        this.password = password;
        this.grade = grade;
        this.departement = departement;
    }

    public Enseignant() {
        super();
    }

    public Enseignant(int cin, String prenom, String nom, String adresse, String email, int phone, String login,
            String password) {
        this.cin = cin;
        this.prenom = prenom;
        this.nom = nom;
        this.adresse = adresse;
        this.email = email;
        this.phone = phone;
        this.login = login;
        this.password = password;

    }

    public Enseignant(int id, int cin, String prenom, String nom, String adresse, String email, int phone, String login) {
        this.id = id;
        this.cin = cin;
        this.prenom = prenom;
        this.nom = nom;
        this.adresse = adresse;
        this.email = email;
        this.phone = phone;
        this.login = login;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCin() {
        return cin;
    }

    public void setCin(int cin) {
        this.cin = cin;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Grade getGrade() {
        return grade;
    }

    public void setGrade(Grade grade) {
        this.grade = grade;
    }

    public Departement getDepartement() {
        return departement;
    }

    public void setDepartement(Departement departement) {
        this.departement = departement;
    }

    @Override
    public String toString() {
        return "Enseignant{" + "id=" + id + ", cin=" + cin + ", prenom=" + prenom + ", nom=" + nom + ", adresse=" + adresse + ", email=" + email + ", phone=" + phone + ", login=" + login + ", password=" + password + ", grade=" + grade + ", departement=" + departement + '}';
    }

}
