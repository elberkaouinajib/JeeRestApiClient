package com.ynov.java.informationClient.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ynov.java.informationClient.dao.ClientDao;
import com.ynov.java.informationClient.dao.LienRelationDao;
import com.ynov.java.informationClient.model.Client;
import com.ynov.java.informationClient.model.LienRelation;

@Controller
@RestController
public class ClientController {
	
	@Autowired
    ClientDao clientRepository ;
	
	@Autowired
    LienRelationDao lienRelationRepository ;
	
	@RequestMapping(value= "/clients", method=RequestMethod.GET)
	public List<Client> clients() {
		
		return clientRepository.findAll();
		
	}
	
	@RequestMapping(value= "/client/{idClient}", method=RequestMethod.GET)
	public Client client(@PathVariable Integer idClient) {
		
		return clientRepository.findClientByidClient(idClient);
		
	}
	

	@RequestMapping(value= "/client/{idClient}/relations", method=RequestMethod.GET)
	public List<LienRelation> listRelationclient(@PathVariable Integer idClient) {
		
		return clientRepository.findAllClientRelationWith(idClient);
		
	}
	
	@RequestMapping(value="/client", method=RequestMethod.POST)
	public Client createClient(@RequestBody Client client) {
		
		Client c = clientRepository.saveAndFlush(client);
		
		return c;
	}
	
	@RequestMapping(value="/client/{idClient1}/relation/{idClient2}/{libRelation}", method=RequestMethod.POST)
	public LienRelation createLienRelation(@PathVariable Integer idClient1,@PathVariable Integer idClient2,@PathVariable String libRelation) {
		
		Client c1 =clientRepository.findClientByidClient(idClient1);
		Client c2 =clientRepository.findClientByidClient(idClient2);
		if(c1!=null && c2!=null && libRelation!=null)
		{
			LienRelation lr =new LienRelation();
			lr.setClient1(c1);
			lr.setClient2(c2);
			lr.setLibelle(libRelation);
			return lienRelationRepository.saveAndFlush(lr);			
		}
		
		return null;
	}
	
	@RequestMapping(value= "/client/{idClient}", method=RequestMethod.DELETE)
	public Boolean deleteClient(@PathVariable Integer idClient) {
		
		Client c =clientRepository.findClientByidClient(idClient);
		
		if(c!=null)
		{
			clientRepository.delete(c);
			return true;
		}
		return false;
		
	}
	
	@RequestMapping(value= "/client/{idClient1}/relation/{idClient2}", method=RequestMethod.DELETE)
	public Boolean deleteClientsRelation(@PathVariable Integer idClient1,@PathVariable Integer idClient2) {
		
		Client c1 =clientRepository.findClientByidClient(idClient1);
		Client c2 =clientRepository.findClientByidClient(idClient2);
		List<LienRelation> lr1=clientRepository.findAllClientRelationWith(idClient1);
		List<LienRelation>  lr2=clientRepository.findAllClientRelationWith(idClient2);	
		
		Boolean relationExist=false;
		
		
		for (LienRelation lienRelation : lr1) {
			if(lienRelation.getClient2().equals(c2))
			{
				lienRelationRepository.delete(lienRelation);
				relationExist=true;
			}
		}
		
		for (LienRelation lienRelation : lr2) {
			if(lienRelation.getClient2().equals(c1))
			{
				lienRelationRepository.delete(lienRelation);
				relationExist=true;
			}
		}
		if(relationExist)
			return true;
		return false;
		
	}
	
	@RequestMapping(value= "/client", method=RequestMethod.PUT)
	public Client updateClient(@RequestBody Client client) {		
		
		return clientRepository.saveAndFlush(client);
		
	}
	
	@RequestMapping(value= "/client/{idClient1}/relation/{idClient2}/{libRelation}", method=RequestMethod.PUT)
	public LienRelation updateRelation(@PathVariable Integer idClient1,@PathVariable Integer idClient2,@PathVariable String libRelation) {		
		
		Client c2 =clientRepository.findClientByidClient(idClient2);
		List<LienRelation> lr1=clientRepository.findAllClientRelationWith(idClient1);
		
		
		for (LienRelation lienRelation : lr1) {
			if(lienRelation.getClient2().equals(c2))
			{
				lienRelation.setLibelle(libRelation);
				return lienRelationRepository.saveAndFlush(lienRelation);
			}
		}
		
		return null;
	}

}
