package com.wms.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the conta database table.
 * 
 */
@Entity
@NamedQuery(name="Conta.findAll", query="SELECT c FROM Conta c")
public class Conta implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_conta")
	private int idConta;

	@Temporal(TemporalType.DATE)
	@Column(name="data_pagamento")
	private Date dataPagamento;

	@Temporal(TemporalType.DATE)
	@Column(name="data_vencimento")
	private Date dataVencimento;

	@Column(name="n_parcelas")
	private int nParcelas;

	@Column(name="nota_fiscal")
	private String notaFiscal;

	private String observacao;

	private byte status;

	@Column(name="tipo_conta")
	private int tipoConta;

	@Column(name="tipo_pagamento")
	private int tipoPagamento;

	@Column(name="valor_conta")
	private BigDecimal valorConta;

	//bi-directional many-to-one association to AlertaVencimento
	@OneToMany(mappedBy="conta")
	private List<AlertaVencimento> alertaVencimentos;

	public Conta() {
	}

	public int getIdConta() {
		return this.idConta;
	}

	public void setIdConta(int idConta) {
		this.idConta = idConta;
	}

	public Date getDataPagamento() {
		return this.dataPagamento;
	}

	public void setDataPagamento(Date dataPagamento) {
		this.dataPagamento = dataPagamento;
	}

	public Date getDataVencimento() {
		return this.dataVencimento;
	}

	public void setDataVencimento(Date dataVencimento) {
		this.dataVencimento = dataVencimento;
	}

	public int getNParcelas() {
		return this.nParcelas;
	}

	public void setNParcelas(int nParcelas) {
		this.nParcelas = nParcelas;
	}

	public String getNotaFiscal() {
		return this.notaFiscal;
	}

	public void setNotaFiscal(String notaFiscal) {
		this.notaFiscal = notaFiscal;
	}

	public String getObservacao() {
		return this.observacao;
	}

	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}

	public byte getStatus() {
		return this.status;
	}

	public void setStatus(byte status) {
		this.status = status;
	}

	public int getTipoConta() {
		return this.tipoConta;
	}

	public void setTipoConta(int tipoConta) {
		this.tipoConta = tipoConta;
	}

	public int getTipoPagamento() {
		return this.tipoPagamento;
	}

	public void setTipoPagamento(int tipoPagamento) {
		this.tipoPagamento = tipoPagamento;
	}

	public BigDecimal getValorConta() {
		return this.valorConta;
	}

	public void setValorConta(BigDecimal valorConta) {
		this.valorConta = valorConta;
	}

	public List<AlertaVencimento> getAlertaVencimentos() {
		return this.alertaVencimentos;
	}

	public void setAlertaVencimentos(List<AlertaVencimento> alertaVencimentos) {
		this.alertaVencimentos = alertaVencimentos;
	}

	public AlertaVencimento addAlertaVencimento(AlertaVencimento alertaVencimento) {
		getAlertaVencimentos().add(alertaVencimento);
		alertaVencimento.setConta(this);

		return alertaVencimento;
	}

	public AlertaVencimento removeAlertaVencimento(AlertaVencimento alertaVencimento) {
		getAlertaVencimentos().remove(alertaVencimento);
		alertaVencimento.setConta(null);

		return alertaVencimento;
	}

}