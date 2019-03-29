package com.ynov.java.informationClient.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ynov.java.informationClient.dao.ClientDao;
import com.ynov.java.informationClient.model.Client;

@Controller
@RestController
public class ClientController {
	
	@Autowired
    ClientDao clientRepository ;
	
	@RequestMapping(value="/createClient", method=RequestMethod.POST)
	public Client createClient(@RequestBody Client client) {
		
		Client c = clientRepository.saveAndFlush(client);
		
		return c;
	}


}
