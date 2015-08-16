package com.wms.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;


/**
 * The persistent class for the parcela_cartao_credito database table.
 * 
 */
@Entity
@Table(name="parcela_cartao_credito")
@NamedQuery(name="ParcelaCartaoCredito.findAll", query="SELECT p FROM ParcelaCartaoCredito p")
public class ParcelaCartaoCredito implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="id_parcela")
	private int idParcela;

	@Temporal(TemporalType.DATE)
	@Column(name="data_vencimento")
	private Date dataVencimento;

	@Column(name="n_parcela")
	private BigDecimal nParcela;

	@Column(name="parcela_cartao_creditocol")
	private String parcelaCartaoCreditocol;

	private byte status;

	@Column(name="valor_parcela")
	private BigDecimal valorParcela;

	//bi-directional many-to-one association to Conta
	@ManyToOne
	@JoinColumn(name="id_conta")
	private Conta conta;

	public ParcelaCartaoCredito() {
	}

	public int getIdParcela() {
		return this.idParcela;
	}

	public void setIdParcela(int idParcela) {
		this.idParcela = idParcela;
	}

	public Date getDataVencimento() {
		return this.dataVencimento;
	}

	public void setDataVencimento(Date dataVencimento) {
		this.dataVencimento = dataVencimento;
	}

	public BigDecimal getNParcela() {
		return this.nParcela;
	}

	public void setNParcela(BigDecimal nParcela) {
		this.nParcela = nParcela;
	}

	public String getParcelaCartaoCreditocol() {
		return this.parcelaCartaoCreditocol;
	}

	public void setParcelaCartaoCreditocol(String parcelaCartaoCreditocol) {
		this.parcelaCartaoCreditocol = parcelaCartaoCreditocol;
	}

	public byte getStatus() {
		return this.status;
	}

	public void setStatus(byte status) {
		this.status = status;
	}

	public BigDecimal getValorParcela() {
		return this.valorParcela;
	}

	public void setValorParcela(BigDecimal valorParcela) {
		this.valorParcela = valorParcela;
	}

	public Conta getConta() {
		return this.conta;
	}

	public void setConta(Conta conta) {
		this.conta = conta;
	}

}