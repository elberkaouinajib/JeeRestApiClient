package com.ynov.java.informationClient.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ynov.java.informationClient.dao.ConseillerDao;
import com.ynov.java.informationClient.model.Conseiller;

@Controller
@RestController
public class ConseillerController {
	
	@Autowired
    ConseillerDao conseillerRepository ;
	
	@RequestMapping(value= "/listConseillers", method=RequestMethod.GET)
	public List<Conseiller> listConseillers() {
		
		return conseillerRepository.findAll();
		
	}
	
	@RequestMapping(value="/createConseiller", method=RequestMethod.POST)
	public Conseiller createConseiller(@RequestBody Conseiller conseiller) {
		
		Conseiller c = conseillerRepository.saveAndFlush(conseiller);
		
		return c;
	}

}
