package com.wms.entity;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the conta_bancaria database table.
 * 
 */
@Entity
@Table(name="conta_bancaria")
@NamedQuery(name="ContaBancaria.findAll", query="SELECT c FROM ContaBancaria c")
public class ContaBancaria implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_conta_bancaria")
	private int idContaBancaria;

	private String agencia;

	@Column(name="n_conta_bancaria")
	private String nContaBancaria;

	private int operacao;

	private String titular;

	//bi-directional many-to-one association to Banco
	@ManyToOne
	private Banco banco;

	public ContaBancaria() {
	}

	public int getIdContaBancaria() {
		return this.idContaBancaria;
	}

	public void setIdContaBancaria(int idContaBancaria) {
		this.idContaBancaria = idContaBancaria;
	}

	public String getAgencia() {
		return this.agencia;
	}

	public void setAgencia(String agencia) {
		this.agencia = agencia;
	}

	public String getNContaBancaria() {
		return this.nContaBancaria;
	}

	public void setNContaBancaria(String nContaBancaria) {
		this.nContaBancaria = nContaBancaria;
	}

	public int getOperacao() {
		return this.operacao;
	}

	public void setOperacao(int operacao) {
		this.operacao = operacao;
	}

	public String getTitular() {
		return this.titular;
	}

	public void setTitular(String titular) {
		this.titular = titular;
	}

	public Banco getBanco() {
		return this.banco;
	}

	public void setBanco(Banco banco) {
		this.banco = banco;
	}

}