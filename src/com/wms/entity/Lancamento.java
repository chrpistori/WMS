package com.wms.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;


/**
 * The persistent class for the lancamento database table.
 * 
 */
@Entity
@NamedQuery(name="Lancamento.findAll", query="SELECT l FROM Lancamento l")
public class Lancamento implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="id_lancamento")
	private int idLancamento;

	@Temporal(TemporalType.DATE)
	@Column(name="data_lancamento")
	private Date dataLancamento;

	private String observacao;

	@Column(name="valor_lancamento")
	private BigDecimal valorLancamento;

	//bi-directional many-to-one association to Conta
	@ManyToOne
	@JoinColumn(name="id_conta")
	private Conta conta;

	public Lancamento() {
	}

	public int getIdLancamento() {
		return this.idLancamento;
	}

	public void setIdLancamento(int idLancamento) {
		this.idLancamento = idLancamento;
	}

	public Date getDataLancamento() {
		return this.dataLancamento;
	}

	public void setDataLancamento(Date dataLancamento) {
		this.dataLancamento = dataLancamento;
	}

	public String getObservacao() {
		return this.observacao;
	}

	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}

	public BigDecimal getValorLancamento() {
		return this.valorLancamento;
	}

	public void setValorLancamento(BigDecimal valorLancamento) {
		this.valorLancamento = valorLancamento;
	}

	public Conta getConta() {
		return this.conta;
	}

	public void setConta(Conta conta) {
		this.conta = conta;
	}

}