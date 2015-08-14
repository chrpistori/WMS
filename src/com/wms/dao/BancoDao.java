package com.wms.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.wms.entity.Banco;

public class BancoDao {

	private EntityManagerFactory emf;
	private EntityManager em;

	public BancoDao() {
		/* Create EntityManagerFactory */
		emf = Persistence.createEntityManagerFactory("WMS");
		em = emf.createEntityManager();
	}

	public void salvar(Banco banco) {
		em.getTransaction().begin();
		em.merge(banco);
		em.getTransaction().commit();
	}

	public void remover(Banco banco) {
		em.getTransaction().begin();
		em.remove(banco);
		em.getTransaction().commit();
	}
}
