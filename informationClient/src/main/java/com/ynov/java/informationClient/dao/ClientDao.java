package com.ynov.java.informationClient.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.ynov.java.informationClient.model.Client;
import com.ynov.java.informationClient.model.LienRelation;

public interface ClientDao  extends JpaRepository<Client,Integer>{
	
	Client findClientByidClient(Integer idClient);
	
	@Query("SELECT lr from LienRelation lr WHERE lr.client1.idClient = ?1")
	List<LienRelation> findAllClientRelationWith(Integer idClient);

}
