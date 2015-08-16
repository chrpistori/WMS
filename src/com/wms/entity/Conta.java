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

	//bi-directional many-to-one association to Anexo
	@OneToMany(mappedBy="conta")
	private List<Anexo> anexos;

	//bi-directional many-to-one association to Cheque
	@OneToMany(mappedBy="conta")
	private List<Cheque> cheques;

	//bi-directional many-to-one association to Lancamento
	@OneToMany(mappedBy="conta")
	private List<Lancamento> lancamentos;

	//bi-directional many-to-one association to ParcelaCartaoCredito
	@OneToMany(mappedBy="conta")
	private List<ParcelaCartaoCredito> parcelaCartaoCreditos;

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

	public List<Anexo> getAnexos() {
		return this.anexos;
	}

	public void setAnexos(List<Anexo> anexos) {
		this.anexos = anexos;
	}

	public Anexo addAnexo(Anexo anexo) {
		getAnexos().add(anexo);
		anexo.setConta(this);

		return anexo;
	}

	public Anexo removeAnexo(Anexo anexo) {
		getAnexos().remove(anexo);
		anexo.setConta(null);

		return anexo;
	}

	public List<Cheque> getCheques() {
		return this.cheques;
	}

	public void setCheques(List<Cheque> cheques) {
		this.cheques = cheques;
	}

	public Cheque addCheque(Cheque cheque) {
		getCheques().add(cheque);
		cheque.setConta(this);

		return cheque;
	}

	public Cheque removeCheque(Cheque cheque) {
		getCheques().remove(cheque);
		cheque.setConta(null);

		return cheque;
	}

	public List<Lancamento> getLancamentos() {
		return this.lancamentos;
	}

	public void setLancamentos(List<Lancamento> lancamentos) {
		this.lancamentos = lancamentos;
	}

	public Lancamento addLancamento(Lancamento lancamento) {
		getLancamentos().add(lancamento);
		lancamento.setConta(this);

		return lancamento;
	}

	public Lancamento removeLancamento(Lancamento lancamento) {
		getLancamentos().remove(lancamento);
		lancamento.setConta(null);

		return lancamento;
	}

	public List<ParcelaCartaoCredito> getParcelaCartaoCreditos() {
		return this.parcelaCartaoCreditos;
	}

	public void setParcelaCartaoCreditos(List<ParcelaCartaoCredito> parcelaCartaoCreditos) {
		this.parcelaCartaoCreditos = parcelaCartaoCreditos;
	}

	public ParcelaCartaoCredito addParcelaCartaoCredito(ParcelaCartaoCredito parcelaCartaoCredito) {
		getParcelaCartaoCreditos().add(parcelaCartaoCredito);
		parcelaCartaoCredito.setConta(this);

		return parcelaCartaoCredito;
	}

	public ParcelaCartaoCredito removeParcelaCartaoCredito(ParcelaCartaoCredito parcelaCartaoCredito) {
		getParcelaCartaoCreditos().remove(parcelaCartaoCredito);
		parcelaCartaoCredito.setConta(null);

		return parcelaCartaoCredito;
	}

}