package com.wms.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


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
	@Column(name="id_conta_bancaria")
	private int idContaBancaria;

	private String agencia;

	@Column(name="n_conta_bancaria")
	private String nContaBancaria;

	private int operacao;

	private String titular;

	//bi-directional many-to-one association to Banco
	@ManyToOne
	@JoinColumn(name="id_banco")
	private Banco banco;

	//bi-directional many-to-one association to Funcionario
	@OneToMany(mappedBy="contaBancaria")
	private List<Funcionario> funcionarios;

	//bi-directional many-to-one association to Obra
	@OneToMany(mappedBy="contaBancaria")
	private List<Obra> obras;

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

	public List<Funcionario> getFuncionarios() {
		return this.funcionarios;
	}

	public void setFuncionarios(List<Funcionario> funcionarios) {
		this.funcionarios = funcionarios;
	}

	public Funcionario addFuncionario(Funcionario funcionario) {
		getFuncionarios().add(funcionario);
		funcionario.setContaBancaria(this);

		return funcionario;
	}

	public Funcionario removeFuncionario(Funcionario funcionario) {
		getFuncionarios().remove(funcionario);
		funcionario.setContaBancaria(null);

		return funcionario;
	}

	public List<Obra> getObras() {
		return this.obras;
	}

	public void setObras(List<Obra> obras) {
		this.obras = obras;
	}

	public Obra addObra(Obra obra) {
		getObras().add(obra);
		obra.setContaBancaria(this);

		return obra;
	}

	public Obra removeObra(Obra obra) {
		getObras().remove(obra);
		obra.setContaBancaria(null);

		return obra;
	}

}