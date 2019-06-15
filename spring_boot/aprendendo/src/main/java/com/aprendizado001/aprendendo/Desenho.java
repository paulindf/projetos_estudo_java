package com.aprendizado001.aprendendo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.aprendizado001.aprendendo.figura_geometrica.FigurasGeometricas;

@Component
public class Desenho {

	@Autowired
	private FigurasGeometricas figura;

	public String retornaInformacoes() {
		return this.figura.getInformacoes();
	}
	
}
