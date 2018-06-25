package it.gov.mef.cloudify.dao;

import java.util.List;

import it.gov.mef.cloudify.dto.EnteDto;
import it.gov.mef.cloudify.model.Ente;

public interface EnteDao {

	public List<Ente> findAllEnti();
	
	public Ente findEnteByName(String name);
	
	public Ente addEnte(EnteDto newEnte);
	
	public Ente updateEnte(EnteDto ente);
	
	public Ente deleteEnte(Long enteId);
}
