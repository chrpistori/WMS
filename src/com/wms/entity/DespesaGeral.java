package com.wms.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the despesa_geral database table.
 * 
 */
@Entity
@Table(name="despesa_geral")
@NamedQuery(name="DespesaGeral.findAll", query="SELECT d FROM DespesaGeral d")
public class DespesaGeral implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="id_despesa_geral")
	private Integer idDespesaGeral;

	private String descricao;

	private String nome;

	//bi-directional many-to-many association to Conta
	@ManyToMany
	@JoinColumn(name="id_despesa_geral")
	private List<Conta> contas;

	public DespesaGeral() {
	}

	public Integer getIdDespesaGeral() {
		return this.idDespesaGeral;
	}

	public void setIdDespesaGeral(Integer idDespesaGeral) {
		this.idDespesaGeral = idDespesaGeral;
	}

	public String getDescricao() {
		return this.descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public List<Conta> getContas() {
		return this.contas;
	}

	public void setContas(List<Conta> contas) {
		this.contas = contas;
	}

}