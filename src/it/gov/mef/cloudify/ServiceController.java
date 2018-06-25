package it.gov.mef.cloudify;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.annotation.JsonView;

import it.gov.mef.cloudify.dao.EnteDao;
import it.gov.mef.cloudify.dto.EnteDto;
import it.gov.mef.cloudify.model.Ente;

@RestController
public class ServiceController {
	
	@Autowired
	private EnteDao enteDao;
		
	@JsonView(value = EnteDto.Public.class)
	@RequestMapping(value = "/rest/enti/all", method = {RequestMethod.GET},
	produces = MediaType.APPLICATION_JSON_VALUE)
	public List<EnteDto> findAllEnti(){
		
		List<Ente> enti = enteDao.findAllEnti();
		
		List<EnteDto> result = new ArrayList<EnteDto>();
		
		if(!CollectionUtils.isEmpty(enti)) {
			for(Ente ente : enti) {
				
				EnteDto item = new EnteDto();
				item.setName(ente.getName());
				item.setAddress(ente.getAddress());
				item.setStartDate(ente.getStartDate());
				
				result.add(item);
			}
		}
		
		return result;		
	}
	
	@JsonView(value = EnteDto.Public.class)
	@RequestMapping(value = "/rest/enti/add", method = {RequestMethod.POST},
			consumes = MediaType.APPLICATION_JSON_VALUE,
			produces = MediaType.APPLICATION_JSON_VALUE)
	public EnteDto addEnte(@RequestBody EnteDto newEnte) {
			
		Ente ente = enteDao.addEnte(newEnte);
		
		EnteDto result = new EnteDto();
		result.setName(ente.getName());
		result.setAddress(ente.getAddress());
		result.setStartDate(ente.getStartDate());
		
		return result;
		
	}
	
	@JsonView(value = EnteDto.Public.class)
	@RequestMapping(value = "/rest/enti/update", method = {RequestMethod.POST},
			consumes = MediaType.APPLICATION_JSON_VALUE,
			produces = MediaType.APPLICATION_JSON_VALUE)
	public EnteDto updateEnte(@RequestBody EnteDto newEnte) {
			
		Ente ente = enteDao.updateEnte(newEnte);
		
		EnteDto result = new EnteDto();
		result.setName(ente.getName());
		result.setAddress(ente.getAddress());
		result.setStartDate(ente.getStartDate());
		
		return result;
		
	}
	
	@RequestMapping(value = "/rest/enti/delete/{enteId}", method = {RequestMethod.POST},
			consumes = MediaType.APPLICATION_JSON_VALUE)
	public boolean deleteEnte(@PathVariable("enteId") Long enteId) {
			
		Ente ente = enteDao.deleteEnte(enteId);
		
		return true;
		
	}
}
