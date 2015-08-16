package com.wms.entity;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the anexo database table.
 * 
 */
@Entity
@NamedQuery(name="Anexo.findAll", query="SELECT a FROM Anexo a")
public class Anexo implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="id_anexo")
	private int idAnexo;

	@Lob
	private byte[] arquivo;

	@Lob
	private String descricao;

	@Column(name="id_obra")
	private int idObra;

	private String nome;

	//bi-directional many-to-one association to Conta
	@ManyToOne
	@JoinColumn(name="id_conta")
	private Conta conta;

	//bi-directional many-to-one association to Obra
	@ManyToOne
	@JoinColumn(name="numero_contrato")
	private Obra obra;

	public Anexo() {
	}

	public int getIdAnexo() {
		return this.idAnexo;
	}

	public void setIdAnexo(int idAnexo) {
		this.idAnexo = idAnexo;
	}

	public byte[] getArquivo() {
		return this.arquivo;
	}

	public void setArquivo(byte[] arquivo) {
		this.arquivo = arquivo;
	}

	public String getDescricao() {
		return this.descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public int getIdObra() {
		return this.idObra;
	}

	public void setIdObra(int idObra) {
		this.idObra = idObra;
	}

	public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Conta getConta() {
		return this.conta;
	}

	public void setConta(Conta conta) {
		this.conta = conta;
	}

	public Obra getObra() {
		return this.obra;
	}

	public void setObra(Obra obra) {
		this.obra = obra;
	}

}