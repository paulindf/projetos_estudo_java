package com.psr.algamoney.api.utils;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class Funcoes {

	public static String retornaDataFormatada(LocalDate data) {
		if (data == null) {
			return null;
		}
		
		LocalDate dataF = data;
		dataF.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
		return dataF.toString();
	}
	
}
