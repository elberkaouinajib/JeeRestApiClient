package com.ynov.java.informationClient.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@SuppressWarnings("serial")
@Entity
public class LienRelation  implements Serializable{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idLienRelation;
	@ManyToOne
	@JoinColumn(name="idClient1")
	private Client client1;
	@ManyToOne
	@JoinColumn(name="idClient2")
	private Client client2;

	private String libelle;
	
	public LienRelation() {
		super();
	}

	public LienRelation(Integer idLienRelation, Client client1, Client client2, String libelle) {
		super();
		this.idLienRelation = idLienRelation;
		this.client1 = client1;
		this.client2 = client2;
		this.libelle = libelle;
	}

	public Integer getIdLienRelation() {
		return idLienRelation;
	}

	public void setIdLienRelation(Integer idLienRelation) {
		this.idLienRelation = idLienRelation;
	}

	public Client getClient1() {
		return client1;
	}

	public void setClient1(Client client1) {
		this.client1 = client1;
	}

	public Client getClient2() {
		return client2;
	}

	public void setClient2(Client client2) {
		this.client2 = client2;
	}

	public String getLibelle() {
		return libelle;
	}

	public void setLibelle(String libelle) {
		this.libelle = libelle;
	}
	
	
	
}
