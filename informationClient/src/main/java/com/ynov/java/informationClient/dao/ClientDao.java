package com.ynov.java.informationClient.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ynov.java.informationClient.model.Client;

public interface ClientDao  extends JpaRepository<Client,Integer>{

}
