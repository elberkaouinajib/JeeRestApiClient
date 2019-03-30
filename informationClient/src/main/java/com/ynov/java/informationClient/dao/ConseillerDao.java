package com.ynov.java.informationClient.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.ynov.java.informationClient.model.Client;
import com.ynov.java.informationClient.model.Conseiller;

public interface ConseillerDao extends JpaRepository<Conseiller,Integer>{
	
	Conseiller findConseillerByidConseiller(Integer idConseiller);
	
	@Query("SELECT cl FROM Client cl WHERE cl.conseiller = ?1")
	List<Client> findAllConseillerClients(Conseiller conseiler);
	
}
