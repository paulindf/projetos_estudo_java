package com.aprendizado001.aprendendo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;

 @SpringBootApplication
public class AprendendoApplication {

	public static void main(String[] args) {
		ApplicationContext applicationContext = SpringApplication.run(AprendendoApplication.class, args);
		
		Desenho desenho = applicationContext.getBean(Desenho.class);
		
		System.out.println(desenho.retornaInformacoes());
	}

}
