package com.wms.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the funcionario database table.
 * 
 */
@Entity
@NamedQuery(name="Funcionario.findAll", query="SELECT f FROM Funcionario f")
public class Funcionario implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="id_funcionario")
	private int idFuncionario;

	private String bairro;

	@Column(name="carteira_trabalho")
	private String carteiraTrabalho;

	private String cep;

	private String complemento;

	@Column(name="cpf_cnpj")
	private String cpfCnpj;

	@Temporal(TemporalType.DATE)
	@Column(name="data_nasc")
	private Date dataNasc;

	private String logradouro;

	private String nome;

	private String numero;

	private String rg;

	private BigDecimal salario;

	private String telefone;

	//bi-directional many-to-many association to Conta
	@ManyToMany
	@JoinColumn(name="id_funcionario")
	private List<Conta> contas;

	//bi-directional many-to-one association to ContaBancaria
	@ManyToOne
	@JoinColumn(name="id_conta_bancaria")
	private ContaBancaria contaBancaria;

	//bi-directional many-to-one association to EmpresaTerceirizada
	@ManyToOne
	@JoinColumn(name="id_empresa")
	private EmpresaTerceirizada empresaTerceirizada;

	//bi-directional many-to-one association to Funcao
	@ManyToOne
	@JoinColumn(name="id_funcao")
	private Funcao funcao;

	//bi-directional many-to-one association to Obra
	@ManyToOne
	private Obra obra;

	public Funcionario() {
	}

	public int getIdFuncionario() {
		return this.idFuncionario;
	}

	public void setIdFuncionario(int idFuncionario) {
		this.idFuncionario = idFuncionario;
	}

	public String getBairro() {
		return this.bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getCarteiraTrabalho() {
		return this.carteiraTrabalho;
	}

	public void setCarteiraTrabalho(String carteiraTrabalho) {
		this.carteiraTrabalho = carteiraTrabalho;
	}

	public String getCep() {
		return this.cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getComplemento() {
		return this.complemento;
	}

	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}

	public String getCpfCnpj() {
		return this.cpfCnpj;
	}

	public void setCpfCnpj(String cpfCnpj) {
		this.cpfCnpj = cpfCnpj;
	}

	public Date getDataNasc() {
		return this.dataNasc;
	}

	public void setDataNasc(Date dataNasc) {
		this.dataNasc = dataNasc;
	}

	public String getLogradouro() {
		return this.logradouro;
	}

	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}

	public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getNumero() {
		return this.numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public String getRg() {
		return this.rg;
	}

	public void setRg(String rg) {
		this.rg = rg;
	}

	public BigDecimal getSalario() {
		return this.salario;
	}

	public void setSalario(BigDecimal salario) {
		this.salario = salario;
	}

	public String getTelefone() {
		return this.telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public List<Conta> getContas() {
		return this.contas;
	}

	public void setContas(List<Conta> contas) {
		this.contas = contas;
	}

	public ContaBancaria getContaBancaria() {
		return this.contaBancaria;
	}

	public void setContaBancaria(ContaBancaria contaBancaria) {
		this.contaBancaria = contaBancaria;
	}

	public EmpresaTerceirizada getEmpresaTerceirizada() {
		return this.empresaTerceirizada;
	}

	public void setEmpresaTerceirizada(EmpresaTerceirizada empresaTerceirizada) {
		this.empresaTerceirizada = empresaTerceirizada;
	}

	public Funcao getFuncao() {
		return this.funcao;
	}

	public void setFuncao(Funcao funcao) {
		this.funcao = funcao;
	}

	public Obra getObra() {
		return this.obra;
	}

	public void setObra(Obra obra) {
		this.obra = obra;
	}

}