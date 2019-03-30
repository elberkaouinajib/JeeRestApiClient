package com.ynov.java.informationClient.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ynov.java.informationClient.dao.ConseillerDao;
import com.ynov.java.informationClient.model.Client;
import com.ynov.java.informationClient.model.Conseiller;

@Controller
@RestController
public class ConseillerController {
	
	@Autowired
    ConseillerDao conseillerRepository ;
	
	@RequestMapping(value= "/conseillers", method=RequestMethod.GET)
	public List<Conseiller> conseillers() {
		
		return conseillerRepository.findAll();
		
	}
	
	@RequestMapping(value= "/conseiller/{idConseiller}", method=RequestMethod.GET)
	public Conseiller conseiller(@PathVariable Integer idConseiller) {
		
		return conseillerRepository.findConseillerByidConseiller(idConseiller);
		
	}
	
	@RequestMapping(value= "/conseiller/clients/{idConseiller}", method=RequestMethod.GET)
	public List<Client> ListConseillerClients(@PathVariable Integer idConseiller) {
		
		return conseillerRepository.findAllConseillerClients(conseillerRepository.findConseillerByidConseiller(idConseiller));
		
	}
	
	@RequestMapping(value="/conseiller", method=RequestMethod.POST)
	public Conseiller conseiller(@RequestBody Conseiller conseiller) {
		
		Conseiller c = conseillerRepository.saveAndFlush(conseiller);
		
		return c;
	}
	
	@RequestMapping(value= "/conseiller/{idConseiller}", method=RequestMethod.DELETE)
	public Boolean deleteConseillert(@PathVariable Integer idConseiller) {
		
		Conseiller c =conseillerRepository.findConseillerByidConseiller(idConseiller);
		
		if(c!=null)
		{
			conseillerRepository.delete(c);
			return true;
		}
		return false;
		
	}
	
	@RequestMapping(value="/conseiller", method=RequestMethod.PUT)
	public Conseiller updateConseiller(@RequestBody Conseiller conseiller) {
		
		Conseiller c = conseillerRepository.saveAndFlush(conseiller);
		
		return c;
	}

}
