package com.aprendizado001.aprendendo.figura_geometrica;

import org.springframework.stereotype.Component;

@Component
public class Circunferencia implements FigurasGeometricas {

	private static double pi = 3.1416;

	private double raio;
	
	public Circunferencia() {
		this.raio = 5;
	}
	
	@Override
	public double getArea() {
		return Math.pow(Circunferencia.pi * this.raio, 2);
	}

	@Override
	public double getPerimetro() {
		return (2 * Circunferencia.pi * this.raio);
	}
	
	@Override
	public String toString() {
		return "Circunferência";
	}
	
	@Override
	public String getInformacoes() {
		String f = this.toString();
		
		return "Área da " + f + " = " + this.getArea() + 
				"\n" + 
				"Perímetro da " + f + " = " + this.getPerimetro();
	}
}
