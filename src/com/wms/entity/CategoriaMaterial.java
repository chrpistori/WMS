package com.wms.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the categoria_material database table.
 * 
 */
@Entity
@Table(name="categoria_material")
@NamedQuery(name="CategoriaMaterial.findAll", query="SELECT c FROM CategoriaMaterial c")
public class CategoriaMaterial implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="id_categoria")
	private int idCategoria;

	private String descricao;

	private String nome;

	//bi-directional many-to-one association to Material
	@OneToMany(mappedBy="categoriaMaterial")
	private List<Material> materials;

	public CategoriaMaterial() {
	}

	public int getIdCategoria() {
		return this.idCategoria;
	}

	public void setIdCategoria(int idCategoria) {
		this.idCategoria = idCategoria;
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

	public List<Material> getMaterials() {
		return this.materials;
	}

	public void setMaterials(List<Material> materials) {
		this.materials = materials;
	}

	public Material addMaterial(Material material) {
		getMaterials().add(material);
		material.setCategoriaMaterial(this);

		return material;
	}

	public Material removeMaterial(Material material) {
		getMaterials().remove(material);
		material.setCategoriaMaterial(null);

		return material;
	}

}