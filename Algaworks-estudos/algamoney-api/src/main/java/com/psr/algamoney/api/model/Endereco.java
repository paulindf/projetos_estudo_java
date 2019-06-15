package com.psr.algamoney.api.model;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Embeddable
public class Endereco {
	
	@NotNull
	@Size(min = 10, max = 200)
	@Column(name="endereco_logradouro")
	private String logradouro;
	
	@NotNull
	@Size(min = 1, max = 10)
	@Column(name="endereco_numero")
	private String numero;
	
	@Size(min = 5, max = 50)
	@Column(name="endereco_complemento")
	private String complemento;
	
	@Size(min = 3, max = 80)
	@Column(name="endereco_bairro")
	private String bairro;
	
	@NotNull
	@Size(min = 9, max = 9)
	@Column(name="endereco_cep")
	private String cep;
	
	@NotNull
	@Size(min = 5, max = 80)
	@Column(name="endereco_cidade")
	private String cidade;
	
	@NotNull
	@Size(min = 2, max = 2)
	@Column(name="endereco_estado")
	private String estado;

	public String getLogradouro() {
		return logradouro;
	}

	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public String getComplemento() {
		return complemento;
	}

	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}
}
