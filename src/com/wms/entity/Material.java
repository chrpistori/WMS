package com.wms.entity;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the material database table.
 * 
 */
@Entity
@NamedQuery(name="Material.findAll", query="SELECT m FROM Material m")
public class Material implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="id_material")
	private int idMaterial;

	private String descricao;

	private String marca;

	private String nome;

	//bi-directional many-to-one association to CategoriaMaterial
	@ManyToOne
	@JoinColumn(name="id_categoria")
	private CategoriaMaterial categoriaMaterial;

	public Material() {
	}

	public int getIdMaterial() {
		return this.idMaterial;
	}

	public void setIdMaterial(int idMaterial) {
		this.idMaterial = idMaterial;
	}

	public String getDescricao() {
		return this.descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getMarca() {
		return this.marca;
	}

	public void setMarca(String marca) {
		this.marca = marca;
	}

	public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public CategoriaMaterial getCategoriaMaterial() {
		return this.categoriaMaterial;
	}

	public void setCategoriaMaterial(CategoriaMaterial categoriaMaterial) {
		this.categoriaMaterial = categoriaMaterial;
	}

}