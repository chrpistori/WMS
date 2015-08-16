package com.wms.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the empresa_terceirizada database table.
 * 
 */
@Entity
@Table(name="empresa_terceirizada")
@NamedQuery(name="EmpresaTerceirizada.findAll", query="SELECT e FROM EmpresaTerceirizada e")
public class EmpresaTerceirizada implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="id_empresa")
	private int idEmpresa;

	private String cnpj;

	private String contato;

	private String email;

	@Column(name="nome_fantasia")
	private String nomeFantasia;

	@Column(name="razao_social")
	private String razaoSocial;

	private String telefone;

	//bi-directional many-to-one association to Funcionario
	@OneToMany(mappedBy="empresaTerceirizada")
	private List<Funcionario> funcionarios;

	public EmpresaTerceirizada() {
	}

	public int getIdEmpresa() {
		return this.idEmpresa;
	}

	public void setIdEmpresa(int idEmpresa) {
		this.idEmpresa = idEmpresa;
	}

	public String getCnpj() {
		return this.cnpj;
	}

	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}

	public String getContato() {
		return this.contato;
	}

	public void setContato(String contato) {
		this.contato = contato;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNomeFantasia() {
		return this.nomeFantasia;
	}

	public void setNomeFantasia(String nomeFantasia) {
		this.nomeFantasia = nomeFantasia;
	}

	public String getRazaoSocial() {
		return this.razaoSocial;
	}

	public void setRazaoSocial(String razaoSocial) {
		this.razaoSocial = razaoSocial;
	}

	public String getTelefone() {
		return this.telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public List<Funcionario> getFuncionarios() {
		return this.funcionarios;
	}

	public void setFuncionarios(List<Funcionario> funcionarios) {
		this.funcionarios = funcionarios;
	}

	public Funcionario addFuncionario(Funcionario funcionario) {
		getFuncionarios().add(funcionario);
		funcionario.setEmpresaTerceirizada(this);

		return funcionario;
	}

	public Funcionario removeFuncionario(Funcionario funcionario) {
		getFuncionarios().remove(funcionario);
		funcionario.setEmpresaTerceirizada(null);

		return funcionario;
	}

}