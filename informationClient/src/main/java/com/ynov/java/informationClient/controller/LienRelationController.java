package com.ynov.java.informationClient.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RestController;

import com.ynov.java.informationClient.dao.LienRelationDao;

@Controller
@RestController
public class LienRelationController {
	
	@Autowired
    LienRelationDao lienRelationRepository ;

}
