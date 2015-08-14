package com.wms.entity;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the banco database table.
 * 
 */
@Entity
@NamedQuery(name="Banco.findAll", query="SELECT b FROM Banco b")
public class Banco implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	@Column(name="id_banco")
	private int idBanco;

	@Column(name="nome_banco")
	private String nomeBanco;

	public Banco() {
	}

	public int getIdBanco() {
		return this.idBanco;
	}

	public String getNomeBanco() {
		return this.nomeBanco;
	}

	public void setNomeBanco(String nomeBanco) {
		this.nomeBanco = nomeBanco;
	}

}