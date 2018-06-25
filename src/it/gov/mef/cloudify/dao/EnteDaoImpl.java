package it.gov.mef.cloudify.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.ParameterExpression;
import javax.persistence.criteria.Root;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import it.gov.mef.cloudify.dto.EnteDto;
import it.gov.mef.cloudify.model.Ente;

@Service
@Transactional
public class EnteDaoImpl implements EnteDao {

	@Autowired
	private EntityManager em;
	
	@Override
	public List<Ente> findAllEnti() {
		
		List<Ente> enti = em.createQuery("select e from Ente e").getResultList();
		
		return enti;
	}

	@Override
	public Ente findEnteByName(String name) {
		
		Ente result = null;
		
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<Ente> criteria = cb.createQuery(Ente.class);
		Root<Ente> rootPath = criteria.from(Ente.class);
		
		ParameterExpression<String> p = cb.parameter(String.class);
		
		criteria.select(rootPath)
		        .where(cb.equal(rootPath.get("name"), p));
		
		TypedQuery<Ente> query = em.createQuery(criteria);
		query.setParameter(p, name);
		
		result = query.getSingleResult();
		
		return result;
	}

	@Override
	public Ente addEnte(EnteDto newEnte) {
		
		Ente ente = new Ente();
		ente.setName(newEnte.getName());
		ente.setAddress(newEnte.getAddress());
		ente.setStartDate(newEnte.getStartDate());
		
		em.persist(ente);
		
		return ente;
	}

	@Override
	public Ente updateEnte(EnteDto ente) {
		
		String name = ente.getName();
		Ente result = null;
		
		Ente origEnte = findEnteByName(name);
		
		origEnte.setAddress(ente.getAddress());
		origEnte.setStartDate(ente.getStartDate());
		
		result = em.merge(origEnte);
		
		return result;
	}

	@Override
	public Ente deleteEnte(Long enteId) {
		
		Ente ente = em.find(Ente.class, enteId);
		em.remove(ente);
		
		ente.setSequEnte(null);
		return ente;
	}
	
	

}
