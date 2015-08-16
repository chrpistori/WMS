package com.wms.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the estado database table.
 * 
 */
@Entity
@NamedQuery(name="Estado.findAll", query="SELECT e FROM Estado e")
public class Estado implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="id_estado")
	private int idEstado;

	private String abreviacao;

	private String nome;

	//bi-directional many-to-one association to Cidade
	@OneToMany(mappedBy="estado")
	private List<Cidade> cidades;

	public Estado() {
	}

	public int getIdEstado() {
		return this.idEstado;
	}

	public void setIdEstado(int idEstado) {
		this.idEstado = idEstado;
	}

	public String getAbreviacao() {
		return this.abreviacao;
	}

	public void setAbreviacao(String abreviacao) {
		this.abreviacao = abreviacao;
	}

	public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public List<Cidade> getCidades() {
		return this.cidades;
	}

	public void setCidades(List<Cidade> cidades) {
		this.cidades = cidades;
	}

	public Cidade addCidade(Cidade cidade) {
		getCidades().add(cidade);
		cidade.setEstado(this);

		return cidade;
	}

	public Cidade removeCidade(Cidade cidade) {
		getCidades().remove(cidade);
		cidade.setEstado(null);

		return cidade;
	}

}