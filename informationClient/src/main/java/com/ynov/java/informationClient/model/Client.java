package com.ynov.java.informationClient.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@SuppressWarnings("serial")
@Entity
public class Client implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idClient;
	@Column
	private String nom;
	@Column
	private String prenom;
	@Column
	private Date dateNaissance;
	@Column
	private String email;
	@Column
	private Date dateInscritpion;
	@Column
	private String telephone;
	@Column
	private String adresse;
	@Column
	private String profession;
	@Column
	private Date dateEmbauche;		
	@ManyToOne
	@JoinColumn(name="idConseiller")
	private Conseiller conseiller;
	private Date datePriseEnchargeConseiller;
	
	public Client() {
		super();
	}

	public Client(Integer idClient, String nom, String prenom, Date dateNaissance, String email, Date dateInscritpion,
			String telephone, String adresse, String profession, Date dateEmbauche, Conseiller conseiller,
			Date datePriseEnchargeConseiller) {
		super();
		this.idClient = idClient;
		this.nom = nom;
		this.prenom = prenom;
		this.dateNaissance = dateNaissance;
		this.email = email;
		this.dateInscritpion = dateInscritpion;
		this.telephone = telephone;
		this.adresse = adresse;
		this.profession = profession;
		this.dateEmbauche = dateEmbauche;
		this.conseiller = conseiller;
		this.datePriseEnchargeConseiller = datePriseEnchargeConseiller;
	}

	public Integer getIdClient() {
		return idClient;
	}

	public void setIdClient(Integer idClient) {
		this.idClient = idClient;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public Date getDateNaissance() {
		return dateNaissance;
	}

	public void setDateNaissance(Date dateNaissance) {
		this.dateNaissance = dateNaissance;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getDateInscritpion() {
		return dateInscritpion;
	}

	public void setDateInscritpion(Date dateInscritpion) {
		this.dateInscritpion = dateInscritpion;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getAdresse() {
		return adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	public String getProfession() {
		return profession;
	}

	public void setProfession(String profession) {
		this.profession = profession;
	}

	public Date getDateEmbauche() {
		return dateEmbauche;
	}

	public void setDateEmbauche(Date dateEmbauche) {
		this.dateEmbauche = dateEmbauche;
	}

	public Conseiller getConseiller() {
		return conseiller;
	}

	public void setConseiller(Conseiller conseiller) {
		this.conseiller = conseiller;
	}

	public Date getDatePriseEnchargeConseiller() {
		return datePriseEnchargeConseiller;
	}

	public void setDatePriseEnchargeConseiller(Date datePriseEnchargeConseiller) {
		this.datePriseEnchargeConseiller = datePriseEnchargeConseiller;
	}

}
