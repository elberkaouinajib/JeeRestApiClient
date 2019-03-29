package com.ynov.java.informationClient.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@SuppressWarnings("serial")
@Entity
public class Conseiller  implements Serializable {
    
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idConseiller;
	@Column
	private String nom;
	@Column
	private String prenom;
	@Column
	private String email;
	@Column
	private String telephone;
	@Column
	private String lieuAffectation;
	
	public Conseiller() {
		super();
	}
	

	public Conseiller(Integer idConseiller, String nom, String prenom, String email, String telephone,
			String lieuAffectation) {
		super();
		this.idConseiller = idConseiller;
		this.nom = nom;
		this.prenom = prenom;
		this.email = email;
		this.telephone = telephone;
		this.lieuAffectation = lieuAffectation;
	}


	public Integer getIdConseiller() {
		return idConseiller;
	}

	public void setIdConseiller(Integer idConseiller) {
		this.idConseiller = idConseiller;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getLieuAffectation() {
		return lieuAffectation;
	}

	public void setLieuAffectation(String lieuAffectation) {
		this.lieuAffectation = lieuAffectation;
	}
	
	
}

