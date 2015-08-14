package com.wms.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the alerta_vencimento database table.
 * 
 */
@Entity
@Table(name="alerta_vencimento")
@NamedQuery(name="AlertaVencimento.findAll", query="SELECT a FROM AlertaVencimento a")
public class AlertaVencimento implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_alerta")
	private int idAlerta;

	@Temporal(TemporalType.DATE)
	@Column(name="data_pre_vencimento")
	private Date dataPreVencimento;

	@Temporal(TemporalType.DATE)
	@Column(name="data_vencimento")
	private Date dataVencimento;

	@Temporal(TemporalType.DATE)
	@Column(name="data_visualizacao")
	private Date dataVisualizacao;

	private String descricao;

	private String nome;

	private byte visualizado;

	//bi-directional many-to-one association to Conta
	@ManyToOne
	private Conta conta;

	public AlertaVencimento() {
	}

	public int getIdAlerta() {
		return this.idAlerta;
	}

	public void setIdAlerta(int idAlerta) {
		this.idAlerta = idAlerta;
	}

	public Date getDataPreVencimento() {
		return this.dataPreVencimento;
	}

	public void setDataPreVencimento(Date dataPreVencimento) {
		this.dataPreVencimento = dataPreVencimento;
	}

	public Date getDataVencimento() {
		return this.dataVencimento;
	}

	public void setDataVencimento(Date dataVencimento) {
		this.dataVencimento = dataVencimento;
	}

	public Date getDataVisualizacao() {
		return this.dataVisualizacao;
	}

	public void setDataVisualizacao(Date dataVisualizacao) {
		this.dataVisualizacao = dataVisualizacao;
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

	public byte getVisualizado() {
		return this.visualizado;
	}

	public void setVisualizado(byte visualizado) {
		this.visualizado = visualizado;
	}

	public Conta getConta() {
		return this.conta;
	}

	public void setConta(Conta conta) {
		this.conta = conta;
	}

}