package com.wms.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;


/**
 * The persistent class for the cheque database table.
 * 
 */
@Entity
@NamedQuery(name="Cheque.findAll", query="SELECT c FROM Cheque c")
public class Cheque implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="id_cheque")
	private int idCheque;

	@Temporal(TemporalType.DATE)
	@Column(name="data_desconto")
	private Date dataDesconto;

	private String numero;

	private String observacao;

	@Column(name="valor_cheque")
	private BigDecimal valorCheque;

	//bi-directional many-to-one association to Conta
	@ManyToOne
	@JoinColumn(name="id_conta")
	private Conta conta;

	public Cheque() {
	}

	public int getIdCheque() {
		return this.idCheque;
	}

	public void setIdCheque(int idCheque) {
		this.idCheque = idCheque;
	}

	public Date getDataDesconto() {
		return this.dataDesconto;
	}

	public void setDataDesconto(Date dataDesconto) {
		this.dataDesconto = dataDesconto;
	}

	public String getNumero() {
		return this.numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public String getObservacao() {
		return this.observacao;
	}

	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}

	public BigDecimal getValorCheque() {
		return this.valorCheque;
	}

	public void setValorCheque(BigDecimal valorCheque) {
		this.valorCheque = valorCheque;
	}

	public Conta getConta() {
		return this.conta;
	}

	public void setConta(Conta conta) {
		this.conta = conta;
	}

}