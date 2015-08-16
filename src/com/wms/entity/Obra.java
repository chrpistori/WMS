package com.wms.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the obra database table.
 * 
 */
@Entity
@NamedQuery(name="Obra.findAll", query="SELECT o FROM Obra o")
public class Obra implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="numero_contrato")
	private int numeroContrato;

	@Temporal(TemporalType.DATE)
	@Column(name="data_entrega")
	private Date dataEntrega;

	@Temporal(TemporalType.DATE)
	@Column(name="data_inicio")
	private Date dataInicio;

	@Temporal(TemporalType.DATE)
	@Column(name="data_prevista_termino")
	private Date dataPrevistaTermino;

	@Temporal(TemporalType.DATE)
	@Column(name="data_venda")
	private Date dataVenda;

	private String descricao;

	@Column(name="nome_obra")
	private String nomeObra;

	@Column(name="valor_previsto_venda")
	private BigDecimal valorPrevistoVenda;

	@Column(name="valor_realizado_venda")
	private BigDecimal valorRealizadoVenda;

	//bi-directional many-to-one association to Anexo
	@OneToMany(mappedBy="obra")
	private List<Anexo> anexos;

	//bi-directional many-to-one association to FaseObra
	@OneToMany(mappedBy="obra")
	private List<FaseObra> faseObras;

	//bi-directional many-to-one association to Funcionario
	@OneToMany(mappedBy="obra")
	private List<Funcionario> funcionarios;

	//bi-directional many-to-one association to Cliente
	@ManyToOne
	private Cliente cliente;

	//bi-directional many-to-one association to ContaBancaria
	@ManyToOne
	@JoinColumn(name="id_conta_bancaria")
	private ContaBancaria contaBancaria;

	//bi-directional many-to-one association to Usuario
	@ManyToOne
	private Usuario usuario;

	public Obra() {
	}

	public int getNumeroContrato() {
		return this.numeroContrato;
	}

	public void setNumeroContrato(int numeroContrato) {
		this.numeroContrato = numeroContrato;
	}

	public Date getDataEntrega() {
		return this.dataEntrega;
	}

	public void setDataEntrega(Date dataEntrega) {
		this.dataEntrega = dataEntrega;
	}

	public Date getDataInicio() {
		return this.dataInicio;
	}

	public void setDataInicio(Date dataInicio) {
		this.dataInicio = dataInicio;
	}

	public Date getDataPrevistaTermino() {
		return this.dataPrevistaTermino;
	}

	public void setDataPrevistaTermino(Date dataPrevistaTermino) {
		this.dataPrevistaTermino = dataPrevistaTermino;
	}

	public Date getDataVenda() {
		return this.dataVenda;
	}

	public void setDataVenda(Date dataVenda) {
		this.dataVenda = dataVenda;
	}

	public String getDescricao() {
		return this.descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getNomeObra() {
		return this.nomeObra;
	}

	public void setNomeObra(String nomeObra) {
		this.nomeObra = nomeObra;
	}

	public BigDecimal getValorPrevistoVenda() {
		return this.valorPrevistoVenda;
	}

	public void setValorPrevistoVenda(BigDecimal valorPrevistoVenda) {
		this.valorPrevistoVenda = valorPrevistoVenda;
	}

	public BigDecimal getValorRealizadoVenda() {
		return this.valorRealizadoVenda;
	}

	public void setValorRealizadoVenda(BigDecimal valorRealizadoVenda) {
		this.valorRealizadoVenda = valorRealizadoVenda;
	}

	public List<Anexo> getAnexos() {
		return this.anexos;
	}

	public void setAnexos(List<Anexo> anexos) {
		this.anexos = anexos;
	}

	public Anexo addAnexo(Anexo anexo) {
		getAnexos().add(anexo);
		anexo.setObra(this);

		return anexo;
	}

	public Anexo removeAnexo(Anexo anexo) {
		getAnexos().remove(anexo);
		anexo.setObra(null);

		return anexo;
	}

	public List<FaseObra> getFaseObras() {
		return this.faseObras;
	}

	public void setFaseObras(List<FaseObra> faseObras) {
		this.faseObras = faseObras;
	}

	public FaseObra addFaseObra(FaseObra faseObra) {
		getFaseObras().add(faseObra);
		faseObra.setObra(this);

		return faseObra;
	}

	public FaseObra removeFaseObra(FaseObra faseObra) {
		getFaseObras().remove(faseObra);
		faseObra.setObra(null);

		return faseObra;
	}

	public List<Funcionario> getFuncionarios() {
		return this.funcionarios;
	}

	public void setFuncionarios(List<Funcionario> funcionarios) {
		this.funcionarios = funcionarios;
	}

	public Funcionario addFuncionario(Funcionario funcionario) {
		getFuncionarios().add(funcionario);
		funcionario.setObra(this);

		return funcionario;
	}

	public Funcionario removeFuncionario(Funcionario funcionario) {
		getFuncionarios().remove(funcionario);
		funcionario.setObra(null);

		return funcionario;
	}

	public Cliente getCliente() {
		return this.cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public ContaBancaria getContaBancaria() {
		return this.contaBancaria;
	}

	public void setContaBancaria(ContaBancaria contaBancaria) {
		this.contaBancaria = contaBancaria;
	}

	public Usuario getUsuario() {
		return this.usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

}