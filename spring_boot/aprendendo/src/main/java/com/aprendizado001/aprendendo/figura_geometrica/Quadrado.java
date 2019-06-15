package com.aprendizado001.aprendendo.figura_geometrica;

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Component;

@Component
@Primary
public class Quadrado implements FigurasGeometricas {

	private double lado;

	public Quadrado() {
		this.lado = 3;
	}

	@Override
	public double getArea() {

		return (Math.pow(this.lado, 2));
	}

	@Override
	public double getPerimetro() {
		return (this.lado) * 4;
	}
	
	@Override
	public String toString() {
		return "Quadrado";
	}

	@Override
	public String getInformacoes() {
		String f = this.toString();
		
		return "Área do " + f + " = " + this.getArea() + 
				"\n" + 
				"Perímetro do " + f + " = " + this.getPerimetro();
	}

}
