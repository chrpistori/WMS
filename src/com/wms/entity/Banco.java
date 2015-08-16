package com.wms.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the banco database table.
 * 
 */
@Entity
@NamedQuery(name="Banco.findAll", query="SELECT b FROM Banco b")
public class Banco implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="id_banco")
	private int idBanco;

	@Column(name="nome_banco")
	private String nomeBanco;

	//bi-directional many-to-one association to ContaBancaria
	@OneToMany(mappedBy="banco")
	private List<ContaBancaria> contaBancarias;

	public Banco() {
	}

	public int getIdBanco() {
		return this.idBanco;
	}

	public void setIdBanco(int idBanco) {
		this.idBanco = idBanco;
	}

	public String getNomeBanco() {
		return this.nomeBanco;
	}

	public void setNomeBanco(String nomeBanco) {
		this.nomeBanco = nomeBanco;
	}

	public List<ContaBancaria> getContaBancarias() {
		return this.contaBancarias;
	}

	public void setContaBancarias(List<ContaBancaria> contaBancarias) {
		this.contaBancarias = contaBancarias;
	}

	public ContaBancaria addContaBancaria(ContaBancaria contaBancaria) {
		getContaBancarias().add(contaBancaria);
		contaBancaria.setBanco(this);

		return contaBancaria;
	}

	public ContaBancaria removeContaBancaria(ContaBancaria contaBancaria) {
		getContaBancarias().remove(contaBancaria);
		contaBancaria.setBanco(null);

		return contaBancaria;
	}

}